package com.enactor.pos.mobile.visual;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

/**
 * Baseline source backed by an HTTP(S) endpoint. This covers a plain web/file server, an Artifactory
 * (or other binary) repository, and an SVN repository served over HTTP(S) — in all three the baseline
 * is retrieved with a simple {@code GET baseUrl/<scenario>/<state>.png}.
 *
 * <p>Fetched images are written into a local cache directory and reused on subsequent lookups, so the
 * network is hit at most once per state per run and the HTML report can reference the cached files.
 * The sibling {@code .meta} is fetched best-effort so field-level crop tracking still works remotely.
 * An optional {@code Authorization} header value supports token/basic-authenticated repositories.</p>
 *
 * @author Visual Regression Subsystem
 */
final class HttpBaselineProvider implements BaselineProvider {

	private static final int CONNECT_TIMEOUT_MS = 10_000;
	private static final int READ_TIMEOUT_MS = 60_000;

	private final String baseUrl;
	private final File cacheDir;
	private final String authHeader;

	HttpBaselineProvider(String baseUrl, File cacheDir, String authHeader) {
		this.baseUrl = stripTrailingSlash(baseUrl);
		this.cacheDir = cacheDir;
		this.authHeader = (authHeader == null || authHeader.trim().isEmpty()) ? null : authHeader.trim();
	}

	@Override
	public File getBaseline(String scenario, String stateFile) {
		File cached = new File(new File(cacheDir, scenario), stateFile);
		if (cached.isFile()) {
			return cached; // already downloaded this run (or a previous one)
		}
		String pngUrl = baseUrl + "/" + enc(scenario) + "/" + enc(stateFile);
		if (!download(pngUrl, cached)) {
			return null;
		}
		// Best-effort: bring the bounding-box side-car along so remote baselines support crop fields.
		String metaFile = stateFile.replace(".png", ".meta");
		download(baseUrl + "/" + enc(scenario) + "/" + enc(metaFile), new File(new File(cacheDir, scenario), metaFile));
		return cached.isFile() ? cached : null;
	}

	private boolean download(String url, File dest) {
		HttpURLConnection connection = null;
		try {
			connection = (HttpURLConnection) new URL(url).openConnection();
			connection.setInstanceFollowRedirects(true);
			connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
			connection.setReadTimeout(READ_TIMEOUT_MS);
			if (authHeader != null) {
				connection.setRequestProperty("Authorization", authHeader);
			}
			int status = connection.getResponseCode();
			if (status != HttpURLConnection.HTTP_OK) {
				return false; // 404 = no baseline for this state (normal); other codes = surface as missing
			}
			dest.getParentFile().mkdirs();
			try (InputStream in = connection.getInputStream()) {
				Files.copy(in, dest.toPath(), StandardCopyOption.REPLACE_EXISTING);
			}
			return true;
		} catch (IOException e) {
			System.err.println("[VISUAL COMPARE] Baseline download failed for " + url + ": " + e.getMessage());
			return false;
		} finally {
			if (connection != null) {
				connection.disconnect();
			}
		}
	}

	/** Scenario/state names are already sanitised to a URL-safe alphabet; only guard stray spaces. */
	private static String enc(String segment) {
		return segment.replace(" ", "%20");
	}

	private static String stripTrailingSlash(String value) {
		return value.endsWith("/") ? value.substring(0, value.length() - 1) : value;
	}
}

package com.enactor.pos.mobile.visual;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;

/**
 * Baseline source backed by a Subversion repository accessed through the {@code svn} command-line
 * client. Used for {@code svn://}, {@code svn+ssh://}, and the explicit {@code svn+http(s)://} schemes.
 * Each baseline is exported into a local cache with {@code svn export} and reused afterwards.
 *
 * <p>Requires the {@code svn} client on the {@code PATH}. Note that an SVN repository served over plain
 * HTTP(S) can also be read with {@link HttpBaselineProvider} by pointing {@code BaselineDir} straight at
 * the {@code https://…} URL — that path needs no svn client. Use this provider when you specifically
 * want svn semantics (authentication config, {@code svn+ssh}, etc.).</p>
 *
 * @author Visual Regression Subsystem
 */
final class SvnBaselineProvider implements BaselineProvider {

	private final String baseUrl;
	private final File cacheDir;

	SvnBaselineProvider(String baseUrl, File cacheDir) {
		this.baseUrl = stripTrailingSlash(baseUrl);
		this.cacheDir = cacheDir;
	}

	@Override
	public File getBaseline(String scenario, String stateFile) {
		File cached = new File(new File(cacheDir, scenario), stateFile);
		if (cached.isFile()) {
			return cached;
		}
		if (!svnExport(baseUrl + "/" + scenario + "/" + stateFile, cached)) {
			return null;
		}
		// Best-effort side-car so field crops work for svn baselines too.
		String metaFile = stateFile.replace(".png", ".meta");
		svnExport(baseUrl + "/" + scenario + "/" + metaFile, new File(new File(cacheDir, scenario), metaFile));
		return cached.isFile() ? cached : null;
	}

	private boolean svnExport(String url, File dest) {
		try {
			dest.getParentFile().mkdirs();
			if (dest.exists() && !dest.delete()) {
				return false;
			}
			ProcessBuilder pb = new ProcessBuilder(
					"svn", "export", "--force", "--non-interactive", "--quiet", url, dest.getAbsolutePath());
			pb.redirectErrorStream(true);
			Process process = pb.start();
			// Drain output so the process cannot block on a full pipe (svn export writes the file itself).
			try (BufferedReader reader = new BufferedReader(
					new InputStreamReader(process.getInputStream(), StandardCharsets.UTF_8))) {
				while (reader.readLine() != null) {
					// discard
				}
			}
			int code = process.waitFor();
			return code == 0 && dest.isFile() && dest.length() > 0;
		} catch (IOException | InterruptedException e) {
			if (e instanceof InterruptedException) {
				Thread.currentThread().interrupt();
			}
			System.err.println("[VISUAL COMPARE] 'svn export' failed for " + url + ": " + e.getMessage()
					+ " (is the 'svn' command-line client installed and on PATH?)");
			return false;
		}
	}

	private static String stripTrailingSlash(String value) {
		return value.endsWith("/") ? value.substring(0, value.length() - 1) : value;
	}
}

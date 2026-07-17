package com.enactor.pos.mobile.visual;

import java.io.File;
import java.net.URI;

/**
 * Chooses the right {@link BaselineProvider} for the configured {@code VisualRegression.BaselineDir},
 * so a single property can point at any supported source:
 *
 * <ul>
 *   <li><b>Local / network</b> — a path, a mapped drive ({@code Z:\...}), a UNC share
 *       ({@code \\host\share\...}) or a {@code file://} URI &rarr; {@link LocalBaselineProvider}.</li>
 *   <li><b>HTTP / Artifactory / SVN-over-HTTP</b> — {@code http://} or {@code https://}
 *       &rarr; {@link HttpBaselineProvider}.</li>
 *   <li><b>SVN</b> — {@code svn://}, {@code svn+ssh://}, {@code svn+http://}, {@code svn+https://}
 *       &rarr; {@link SvnBaselineProvider} (via the {@code svn} client).</li>
 * </ul>
 *
 * @author Visual Regression Subsystem
 */
final class BaselineProviders {

	private BaselineProviders() {
	}

	static BaselineProvider create(VisualRegressionConfig config) {
		String location = config.getBaselineDir().trim();
		File cacheDir = new File(config.getBaselineCacheDir());
		String lower = location.toLowerCase();

		if (lower.startsWith("http://") || lower.startsWith("https://")) {
			return new HttpBaselineProvider(location, cacheDir, config.getBaselineAuthHeader());
		}
		if (isSvn(lower)) {
			return new SvnBaselineProvider(toSvnUrl(location), cacheDir);
		}
		return new LocalBaselineProvider(toLocalFile(location));
	}

	/** @return {@code true} if the location denotes a remote source that cannot be listed like a folder. */
	static boolean isRemote(String location) {
		if (location == null) {
			return false;
		}
		String lower = location.trim().toLowerCase();
		return lower.startsWith("http://") || lower.startsWith("https://") || isSvn(lower);
	}

	private static boolean isSvn(String lower) {
		return lower.startsWith("svn://") || lower.startsWith("svn+ssh://")
				|| lower.startsWith("svn+http://") || lower.startsWith("svn+https://");
	}

	/** Strips the {@code svn+} marker from DAV schemes so the {@code svn} client gets a plain URL. */
	private static String toSvnUrl(String location) {
		String lower = location.toLowerCase();
		if (lower.startsWith("svn+http://") || lower.startsWith("svn+https://")) {
			return location.substring("svn+".length());
		}
		return location; // svn:// and svn+ssh:// are understood by svn as-is
	}

	private static File toLocalFile(String location) {
		if (location.toLowerCase().startsWith("file:")) {
			try {
				return new File(URI.create(location.replace(" ", "%20")));
			} catch (Exception ignored) {
				// Fall through to treating it as a plain path.
			}
		}
		return new File(location);
	}
}

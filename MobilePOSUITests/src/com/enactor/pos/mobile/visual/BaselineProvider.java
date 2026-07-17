package com.enactor.pos.mobile.visual;

import java.io.File;

/**
 * Resolves the baseline image for a given scenario/state to a <em>local</em> {@link File} the
 * comparison can read, regardless of where the baselines actually live (local drive, network share,
 * HTTP server, Artifactory, or SVN). Remote implementations download into a local cache and return the
 * cached file; the rest of the pipeline stays unchanged and always works with a real local file.
 *
 * <p>The concrete provider is chosen by {@link BaselineProviders#create(VisualRegressionConfig)} from
 * the scheme of {@code VisualRegression.BaselineDir}, so a single configuration property selects the
 * source.</p>
 *
 * @author Visual Regression Subsystem
 */
public interface BaselineProvider {

	/**
	 * @param scenario  the scenario (folder) name
	 * @param stateFile the state PNG file name (e.g. {@code 001_Given_....png})
	 * @return a readable local file for this baseline, or {@code null} if it does not exist / could not
	 *         be fetched
	 */
	File getBaseline(String scenario, String stateFile);

	/**
	 * @return the local root directory when baselines are on the local filesystem (so the batch runner
	 *         can enumerate them), or {@code null} for remote sources that cannot be listed.
	 */
	default File localRoot() {
		return null;
	}
}

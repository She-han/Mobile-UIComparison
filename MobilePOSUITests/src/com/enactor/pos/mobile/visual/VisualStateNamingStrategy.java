package com.enactor.pos.mobile.visual;

/**
 * Encapsulates the file-system naming rules for captured states so that the produced folder and file
 * names line up exactly with what the standalone {@code VisualRegressionEngine} expects to read back.
 *
 * <p>Two rules matter for interoperability with the engine:</p>
 * <ol>
 *   <li>The per-scenario folder name is sanitised with the same character policy the engine uses
 *       ({@code [^a-zA-Z0-9.-] -> '_'}), guaranteeing that the folder written here matches the folder
 *       the engine derives from the same scenario name.</li>
 *   <li>State (step) file names are prefixed with a zero-padded, monotonically increasing index. The
 *       engine sorts the captured PNGs alphabetically before rendering, so the zero-padded prefix is
 *       what preserves true execution order in the report.</li>
 * </ol>
 *
 * @author Visual Regression Subsystem
 */
public final class VisualStateNamingStrategy {

	/** Character policy shared with the engine's own sanitisation. */
	private static final String ILLEGAL_CHARS = "[^a-zA-Z0-9.-]";
	private static final String REPLACEMENT = "_";

	/** Width of the ordering prefix; three digits supports up to 999 steps per scenario. */
	private static final int INDEX_WIDTH = 3;

	/** Cap on the descriptive portion so path lengths stay within OS limits. */
	private static final int MAX_LABEL_LENGTH = 80;

	/**
	 * Sanitises a scenario (test case) name into a safe folder name.
	 *
	 * @param scenarioName the raw Cucumber scenario name
	 * @return a file-system-safe folder name
	 */
	public String scenarioFolderName(String scenarioName) {
		return sanitise(scenarioName == null ? "unnamed_scenario" : scenarioName);
	}

	/**
	 * Builds the ordered PNG file name for a single step/state.
	 *
	 * @param stepIndex   1-based position of the step within the scenario
	 * @param stepLabel   human-readable step text (keyword + text), may be {@code null}
	 * @return an ordered, sanitised {@code .png} file name (e.g. {@code 001_When_I_tap_Pay.png})
	 */
	public String stateFileName(int stepIndex, String stepLabel) {
		String label = sanitise(stepLabel == null ? "step" : stepLabel);
		if (label.length() > MAX_LABEL_LENGTH) {
			label = label.substring(0, MAX_LABEL_LENGTH);
		}
		return pad(stepIndex) + REPLACEMENT + label + ".png";
	}

	/**
	 * Derives the metadata side-car name (bounding boxes) from a PNG state file name, matching the
	 * engine's {@code .png -> .meta} convention.
	 *
	 * @param stateFileName the PNG file name produced by {@link #stateFileName(int, String)}
	 * @return the corresponding {@code .meta} file name
	 */
	public String metaFileName(String stateFileName) {
		return stateFileName.replace(".png", ".meta");
	}

	private String sanitise(String raw) {
		String cleaned = raw.trim().replaceAll(ILLEGAL_CHARS, REPLACEMENT);
		// Collapse runs of underscores for readability without affecting uniqueness.
		cleaned = cleaned.replaceAll(REPLACEMENT + "{2,}", REPLACEMENT);
		if (cleaned.isEmpty()) {
			cleaned = "unnamed";
		}
		return cleaned;
	}

	private String pad(int index) {
		return String.format("%0" + INDEX_WIDTH + "d", Math.max(index, 0));
	}
}

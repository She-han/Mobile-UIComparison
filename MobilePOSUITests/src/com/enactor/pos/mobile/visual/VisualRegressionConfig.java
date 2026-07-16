package com.enactor.pos.mobile.visual;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Properties;

/**
 * Immutable, lazily-loaded view over the visual-regression settings held in
 * {@code automation-test-config.properties}.
 *
 * <p>The property keys are intentionally identical to the ones consumed by the standalone
 * {@code VisualRegressionEngine} so that the capture side (this module) and the comparison/report
 * side (the engine) share a single source of truth. The file is resolved first from the process
 * working directory and then from the class-path, mirroring the engine's own resolution order.</p>
 *
 * <p>Recognised keys:</p>
 * <ul>
 *   <li>{@code VisualRegression.Enabled} - master on/off switch for per-step capture (default {@code true}).</li>
 *   <li>{@code VisualRegression.OutputDir} - root folder for captured actual images
 *       (default {@code build/visual_outputs/actual}, matching the engine).</li>
 *   <li>{@code VisualRegression.CropFields} - comma-separated list of logical field names to track.</li>
 *   <li>{@code VisualRegression.CropField.<name>} - the Appium resource-id for each tracked field.</li>
 * </ul>
 *
 * @author Visual Regression Subsystem
 */
public final class VisualRegressionConfig {

	private static final String CONFIG_FILE_NAME = "automation-test-config.properties";
	private static final String DEFAULT_OUTPUT_DIR = "build/visual_outputs/actual";
	private static final String DEFAULT_BASELINE_DIR = "build/visual_outputs/baseline";
	private static final String DEFAULT_REPORT_DIR = "build/reports/visual-regression";
	private static final String DEFAULT_DINO_URL = "http://localhost:8000/compare";
	private static final double DEFAULT_SIMILARITY_THRESHOLD = 0.95d;
	private static final double DEFAULT_FIELD_SIMILARITY_THRESHOLD = 0.80d;

	private static final String KEY_PREFIX = "VisualRegression.";
	private static final String KEY_ENABLED = "VisualRegression.Enabled";
	private static final String KEY_COMPARE_EACH_STEP = "VisualRegression.CompareEachStep";
	private static final String KEY_FAIL_SCENARIO_ON_UNMATCH = "VisualRegression.FailScenarioOnUnmatch";
	private static final String KEY_OUTPUT_DIR = "VisualRegression.OutputDir";
	private static final String KEY_CROP_FIELDS = "VisualRegression.CropFields";
	private static final String KEY_CROP_FIELD_PREFIX = "VisualRegression.CropField.";
	private static final String KEY_BASELINE_DIR = "VisualRegression.BaselineDir";
	private static final String KEY_REPORT_DIR = "VisualRegression.ReportDir";
	private static final String KEY_DINO_URL = "VisualRegression.DinoServerUrl";
	private static final String KEY_SIMILARITY_THRESHOLD = "VisualRegression.SimilarityThreshold";
	private static final String KEY_FIELD_SIMILARITY_THRESHOLD = "VisualRegression.FieldSimilarityThreshold";
	private static final String KEY_FIELD_THRESHOLD_PREFIX = "VisualRegression.FieldThreshold.";

	/** Eagerly-initialised, thread-safe singleton (holder idiom). */
	private static final class Holder {
		private static final VisualRegressionConfig INSTANCE = new VisualRegressionConfig();
	}

	private final boolean enabled;
	private final boolean compareEachStep;
	private final boolean failScenarioOnUnmatch;
	private final String outputDir;
	private final Map<String, String> cropFields;
	private final String baselineDir;
	private final String reportDir;
	private final String dinoServerUrl;
	private final double similarityThreshold;
	private final double fieldSimilarityThreshold;
	private final Map<String, Double> fieldThresholds;

	private VisualRegressionConfig() {
		Properties props = load();
		this.enabled = Boolean.parseBoolean(props.getProperty(KEY_ENABLED, "true").trim());
		this.compareEachStep = Boolean.parseBoolean(props.getProperty(KEY_COMPARE_EACH_STEP, "true").trim());
		this.failScenarioOnUnmatch = Boolean.parseBoolean(
				props.getProperty(KEY_FAIL_SCENARIO_ON_UNMATCH, "false").trim());
		this.outputDir = trimmedOrDefault(props.getProperty(KEY_OUTPUT_DIR), DEFAULT_OUTPUT_DIR);
		this.cropFields = Collections.unmodifiableMap(readCropFields(props));
		this.baselineDir = trimmedOrDefault(props.getProperty(KEY_BASELINE_DIR), DEFAULT_BASELINE_DIR);
		this.reportDir = trimmedOrDefault(props.getProperty(KEY_REPORT_DIR), DEFAULT_REPORT_DIR);
		this.dinoServerUrl = trimmedOrDefault(props.getProperty(KEY_DINO_URL), DEFAULT_DINO_URL);
		this.similarityThreshold = parseDouble(props.getProperty(KEY_SIMILARITY_THRESHOLD), DEFAULT_SIMILARITY_THRESHOLD);
		this.fieldSimilarityThreshold = parseDouble(props.getProperty(KEY_FIELD_SIMILARITY_THRESHOLD),
				DEFAULT_FIELD_SIMILARITY_THRESHOLD);
		this.fieldThresholds = Collections.unmodifiableMap(readFieldThresholds(props));
	}

	/**
	 * @return the shared configuration instance
	 */
	public static VisualRegressionConfig getInstance() {
		return Holder.INSTANCE;
	}

	/**
	 * @return {@code true} if per-step screenshot capture should run
	 */
	public boolean isEnabled() {
		return enabled;
	}

	/**
	 * @return {@code true} if each step's screenshot should be compared against its baseline inline,
	 *         during the run (the plugin path), rather than only by the post-run batch runner.
	 *         Default {@code true}. Turn off while establishing baselines (capture-only).
	 */
	public boolean isCompareEachStep() {
		return compareEachStep;
	}

	/**
	 * @return {@code true} if a scenario should be <em>failed</em> when one or more of its steps is
	 *         visually unmatched during inline comparison. Requires {@link #isCompareEachStep()}.
	 *         Default {@code false} — visual results are advisory unless this is explicitly enabled.
	 */
	public boolean isFailScenarioOnUnmatch() {
		return failScenarioOnUnmatch;
	}

	/**
	 * @return root directory (relative or absolute) under which per-scenario folders are created
	 */
	public String getOutputDir() {
		return outputDir;
	}

	/**
	 * @return an unmodifiable map of logical field name to Appium resource-id for tracked crop fields
	 */
	public Map<String, String> getCropFields() {
		return cropFields;
	}

	/**
	 * @return root directory holding the approved baseline images (same per-scenario layout as the
	 *         actual output). Default {@code build/visual_outputs/baseline}.
	 */
	public String getBaselineDir() {
		return baselineDir;
	}

	/**
	 * @return directory where the comparison run writes its HTML report and rendered diff images.
	 *         Default {@code build/reports/visual-regression}.
	 */
	public String getReportDir() {
		return reportDir;
	}

	/**
	 * @return full URL of the DINOv2 comparison endpoint. Default {@code http://localhost:8000/compare}.
	 */
	public String getDinoServerUrl() {
		return dinoServerUrl;
	}

	/**
	 * @return minimum {@code global_similarity} (0..1) for a state to count as a visual pass.
	 */
	public double getSimilarityThreshold() {
		return similarityThreshold;
	}

	/**
	 * Resolves the pass threshold for a single tracked field, honouring a per-field override
	 * ({@code VisualRegression.FieldThreshold.<name>}) and otherwise the shared field default.
	 *
	 * @param fieldName the logical field name
	 * @return the similarity threshold (0..1) for that field
	 */
	public double getFieldThreshold(String fieldName) {
		Double override = fieldThresholds.get(fieldName);
		return override != null ? override : fieldSimilarityThreshold;
	}

	private static Map<String, Double> readFieldThresholds(Properties props) {
		Map<String, Double> thresholds = new LinkedHashMap<>();
		for (String key : props.stringPropertyNames()) {
			if (key.startsWith(KEY_FIELD_THRESHOLD_PREFIX)) {
				String name = key.substring(KEY_FIELD_THRESHOLD_PREFIX.length()).trim();
				if (!name.isEmpty()) {
					thresholds.put(name, parseDouble(props.getProperty(key), DEFAULT_FIELD_SIMILARITY_THRESHOLD));
				}
			}
		}
		return thresholds;
	}

	private static double parseDouble(String value, double fallback) {
		if (value == null || value.trim().isEmpty()) {
			return fallback;
		}
		try {
			return Double.parseDouble(value.trim());
		} catch (NumberFormatException e) {
			return fallback;
		}
	}

	private static Properties load() {
		Properties props = new Properties();
		try {
			File configFile = new File(CONFIG_FILE_NAME);
			if (configFile.exists()) {
				try (FileInputStream fis = new FileInputStream(configFile)) {
					props.load(fis);
				}
			} else {
				try (InputStream is = VisualRegressionConfig.class.getClassLoader()
						.getResourceAsStream(CONFIG_FILE_NAME)) {
					if (is != null) {
						props.load(is);
					}
				}
			}
		} catch (Exception e) {
			System.err.println("[VISUAL CAPTURE] Warning: could not load " + CONFIG_FILE_NAME
					+ " - falling back to defaults. Cause: " + e.getMessage());
		}
		// System properties win over the file so a run can be configured entirely from the command line
		// (e.g. Maven -DVisualRegression.CompareEachStep=true, or an Eclipse launch configuration). This
		// lets a project adopt the tooling without shipping a properties file.
		overlaySystemProperties(props);
		return props;
	}

	/** Overlays any {@code -DVisualRegression.*} system properties onto the loaded file properties. */
	private static void overlaySystemProperties(Properties props) {
		for (String name : System.getProperties().stringPropertyNames()) {
			if (name.startsWith(KEY_PREFIX)) {
				String value = System.getProperty(name);
				if (value != null) {
					props.setProperty(name, value);
				}
			}
		}
	}

	private static Map<String, String> readCropFields(Properties props) {
		Map<String, String> fields = new LinkedHashMap<>();
		String fieldsCsv = props.getProperty(KEY_CROP_FIELDS);
		if (fieldsCsv == null || fieldsCsv.trim().isEmpty()) {
			return fields;
		}
		for (String rawName : fieldsCsv.split(",")) {
			String name = rawName.trim();
			if (name.isEmpty()) {
				continue;
			}
			String resourceId = props.getProperty(KEY_CROP_FIELD_PREFIX + name);
			if (resourceId != null && !resourceId.trim().isEmpty()) {
				fields.put(name, resourceId.trim());
			} else {
				System.err.println("[VISUAL CAPTURE] Warning: missing resource id for crop field '" + name + "'.");
			}
		}
		return fields;
	}

	private static String trimmedOrDefault(String value, String fallback) {
		return (value != null && !value.trim().isEmpty()) ? value.trim() : fallback;
	}
}

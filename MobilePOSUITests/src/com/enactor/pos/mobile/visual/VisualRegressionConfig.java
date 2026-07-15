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

	private static final String KEY_ENABLED = "VisualRegression.Enabled";
	private static final String KEY_OUTPUT_DIR = "VisualRegression.OutputDir";
	private static final String KEY_CROP_FIELDS = "VisualRegression.CropFields";
	private static final String KEY_CROP_FIELD_PREFIX = "VisualRegression.CropField.";

	/** Eagerly-initialised, thread-safe singleton (holder idiom). */
	private static final class Holder {
		private static final VisualRegressionConfig INSTANCE = new VisualRegressionConfig();
	}

	private final boolean enabled;
	private final String outputDir;
	private final Map<String, String> cropFields;

	private VisualRegressionConfig() {
		Properties props = load();
		this.enabled = Boolean.parseBoolean(props.getProperty(KEY_ENABLED, "true").trim());
		this.outputDir = trimmedOrDefault(props.getProperty(KEY_OUTPUT_DIR), DEFAULT_OUTPUT_DIR);
		this.cropFields = Collections.unmodifiableMap(readCropFields(props));
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
		return props;
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

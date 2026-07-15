package com.enactor.pos.mobile.visual;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.openqa.selenium.By;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.Rectangle;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

/**
 * Captures a single screen state (one Cucumber step) and persists it to disk in the exact layout the
 * standalone {@code VisualRegressionEngine} reads:
 *
 * <pre>
 *   &lt;outputDir&gt;/&lt;scenario&gt;/&lt;NNN_step&gt;.png     - the screenshot
 *   &lt;outputDir&gt;/&lt;scenario&gt;/&lt;NNN_step&gt;.meta    - bounding boxes for tracked crop fields
 *   &lt;outputDir&gt;/&lt;scenario&gt;/status_passed.txt    - written once per scenario
 *   &lt;outputDir&gt;/&lt;scenario&gt;/status_failed.txt    - written once per scenario
 * </pre>
 *
 * <p>The bounding-box extraction mirrors the engine's own DOM-first approach but is written against
 * the Appium 7 client API used by this project ({@link org.openqa.selenium.By} + {@code getRect()}),
 * so capture and comparison stay decoupled yet on-disk compatible.</p>
 *
 * <p>Design notes: the capturer is a small, stateless, side-effecting service. Its collaborators
 * ({@link VisualRegressionConfig} and {@link VisualStateNamingStrategy}) are injected through the
 * constructor to keep it testable, and every public operation is fully guarded so that a capture
 * failure is logged but never propagates into the functional test.</p>
 *
 * @author Visual Regression Subsystem
 */
public class StepScreenshotCapturer {

	private static final String LOG_PREFIX = "[VISUAL CAPTURE] ";
	private static final String STATUS_PASSED_FILE = "status_passed.txt";
	private static final String STATUS_FAILED_FILE = "status_failed.txt";

	private final VisualRegressionConfig config;
	private final VisualStateNamingStrategy namingStrategy;

	/**
	 * Preferred constructor for production use - resolves collaborators from their shared instances.
	 */
	public StepScreenshotCapturer() {
		this(VisualRegressionConfig.getInstance(), new VisualStateNamingStrategy());
	}

	/**
	 * Constructor for explicit dependency injection (used by tests).
	 *
	 * @param config         the visual-regression configuration
	 * @param namingStrategy the file/folder naming strategy
	 */
	public StepScreenshotCapturer(VisualRegressionConfig config, VisualStateNamingStrategy namingStrategy) {
		this.config = config;
		this.namingStrategy = namingStrategy;
	}

	/**
	 * Captures the current screen for one step and writes the PNG plus its metadata side-car.
	 *
	 * @param driver       the live Appium driver for the current thread
	 * @param scenarioName the Cucumber scenario (test case) name - becomes the folder name
	 * @param stepIndex    1-based ordinal of the step within the scenario
	 * @param stepLabel    human-readable step text used in the file name
	 */
	public void capture(WebDriver driver, String scenarioName, int stepIndex, String stepLabel) {
		if (driver == null) {
			return;
		}
		try {
			File scenarioDir = scenarioDirectory(scenarioName);
			String stateFileName = namingStrategy.stateFileName(stepIndex, stepLabel);

			// 1) DOM-first metadata extraction for every tracked crop field.
			Properties metaData = extractFieldMetadata(driver);

			// 2) Snap the picture and store it.
			File srcFile = ((TakesScreenshot) driver).getScreenshotAs(OutputType.FILE);
			File destFile = new File(scenarioDir, stateFileName);
			Files.copy(srcFile.toPath(), destFile.toPath(), StandardCopyOption.REPLACE_EXISTING);

			// 3) Persist bounding boxes alongside the image.
			File metaFile = new File(scenarioDir, namingStrategy.metaFileName(stateFileName));
			try (FileOutputStream fos = new FileOutputStream(metaFile)) {
				metaData.store(fos, "Dynamic Bounding Boxes");
			}
		} catch (Exception e) {
			// Never let a visual-capture problem affect the functional test outcome.
			System.err.println(LOG_PREFIX + "Failed to capture step screenshot for scenario '"
					+ scenarioName + "' (step " + stepIndex + "): " + e.getMessage());
		}
	}

	/**
	 * Writes the scenario-level pass/fail marker consumed by the engine's report generator.
	 *
	 * @param scenarioName the Cucumber scenario name
	 * @param passed       whether the scenario passed functionally
	 */
	public void writeScenarioStatus(String scenarioName, boolean passed) {
		try {
			File scenarioDir = scenarioDirectory(scenarioName);
			new File(scenarioDir, passed ? STATUS_PASSED_FILE : STATUS_FAILED_FILE).createNewFile();
		} catch (Exception e) {
			System.err.println(LOG_PREFIX + "Failed to write status for scenario '" + scenarioName
					+ "': " + e.getMessage());
		}
	}

	private File scenarioDirectory(String scenarioName) {
		File dir = new File(config.getOutputDir(), namingStrategy.scenarioFolderName(scenarioName));
		dir.mkdirs();
		return dir;
	}

	/**
	 * Locates each configured crop field on screen and records its bounding box. Missing or
	 * zero-sized fields are recorded as zeros so the metadata schema stays stable for the engine.
	 */
	private Properties extractFieldMetadata(WebDriver driver) {
		Properties metaData = new Properties();
		for (Map.Entry<String, String> field : config.getCropFields().entrySet()) {
			String fieldName = field.getKey();
			Rectangle rect = firstVisibleRectangle(driver, field.getValue());
			if (rect != null) {
				writeRectangle(metaData, fieldName, rect.getX(), rect.getY(), rect.getWidth(), rect.getHeight());
			} else {
				writeRectangle(metaData, fieldName, 0, 0, 0, 0);
			}
		}
		return metaData;
	}

	private Rectangle firstVisibleRectangle(WebDriver driver, String resourceId) {
		try {
			List<? extends WebElement> elements = driver.findElements(By.id(resourceId));
			for (WebElement element : elements) {
				Rectangle rect = element.getRect();
				if (rect.getWidth() > 0 && rect.getHeight() > 0) {
					return rect;
				}
			}
		} catch (Exception ignored) {
			// A locator that does not resolve on this screen is expected and non-fatal.
		}
		return null;
	}

	private void writeRectangle(Properties metaData, String fieldName, int x, int y, int width, int height) {
		metaData.setProperty(fieldName + ".x", String.valueOf(x));
		metaData.setProperty(fieldName + ".y", String.valueOf(y));
		metaData.setProperty(fieldName + ".width", String.valueOf(width));
		metaData.setProperty(fieldName + ".height", String.valueOf(height));
	}
}

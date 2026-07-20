package com.enactor.pos.mobile.visual;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.imageio.ImageIO;

import org.openqa.selenium.By;
import org.openqa.selenium.HasCapabilities;
import org.openqa.selenium.JavascriptExecutor;
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
 * <p>Crop fields are located with a small locator DSL so the same element a test step targets can be
 * tracked visually. A locator is either a bare id (native resource-id or an HTML {@code id}) or a
 * {@code strategy=value} form:</p>
 * <ul>
 *   <li>{@code id=...} / bare value - {@link By#id(String)} (HTML {@code id} in a WebView, resource-id in native)</li>
 *   <li>{@code test-component-id=...} (or {@code tcid=...}) - matches {@code @test-component-id} via XPath</li>
 *   <li>{@code xpath=...}, {@code css=...}, {@code name=...}, {@code class=...}</li>
 *   <li>{@code accessibility-id=...} (or {@code aid=...}) - matches native {@code @content-desc} via XPath</li>
 * </ul>
 *
 * <p>Because this project's POS runs inside a WebView, element coordinates come back in CSS pixels
 * relative to the web viewport, whereas the screenshot is at device resolution. When
 * {@link VisualRegressionConfig#isCropAutoScale()} is on (the default), each box is scaled by the
 * ratio of screenshot width to {@code window.innerWidth} and shifted down by the status-bar height, so
 * the recorded box lines up with the actual pixels. In a native context the JavaScript probe returns
 * nothing and coordinates are recorded unchanged.</p>
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

	/** Recognised {@code strategy=} prefixes; anything else is treated as a bare id for back-compat. */
	private static final Set<String> LOCATOR_STRATEGIES = new HashSet<>(Arrays.asList(
			"id", "xpath", "css", "name", "class", "test-component-id", "tcid", "accessibility-id", "aid"));

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
	 * @return the PNG file written for this step, or {@code null} if nothing was captured (no driver
	 *         or a guarded failure) - lets callers (e.g. inline comparison) act on the fresh image
	 */
	public File capture(WebDriver driver, String scenarioName, int stepIndex, String stepLabel) {
		if (driver == null) {
			return null;
		}
		try {
			File scenarioDir = scenarioDirectory(scenarioName);
			String stateFileName = namingStrategy.stateFileName(stepIndex, stepLabel);

			// 1) Snap the picture first so the crop transform knows the screenshot's pixel width (needed
			//    to map WebView CSS-pixel element coordinates onto the device-resolution image).
			File srcFile = ((TakesScreenshot) driver).getScreenshotAs(OutputType.FILE);
			int screenshotWidthPx = readImageWidth(srcFile);

			// 2) DOM-first metadata extraction for every tracked crop field, scaled to the screenshot.
			Properties metaData = extractFieldMetadata(driver, screenshotWidthPx);

			// 3) Store the image.
			File destFile = new File(scenarioDir, stateFileName);
			Files.copy(srcFile.toPath(), destFile.toPath(), StandardCopyOption.REPLACE_EXISTING);

			// 4) Persist bounding boxes alongside the image.
			File metaFile = new File(scenarioDir, namingStrategy.metaFileName(stateFileName));
			try (FileOutputStream fos = new FileOutputStream(metaFile)) {
				metaData.store(fos, "Dynamic Bounding Boxes");
			}
			return destFile;
		} catch (Exception e) {
			// Never let a visual-capture problem affect the functional test outcome.
			System.err.println(LOG_PREFIX + "Failed to capture step screenshot for scenario '"
					+ scenarioName + "' (step " + stepIndex + "): " + e.getMessage());
			return null;
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

	/**
	 * Deletes any previously captured images/metadata AND rendered diff images for a scenario so a fresh
	 * run starts from a clean slate. Intended to be called once when the scenario starts; the directories
	 * are recreated lazily as the run proceeds. Fully guarded - a cleanup failure never affects the test.
	 *
	 * @param scenarioName the Cucumber scenario name whose capture + diff folders should be cleared
	 */
	public void resetScenario(String scenarioName) {
		String folder = namingStrategy.scenarioFolderName(scenarioName);
		try {
			// 1) captured "actual" images + metadata + status markers
			deleteRecursively(new File(config.getOutputDir(), folder));
			// 2) rendered diff images for this scenario under the report's diffs/ tree
			deleteRecursively(new File(new File(config.getReportDir(), "diffs"), folder));
		} catch (Exception e) {
			System.err.println(LOG_PREFIX + "Failed to reset captures for scenario '" + scenarioName
					+ "': " + e.getMessage());
		}
	}

	/** Recursively deletes a file or directory tree; missing paths are a no-op. */
	private void deleteRecursively(File file) {
		if (file == null || !file.exists()) {
			return;
		}
		File[] children = file.listFiles();
		if (children != null) {
			for (File child : children) {
				deleteRecursively(child);
			}
		}
		if (!file.delete()) {
			// Best-effort: a locked file (e.g. open in a viewer) is logged but not fatal.
			System.err.println(LOG_PREFIX + "Could not delete " + file.getAbsolutePath());
		}
	}

	private File scenarioDirectory(String scenarioName) {
		File dir = new File(config.getOutputDir(), namingStrategy.scenarioFolderName(scenarioName));
		dir.mkdirs();
		return dir;
	}

	/**
	 * Locates each configured crop field on screen and records its bounding box (transformed to
	 * screenshot pixels). Missing or zero-sized fields are recorded as zeros so the metadata schema
	 * stays stable for the engine.
	 */
	private Properties extractFieldMetadata(WebDriver driver, int screenshotWidthPx) {
		Properties metaData = new Properties();
		Transform transform = computeTransform(driver, screenshotWidthPx);
		for (Map.Entry<String, String> field : config.getCropFields().entrySet()) {
			String fieldName = field.getKey();
			int[] box = firstVisibleBox(driver, field.getValue(), transform);
			if (box != null) {
				writeRectangle(metaData, fieldName, box[0], box[1], box[2], box[3]);
			} else {
				writeRectangle(metaData, fieldName, 0, 0, 0, 0);
			}
		}
		return metaData;
	}

	/**
	 * @return {@code {x, y, width, height}} in screenshot pixels for the first visible match, or
	 *         {@code null} if the locator did not resolve to a sized element on this screen.
	 */
	private int[] firstVisibleBox(WebDriver driver, String locator, Transform transform) {
		try {
			List<? extends WebElement> elements = driver.findElements(buildBy(locator));
			for (WebElement element : elements) {
				Rectangle rect = element.getRect();
				if (rect.getWidth() > 0 && rect.getHeight() > 0) {
					return transform.apply(rect);
				}
			}
		} catch (Exception ignored) {
			// A locator that does not resolve on this screen is expected and non-fatal.
		}
		return null;
	}

	/**
	 * Parses a crop-field locator into a Selenium {@link By}. Supports a {@code strategy=value} prefix;
	 * a value with no recognised prefix is treated as a bare id (preserving the original behaviour and
	 * the shipped config examples).
	 */
	static By buildBy(String locator) {
		String spec = locator.trim();
		int sep = spec.indexOf('=');
		if (sep > 0) {
			String strategy = spec.substring(0, sep).trim().toLowerCase(Locale.ROOT);
			if (LOCATOR_STRATEGIES.contains(strategy)) {
				String value = spec.substring(sep + 1).trim();
				switch (strategy) {
					case "xpath":
						return By.xpath(value);
					case "css":
						return By.cssSelector(value);
					case "name":
						return By.name(value);
					case "class":
						return By.className(value);
					case "test-component-id":
					case "tcid":
						return By.xpath("//*[@test-component-id='" + value + "']");
					case "accessibility-id":
					case "aid":
						return By.xpath("//*[@content-desc='" + value + "']");
					case "id":
					default:
						return By.id(value);
				}
			}
		}
		return By.id(spec);
	}

	/**
	 * Builds the CSS-pixel to screenshot-pixel transform for the current driver/screen. Returns the
	 * identity transform for native contexts, when scaling is disabled, or if the ratio is implausible.
	 */
	private Transform computeTransform(WebDriver driver, int screenshotWidthPx) {
		if (!config.isCropAutoScale() || screenshotWidthPx <= 0 || !(driver instanceof JavascriptExecutor)) {
			return Transform.IDENTITY;
		}
		try {
			Object innerWidth = ((JavascriptExecutor) driver).executeScript("return window.innerWidth;");
			double cssWidth = toDouble(innerWidth);
			if (cssWidth <= 0) {
				// Native context (no JS viewport): element coordinates are already device pixels.
				return Transform.IDENTITY;
			}
			double scale = screenshotWidthPx / cssWidth;
			if (scale <= 0.1d || scale >= 20d) {
				// Implausible ratio - keep 1:1 rather than distorting the boxes.
				return Transform.IDENTITY;
			}
			// In a WebView the element origin is the top-left of the web viewport, which sits below the
			// device status bar in the full-device screenshot; shift boxes down by that height.
			return new Transform(scale, 0, statusBarHeightPx(driver));
		} catch (Exception e) {
			// JS not available (native context) or any hiccup: record raw coordinates.
			return Transform.IDENTITY;
		}
	}

	private int statusBarHeightPx(WebDriver driver) {
		if (driver instanceof HasCapabilities) {
			try {
				Object value = ((HasCapabilities) driver).getCapabilities().getCapability("statBarHeight");
				return Math.max(0, toInt(value));
			} catch (Exception ignored) {
				// capability unavailable - assume the webview starts at the top
			}
		}
		return 0;
	}

	private static double toDouble(Object value) {
		if (value instanceof Number) {
			return ((Number) value).doubleValue();
		}
		if (value != null) {
			try {
				return Double.parseDouble(value.toString().trim());
			} catch (NumberFormatException ignored) {
				// fall through
			}
		}
		return -1d;
	}

	private static int toInt(Object value) {
		if (value instanceof Number) {
			return ((Number) value).intValue();
		}
		if (value != null) {
			try {
				return (int) Math.round(Double.parseDouble(value.toString().trim()));
			} catch (NumberFormatException ignored) {
				// fall through
			}
		}
		return 0;
	}

	private int readImageWidth(File pngFile) {
		try {
			BufferedImage image = ImageIO.read(pngFile);
			return image != null ? image.getWidth() : -1;
		} catch (Exception e) {
			return -1;
		}
	}

	private void writeRectangle(Properties metaData, String fieldName, int x, int y, int width, int height) {
		metaData.setProperty(fieldName + ".x", String.valueOf(x));
		metaData.setProperty(fieldName + ".y", String.valueOf(y));
		metaData.setProperty(fieldName + ".width", String.valueOf(width));
		metaData.setProperty(fieldName + ".height", String.valueOf(height));
	}

	/** Immutable CSS-pixel to screenshot-pixel mapping: {@code out = round(in * scale) + offset}. */
	private static final class Transform {
		static final Transform IDENTITY = new Transform(1.0d, 0, 0);

		private final double scale;
		private final int offsetX;
		private final int offsetY;

		Transform(double scale, int offsetX, int offsetY) {
			this.scale = scale;
			this.offsetX = offsetX;
			this.offsetY = offsetY;
		}

		int[] apply(Rectangle rect) {
			int x = (int) Math.round(rect.getX() * scale) + offsetX;
			int y = (int) Math.round(rect.getY() * scale) + offsetY;
			int w = (int) Math.round(rect.getWidth() * scale);
			int h = (int) Math.round(rect.getHeight() * scale);
			return new int[] { x, y, w, h };
		}
	}
}

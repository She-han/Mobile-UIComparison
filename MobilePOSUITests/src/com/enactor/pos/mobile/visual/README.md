# Per-Step Visual Regression Capture

This package captures a screenshot at **every Cucumber step** and writes it, together with the
metadata the comparison tool needs, to the exact on-disk layout that the standalone
`VisualRegressionEngine` reads. Capture (this project) and comparison (the engine) stay fully
decoupled — they only ever meet on disk.

## Components

| Class | Responsibility |
|-------|----------------|
| `VisualRegressionDriverRegistry` | Thread-scoped holder that publishes the live `AppiumDriver`. The single integration seam. |
| `VisualRegressionConfig` | Loads `automation-test-config.properties` (enabled flag, output dir, crop fields). Shared with the engine. |
| `VisualStateNamingStrategy` | Produces engine-compatible scenario folder names and ordered (`NNN_step`) state file names. |
| `StepScreenshotCapturer` | Writes the PNG, the `.meta` bounding boxes, and the scenario `status_*.txt` marker. |
| `VisualRegressionScreenshotPlugin` | Cucumber `ConcurrentEventListener` that captures each step and records pass/fail. |

## Output layout (consumed by VisualRegressionEngine)

```
build/visual_outputs/actual/
  <ScenarioName>/
    001_Given_I_am_logged_in.png
    001_Given_I_am_logged_in.meta
    002_When_I_tap_Pay.png
    002_When_I_tap_Pay.meta
    status_passed.txt   (or status_failed.txt)
```

## How it is wired

1. **Driver seam** — `MobileTestController.initialise()` publishes the freshly created driver:
   `VisualRegressionDriverRegistry.register(driver);` (one additive, behaviour-neutral line).
2. **Plugin activation** — enable the Cucumber plugin. No runner or step-definition changes required.

### Enabling the plugin

Pick whichever matches how you launch the suite.

- **TestNG suite XML** (the runner already forwards all test parameters to Cucumber):

  ```xml
  <parameter name="plugin"
             value="com.enactor.pos.mobile.visual.VisualRegressionScreenshotPlugin" />
  ```

- **System property / Maven command line:**

  ```
  -Dcucumber.plugin=com.enactor.pos.mobile.visual.VisualRegressionScreenshotPlugin
  ```

- **`cucumber.properties` on the class-path:**

  ```
  cucumber.plugin=com.enactor.pos.mobile.visual.VisualRegressionScreenshotPlugin
  ```

Multiple plugins are comma-separated, e.g.
`...CucumberProgressReporter, com.enactor.pos.mobile.visual.VisualRegressionScreenshotPlugin`.

## Configuration

See `test/automation-test-config.properties`. Set `VisualRegression.Enabled=false` to turn capture
off without removing the plugin. Add `VisualRegression.CropFields` (plus a
`VisualRegression.CropField.<name>` resource-id per field) to record per-field bounding boxes for the
engine's field-level comparison.

## Running the comparison

After a test run produces `build/visual_outputs/actual/...`, run the standalone
`VisualRegressionEngine` (its `main`) to compare against the baselines and generate
`build/reports/visual-regression/Visual-Report.html`. Promote a known-good run's `actual` folder into
the engine's baseline directory to establish baselines.

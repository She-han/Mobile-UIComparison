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

## Comparison components (in-project, DINOv2 server)

| Class | Responsibility |
|-------|----------------|
| `DinoServerClient` | JDK-only HTTP client: Base64-encodes a baseline/actual PNG pair (+ crop regions), POSTs to the Dino `/compare` endpoint, returns the parsed result. |
| `CropRegion` | One tracked field's baseline + actual bounding box + threshold; serialises to the server's `crop_regions` schema. |
| `DinoComparisonResult` | Parsed `/compare` response (`global_similarity`, `field_similarities`, `diff_b64`). |
| `JsonUtil` | Tiny dependency-free JSON escape/extract helpers (no Gson/Jackson needed). |
| `VisualComparisonRunner` | `main()` entry point: walks baseline vs actual, calls the server per state, writes diff PNGs + `Visual-Report.html`. Exit code = number of failures. |

The Dino server (`D:/MPOC/DINOv2/dino_server.py`) exposes `POST /compare`:
`{baseline_b64, actual_b64, crop_regions[]}` → `{global_similarity, field_similarities, diff_b64, ...}`.

## Running the comparison

The comparison is decoupled from the test run — do it afterwards, with the Dino server up.

1. **Start the Dino server** on the port in `automation-test-config.properties`
   (`VisualRegression.DinoServerUrl`, default `:8000`):
   `uvicorn dino_server:app --host 0.0.0.0 --port 8000` (run from `D:/MPOC/DINOv2`). Make sure nothing
   else (e.g. ChromeDriver) is already bound to that port.
2. **Establish baselines** from a known-good run (repo root):
   `.\run-visual-compare.ps1 -Promote` (copies `actual/` → `baseline/`, dropping `status_*` markers).
3. **Compare** a later run and open the report:
   `.\run-visual-compare.ps1 -Open`.

Output: `build/reports/visual-regression/Visual-Report.html` plus `diffs/<scenario>/<state>_diff.png`.
A state passes when `global_similarity >= VisualRegression.SimilarityThreshold` (and every tracked
field clears its own threshold). The runner exits non-zero if any state regresses, so CI can gate on it.

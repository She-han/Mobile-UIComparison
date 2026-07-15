# Visual Regression Screenshot Capture — Project Handoff

> Context document for a coding agent (e.g. Claude in VS Code) to continue this work.
> Repo root: `D:\RDF_POS_Test\MobilePOSAutomationTests-UIComparison\Mobile-UIComparison`
> Modules: `CoreAutomationNR` (framework) and `MobilePOSUITests` (mobile POS tests).

---

## 1. Goal

Capture a **screenshot at every Cucumber step** during the mobile POS UI test run, save each
screenshot under a folder named after the **test case (scenario)**, and make those screenshots
consumable by the uploaded **`VisualRegressionEngine.java`** (a standalone DINOv2-based comparison +
HTML report tool) — **without changing any existing architecture or logic**, only adding new files
and minimal "seam" hooks, using professional OOP.

The engine itself was NOT to be modified. It reads:
```
build/visual_outputs/actual/<scenario>/<state>.png   (+ optional <state>.meta)
build/visual_outputs/actual/<scenario>/status_passed.txt | status_failed.txt
```
compares against baselines in `src/test/resources/baseline_images/`, and writes
`build/reports/visual-regression/Visual-Report.html`.

---

## 2. Key technical constraints discovered

- **Appium version mismatch.** The project uses **Appium java-client v7.5.1**
  (`AppiumDriver<MobileElement>`, `MobileBy`, `findElementsByAccessibilityId`). The uploaded
  `VisualRegressionEngine.java` is written for **v8** (`AppiumBy`, raw `AppiumDriver`). Therefore the
  engine CANNOT be compiled inside this project. Decision: **keep the engine standalone**; the
  in-project capture layer only needs to produce the same on-disk output the engine reads.

- **Two driver families / the critical gotcha.** There are two controller hierarchies, each owning a
  different Appium driver type:
  - Thin-client: `com.enactor.pos.mobile.MobileTestController` → `AppiumDriver<MobileElement>`.
  - **React web POS** (what the real `@ReactPOS` tests use): `com.enactor.pos.mobile.web.MobileThickReactController`
    and `MobileThinClientReactController` → `AppiumDriver<WebElement>`.
  The first working attempt only instrumented the thin-client controller, so screenshots were never
  taken for the React tests. **Fix:** the capture layer was generalized to `org.openqa.selenium.WebDriver`
  (common super-type of all drivers) and the driver-registration seam was added to the React
  controllers too.

- **Cucumber has no per-step timeout** here (no `@Timeout` annotations). "Step timeout" = the
  element/window FluentWait timeouts (see §7).

- **Runner glue/plugin.** `CoreAutomationNR/.../cucumber/RunCucumberTests.java` is a TestNG
  cucumber runner. `-Dcucumber.plugin=...` (system property) is honored (verified: `pretty` worked).
  There is a precedent plugin `CucumberScreenshotEmitter` (a `ConcurrentEventListener`) — the new
  plugin mirrors that pattern.

---

## 3. Design (the subsystem that was added)

New package: `MobilePOSUITests/src/com/enactor/pos/mobile/visual/`

| Class | Responsibility |
|-------|----------------|
| `VisualRegressionDriverRegistry` | `ThreadLocal<WebDriver>` holder. The single integration seam. `register()/getActiveDriver()/clear()`. Never throws. |
| `VisualRegressionConfig` | Lazily loads `automation-test-config.properties` (working dir first, then classpath). Exposes `isEnabled()`, `getOutputDir()` (default `build/visual_outputs/actual`), `getCropFields()`. Same keys the engine reads. |
| `VisualStateNamingStrategy` | Sanitizes scenario → folder name (`[^a-zA-Z0-9.-]` → `_`, matching the engine) and builds ordered state file names `NNN_<step>.png` (zero-padded so the engine's alphabetical sort preserves execution order). |
| `StepScreenshotCapturer` | `WebDriver`-based. Writes PNG (`TakesScreenshot`), `.meta` bounding boxes for configured crop fields (`By.id` + `getRect()`), and per-scenario `status_passed.txt`/`status_failed.txt`. Fully guarded — a capture failure never affects the functional test. |
| `VisualRegressionScreenshotPlugin` | Cucumber `ConcurrentEventListener`. On `TestCaseStarted` resets scenario name + step counter (ThreadLocals); on `TestStepFinished` (only real `PickleStepTestStep`, skipping hooks) captures a screenshot via the registry driver; on `TestCaseFinished` writes the pass/fail status file. |
| `README.md` | Package documentation (wiring + output layout). |

Everything is decoupled: capture writes on-disk, the standalone engine reads on-disk. No compile
dependency between them.

---

## 4. Files ADDED

- `MobilePOSUITests/src/com/enactor/pos/mobile/visual/VisualRegressionDriverRegistry.java`
- `MobilePOSUITests/src/com/enactor/pos/mobile/visual/VisualRegressionConfig.java`
- `MobilePOSUITests/src/com/enactor/pos/mobile/visual/VisualStateNamingStrategy.java`
- `MobilePOSUITests/src/com/enactor/pos/mobile/visual/StepScreenshotCapturer.java`
- `MobilePOSUITests/src/com/enactor/pos/mobile/visual/VisualRegressionScreenshotPlugin.java`
- `MobilePOSUITests/src/com/enactor/pos/mobile/visual/README.md`
- `MobilePOSUITests/test/automation-test-config.properties`  (config template; `VisualRegression.Enabled`, `VisualRegression.OutputDir`, `VisualRegression.CropFields`, `VisualRegression.CropField.<name>`)
- `run-tests.ps1`  (repo root; convenience launcher, see §6)
- `VISUAL_REGRESSION_HANDOFF.md`  (this file)

## 5. Files MODIFIED (each = one additive, behaviour-neutral line + comment)

Registration of the live driver into the registry, immediately after `driver = createDriver(...)`:

- `MobilePOSUITests/src/com/enactor/pos/mobile/MobileTestController.java` (~line 186) — thin-client.
- `MobilePOSUITests/src/com/enactor/pos/mobile/web/MobileThickReactController.java` (~line 161) — **React thick (the family the sample @ReactPOS test uses).**
- `MobilePOSUITests/src/com/enactor/pos/mobile/web/MobileThinClientReactController.java` (~line 73) — React thin.

The added line (fully-qualified so no imports change):
```java
// Visual-regression instrumentation (additive, behaviour-neutral): publish the live driver so
// the per-step screenshot plugin can capture the current screen. See com.enactor.pos.mobile.visual.
com.enactor.pos.mobile.visual.VisualRegressionDriverRegistry.register(driver);
```

No existing logic/architecture was otherwise changed.

---

## 6. How to run

Convenience script `run-tests.ps1` (repo root) wraps the long Maven command. Parameters:
`-Tags`, `-DeviceUUID`, `-PlatformVer`, `-AppiumUrl`, `-ChromeDriver`, and the switch
`-VisualRegression` (adds the plugin to `cucumber.plugin`).

```powershell
.\run-tests.ps1                     # normal run (pretty only, screenshots OFF)
.\run-tests.ps1 -VisualRegression   # per-step screenshots ON
.\run-tests.ps1 -Tags "@PT-6" -VisualRegression
```

Screenshots ON adds:
`-Dcucumber.plugin=pretty,com.enactor.pos.mobile.visual.VisualRegressionScreenshotPlugin`

Output lands in `MobilePOSUITests/build/visual_outputs/actual/<scenario>/`.

### Appium server requirement (separate from Maven)
Start Appium allowing the insecure `adb_shell` feature, otherwise the framework's printer-peripheral
calls (`mobile: shell` → `AppiumBackgroundService`) fail with HTTP 500:
```
appium --allow-insecure=adb_shell
```
(Appium 2.5 scoped form: `appium --allow-insecure=uiautomator2:adb_shell`.) This was verified to fix
the printer 500s. It is unrelated to the screenshot feature.

### Enabling field-level crop tracking (optional)
In `MobilePOSUITests/test/automation-test-config.properties`:
```
VisualRegression.CropFields=TotalAmount,ItemList
VisualRegression.CropField.TotalAmount=com.enactor.mobile.android.pos:id/totalValue
VisualRegression.CropField.ItemList=com.enactor.mobile.android.pos:id/basketList
```
Leave `CropFields` empty for full-screen-only captures. `VisualRegression.Enabled=false` disables
capture without removing the plugin.

---

## 7. Where the "step timeout" actually lives (reference)

The per-step element/window wait that produces
`Expected condition failed: waiting for ... (tried for N second(s) with 1000 milliseconds interval)`
comes from the controller's `FluentWait`, NOT from Cucumber.

Primary knob for React Thick / Android (the sample test's path):
- `MobilePOSUITests/src/com/enactor/pos/mobile/web/MobileThickReactController.java` (lines ~63-65):
  `wait = new FluentWait<T>(driver).withTimeout(MobilePosTestUtils.getWaitingTimeOut(), SECONDS).pollingEvery(...)`.
- `MobilePosTestUtils.getWaitingTimeOut()` (`utils/MobilePosTestUtils.java:129`) reads system property
  **`waitingTimeOut`** (default `120`). The run command currently passes `-DwaitingTimeOut=...`.
  **Raise this value to lengthen the step wait** (no rebuild needed).

Other timeout locations (hardcoded — need edit + rebuild):
- `web/android/AndroidThickReactController.java:80` → `implicitlyWait(60)`.
- `web/android/AndroidThinClientReactController.java:51` → `implicitlyWait(60)`.
- `web/MobileThinClientReactController.java:50` → FluentWait `withTimeout(120)`.
- `web/ios/IOSThickReactController.java:100-103` → `getWaitingTimeOut()/2`.
- `web/ios/IOSThinClientReactController.java:41` → `implicitlyWait(120)`.
- `web/android/AndroidLogicalDeviceStepProvider.java:60` → FluentWait `withTimeout(40)`.
- `CoreAutomationNR/.../selenium/SeleniumWebController.java:33` → FluentWait `withTimeout(120)`.
- Global constants `CoreAutomationNR/.../AUT/IAUTWebController.java`: `WAIT_TIMEOUT=30`,
  `ELEMENT_WAIT_TIMEOUT=5000ms`, `SLEEP_TIMER=100ms`.

---

## 8. Known FUNCTIONAL failures (NOT caused by the screenshot work)

These are app/data/framework issues surfaced while testing; the screenshot subsystem compiles and
runs independently of them.

### 8a. Sign-on never reaches the Sale page
`Given user signs on as "Sales Assistant"` times out waiting for
`//*[@id='Pos-Sale-Sale.Pos-Sale-Sale']` (NoSuchElement, repeated 404s = the FluentWait polling).
After entering user `000101` / operator `000101` and pressing `ENT`, the app did not navigate to the
Sale screen. Likely causes: invalid credentials for this terminal/store dataset, a different landing
screen/dialog, or a changed test-component id in the deployed build. Check the captured step
screenshot to see the actual on-screen state.

### 8b. `NumberFormatException: Cannot parse null string` on pressing "ENT"
Stack: `CommonPosSteps.userPressesButtonOnCurrentPage` → `MobileWebPosStepProvider.pressButton` →
`super.pressButton` (`BaseWebPosStepsProvider:516`) → `getBasketItemsCount()`
(`BaseWebPosStepsProvider:126`) → `Integer.parseInt(null)`.
The framework reads the **basket item-count** off the screen after pressing ENT and it is null
(basket-count element absent/empty on that screen). **Not a timeout.**
- `BaseWebPosStepsProvider` is in the **`pos-ui-tests` dependency jar** (`com.enactor.pos.web`), NOT
  in this repo — cannot be edited here directly.
- `MobileWebPosStepProvider` (in this repo, `.../web/MobileWebPosStepProvider.java`) already
  `extends BaseWebPosStepsProvider` and overrides `pressButton` (calls `super.pressButton`).
- **Possible in-repo fix (pending):** if `getBasketItemsCount()` is `protected`/`public` (not
  `private`/`final`) in the base class, add a null-safe `@Override` in `MobileWebPosStepProvider`
  returning `0` when the count text is null; `super.pressButton` would dispatch to it. Need the exact
  signature/visibility of `getBasketItemsCount` from the dependency source to implement safely. If
  it's `private`, this must be fixed as an app/data problem (ensure the basket-count element exists /
  correct id) or in the `pos-ui-tests` module itself.

---

## 9. Suggested next steps for the agent

1. Confirm screenshots are produced under `MobilePOSUITests/build/visual_outputs/actual/<scenario>/`
   when running with `-VisualRegression`. Inspect the sign-on step image for issue 8a.
2. Obtain the `getBasketItemsCount()` signature/visibility from the `pos-ui-tests` source to decide
   whether the null-safe override (8b) is viable in-repo.
3. If desired, expose `waitingTimeOut` as a `-WaitTimeout` parameter in `run-tests.ps1` and/or set a
   baseline directory + run the standalone `VisualRegressionEngine` to generate the HTML report.
4. Establish baselines: promote a known-good `actual/` run into the engine's
   `src/test/resources/baseline_images/` (per the engine's `main()`).

---

## 10. Verification status

- All new `visual/*.java` files are ASCII, brace-balanced, and use only APIs already present in the
  project (`By.id`, `getRect()`, `TakesScreenshot`, `getScreenshotAs`, Cucumber `PickleStepTestStep`,
  `WebDriver`). A live `mvn` compile was performed by the user; the module compiled (43 sources,
  no errors) and produced the jars.
- A full local compile inside the assistant sandbox was not possible (internal `com.enactor.*`
  dependencies + JDK not available there); correctness was verified statically against the codebase's
  own API usage.

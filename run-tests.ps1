<#
    run-tests.ps1
    Convenience launcher for the Mobile POS UI tests.

    Usage examples (from the Mobile-UIComparison folder):
        .\run-tests.ps1                         # runs the default tag (@PT-5)
        .\run-tests.ps1 -Tags "@PT-10"          # run a different tag
        .\run-tests.ps1 -VisualRegression       # also capture per-step screenshots
        .\run-tests.ps1 -DeviceUUID "ABC123"    # target a different device
        .\run-tests.ps1 -Tags "@Smoke" -VisualRegression

    Only the values you are likely to change are exposed as parameters; everything
    else matches the standard run command.
#>

param(
    [string] $Tags        = "@PT-5 or @PT-6",
    [string] $DeviceUUID  = "37201FDJH0040J",
    [string] $PlatformVer = "15",
    [string] $AppiumUrl   = "http://127.0.0.1:4723",
    [string] $ChromeDriver = "C:\tools\chromedriver\chromedriver.exe",
    [switch] $VisualRegression,  # add -VisualRegression to enable per-step screenshot capture
    [switch] $Offline            # add -Offline to build from the local .m2 cache (skip the Enactor repo)
)

$ErrorActionPreference = "Stop"

# Enable the visual-regression screenshot plugin only when requested.
$plugin = "pretty"
if ($VisualRegression) {
    $plugin = "pretty,com.enactor.pos.mobile.visual.VisualRegressionScreenshotPlugin"
}

Write-Host "Running tests | tags=$Tags | device=$DeviceUUID | visualRegression=$($VisualRegression.IsPresent) | offline=$($Offline.IsPresent)" -ForegroundColor Cyan

# Base Maven invocation. -nsu (no snapshot updates) stops the daily online re-check of 3.0.9-SNAPSHOT
# metadata against the Enactor Artifactory, which otherwise hangs the build when that repo is unreachable
# (VPN down / off-network). -Offline goes further and uses ONLY the local .m2 cache.
$mvnArgs = @("-f", "MobilePOSUITests/pom.xml", "-nsu", "clean", "install", "test")
if ($Offline) { $mvnArgs += "-o" }
$mvnArgs += @(
  "-Djavafx.platform=win",
  "-Dmaven.test.failure.ignore=true",
  "-Dcucumber.plugin=$plugin",
  "-Dcucumber.filter.tags=$Tags",
  "-Dcucumber.publish.quiet=true",
  "-DredirectTestOutputToFile=false",
  "-DautConfigPropertyFileNames=posNextGen1024x768,webPos,androidReactThickPos",
  "-DautMobilePlatformName=Android",
  "-DautMobilePlatformVersion=$PlatformVer",
  "-DforkMode=never",
  "-Denactor.tests.profile=uitest",
  "-DautSimulateMouseMode=false",
  "-DandroidAppPackageName=com.enactor.pos",
  "-DandroidMainActivity=com.enactor.pos.MainActivity",
  "-DmobileWebView=WEBVIEW_com.enactor.pos",
  "-DclearDeviceLogsOnStart=false",
  "-DautMobileDeviceUUID=$DeviceUUID",
  "-DchromedriverPath=$ChromeDriver",
  "-DnoReset=true",
  "-DfullReset=false",
  "-DvendorPrefix=appium:",
  "-DautMobileCommandTimeoutSeconds=0",
  "-DnativeAppName=NATIVE_APP",
  "-DmobileUIFramwork=UiAutomator2",
  "-DautMobileAppiumServerBaseURL=$AppiumUrl",
  "-DtestDataPropertyFileName=testData",
  "-Ddebug.enabled=true",
  "-DTERMINAL_NUMBER=1385119",
  "-DwaitingTimeForHardRestartInMillis=100000",
  "-DlogProcessAndPrompt=true",
  "-DuseJSClick=false",
  "-DPOS_APPLICATION_TYPE=NONE",
  "-DuseCustomDriver=false",
  "-DwaitingTimeOut=40"
)

mvn @mvnArgs

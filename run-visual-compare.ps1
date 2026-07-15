<#
.SYNOPSIS
    Establish baselines and/or run the DINOv2 visual-regression comparison.

.DESCRIPTION
    After a test run has produced actual screenshots under
    MobilePOSUITests/build/visual_outputs/actual/<scenario>/, this script:

      -Promote  : copies the current actual/ tree to baseline/ (approve as the new golden set)
      (default) : compiles the visual package if needed and runs VisualComparisonRunner, which
                  POSTs every baseline/actual pair to the Dino server and writes the HTML report.

    The Dino FastAPI server must be running and reachable at the URL configured in
    MobilePOSUITests/test/automation-test-config.properties (default http://localhost:8000/compare).

.EXAMPLE
    # 1) First time: capture a good run, then approve it as the baseline
    .\run-visual-compare.ps1 -Promote

.EXAMPLE
    # 2) Later runs: compare the latest actual/ against the baseline and open the report
    .\run-visual-compare.ps1 -Open
#>
[CmdletBinding()]
param(
    [switch]$Promote,   # Copy actual/ -> baseline/ and exit (approve current run as golden)
    [switch]$Open,      # Open the HTML report when the comparison finishes
    [switch]$SkipBuild  # Do not run 'mvn compile' first (use existing target/classes)
)

$ErrorActionPreference = 'Stop'
$moduleDir   = Join-Path $PSScriptRoot 'MobilePOSUITests'
$actualDir   = Join-Path $moduleDir 'build/visual_outputs/actual'
$baselineDir = Join-Path $moduleDir 'build/visual_outputs/baseline'
$reportHtml  = Join-Path $moduleDir 'build/reports/visual-regression/Visual-Report.html'
$classesDir  = Join-Path $moduleDir 'target/classes'

if ($Promote) {
    if (-not (Test-Path $actualDir)) {
        throw "No actual output found at $actualDir. Run the tests with -VisualRegression first."
    }
    if (Test-Path $baselineDir) { Remove-Item $baselineDir -Recurse -Force }
    Copy-Item $actualDir $baselineDir -Recurse
    # Status/marker files are per-run state, not part of the golden image set.
    Get-ChildItem $baselineDir -Recurse -Include 'status_passed.txt','status_failed.txt' | Remove-Item -Force
    Write-Host "Baseline established at $baselineDir" -ForegroundColor Green
    return
}

if (-not $SkipBuild) {
    Write-Host 'Compiling visual package (mvn compile)...' -ForegroundColor Cyan
    Push-Location $moduleDir
    try { & mvn -q compile } finally { Pop-Location }
    if ($LASTEXITCODE -ne 0) { throw "mvn compile failed (exit $LASTEXITCODE)." }
}

if (-not (Test-Path $classesDir)) {
    throw "Compiled classes not found at $classesDir. Run without -SkipBuild first."
}

Write-Host 'Running visual comparison...' -ForegroundColor Cyan
# Working directory = module dir so the relative build/... paths in the config resolve correctly.
Push-Location $moduleDir
try {
    & java -cp $classesDir 'com.enactor.pos.mobile.visual.VisualComparisonRunner'
    $exit = $LASTEXITCODE
} finally {
    Pop-Location
}

if (Test-Path $reportHtml) {
    Write-Host "Report: $reportHtml" -ForegroundColor Green
    if ($Open) { Start-Process $reportHtml }
} else {
    Write-Warning "Report was not generated at $reportHtml"
}

# Propagate the runner's exit code (non-zero = at least one visual regression) for CI.
exit $exit

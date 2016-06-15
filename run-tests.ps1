#
# This is a little rather dumb testing script, running the unit tests
# of various popular open source projects for you
#
param (
    [switch]$lxcoreTrace = $false,
    [string]$testSuite = ""
)

function getLssPathToTest($testDirectory) {
  $currentDir = $(Get-Location).Path 
  $currentDir = $currentDir.replace("\", "/")
  $currentDir = $currentDir.replace("C:/","/mnt/c/")
  return "$currentDir/tests/$testDirectory/$testDirectory.sh"
}

function runTests() {
    $testSuiteProvided = ($testSuite -ne "")
    foreach ($testDirectory in Get-ChildItem -Depth 1 -Directory ./tests) {
        # If the user provided a test suite name, only run that test suite.
        if ($testSuiteProvided) {
            if ($testDirectory.name -eq $testSuite) {
                runSuite($testDirectory)
                break
            }
        } else {
            runSuite($testDirectory)
        }
    }
}

function runSuite($testDirectory) {
    $testScriptPath = getLssPathToTest($testDirectory)
    $traceScriptPath = "\\ntpnpsrv\public\oss\selfhost\scripts\"
    $loggingEnabled = ($lxcoreTrace -And (Test-Path $traceScriptPath))

    # Enable logs
    Write-Host "Testing $testDirectory" in $testScriptPath
    Write-Host "---------------------------------------------------------------"
    if ($loggingEnabled) {
      & "\\ntpnpsrv\public\oss\selfhost\scripts\start_lxcore_trace.cmd"
    }

    cd ./tests/$testDirectory

    # Get the script contents and conver the newlines into UNIX style.
    $scriptFile = Get-ChildItem -File *.sh
    convertLineEndings($scriptFile)

    # Run test - move into directory to ensure that logs are found ther
    Write-Host "Running suite! `n" -Backgroundcolor "Green" -ForegroundColor "Black"
    bash $testScriptPath
    cd ../..

    # Disable logs
    if ($loggingEnabled) {
      & "\\ntpnpsrv\public\oss\selfhost\scripts\stop_lxcore_trace.cmd"
    }

    Write-Host "---------------------------------------------------------------"
}

function convertLineEndings($scriptFile) {
    Write-Host "Converting file: " $scriptFile.name -BackgroundColor "Yellow" -ForegroundColor "Black"

    # Uuuuuughhhhhaaaaaaargh, newlines
    $fileContents = get-content -raw -path $scriptFile.fullname
    $fileContents = $fileContents -replace "`r`n", "`n"
    [io.file]::WriteAllText($scriptFile.fullname, $fileContents)

    Write-Host "Done converting file: " $scriptFile.name "`n" -BackgroundColor "Yellow" -ForegroundColor "Black"
}

# Let's run this puppy, but only if we're admin
If (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator!"
    Break
}

runTests;
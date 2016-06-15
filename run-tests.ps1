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
    Write-Host "Testing $testDirectory.name" in $testScriptPath
    Write-Host "---------------------------------------------------------------"
    if ($loggingEnabled) {
      & "\\ntpnpsrv\public\oss\selfhost\scripts\start_lxcore_trace.cmd"
    }

    # Uuuuuughhhhhaaaaaaargh, newlines
    cd ./tests/$testDirectory
    Get-ChildItem -File *.sh | % { $x = get-content -raw -path $_.fullname; $x -replace "`r`n","`n" | set-content -path $_.fullname }

    # Run test - move into directory to ensure that logs are found there
    bash $testScriptPath
    cd ../..

    # Disable logs
    if ($loggingEnabled) {
      & "\\ntpnpsrv\public\oss\selfhost\scripts\stop_lxcore_trace.cmd"
    }

    Write-Host "---------------------------------------------------------------"
}

# Let's run this puppy, but only if we're admin
If (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator!"
    Break
}

runTests;

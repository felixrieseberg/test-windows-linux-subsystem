# Test Bash on Windows

This is a rather crude little PowerShell script that tests the Windows Linux Subsystem
(also known as Ubunto on Windows / Bash on Windows) by running a series of unit tests
of popular open source projects that are known to work on Ubuntu.\

First, in Bash, run `sudo ./setup.sh`. It'll install Git, Node, build tools, and other basics.

Then, from PowerShell, run `./run-tests.ps1` as Administrator. 

## Parameters

* Running a specific can be done by passing `-testSuite suiteNameToTest`
* lxcore tracing can be enabled by passing `-lxcoreTrace`

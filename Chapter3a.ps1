
function Write-MySuperLog { param([Alias("message")] $msg) $msg | % { write-host "$((get-date).tostring('s')): $($_)" -ForegroundColor green }}

#region Bad Example Code

function get-FooBarContents {
    Write-MySuperLog "Read the contents of file c:\windows\foobar.txt"
    $contents = Get-Content 'c:\windows\foobar.dat'
    Write-MySuperLog "Received Contents of log file"
    $Contents | Write-Output
}

clear-host

get-FooBarContents

#endregion

#region Good Example Code

function get-FooBarContents {
    [CmdletBinding()]
    param()
    Write-Verbose "Read the contents of file c:\windows\foobar.txt"
    $contents = Get-Content 'c:\windows\foobar.dat'
    Write-Verbose "Received Contents of log file"
    $Contents | Write-Output
}

Start-Transcript
get-FooBarContents -verbose
Stop-Transcript

#endregion

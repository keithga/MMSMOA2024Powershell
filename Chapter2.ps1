clear-host

#region Bad Example Code

function Show-MeaningOfLife
{
    Write-Host 'The answer to life, the universe and everything'
    new-item -ItemType Directory 'c:\42' -Force
    Write-Host 42
}

Show-MeaningOfLife

#endregion 

"#########################################"

#region Good Example Code

function Get-MeaningOfLife {
    [CmdletBinding()]
    Param()
    Write-Verbose 'The answer to life, the universe and everything'
    new-item -ItemType Directory 'c:\42' -Force | write-verbose
    # 42 | write-output
    return 42
}

$answer = Get-MeaningOfLife  -verbose
write-host "I got the answer right here: [$($Answer)]" -ForegroundColor Cyan

#endregion 



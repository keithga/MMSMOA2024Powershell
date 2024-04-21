

function Get-AppSetting #returns app settings from the .xml config

([string]$PathToConfig = $(throw 'Configuration file is required')) {
    if (Test-Path $PathToConfig) {
        $x = [Xml] (Get-Content $PathToConfig)
        $x.configuration.appSettings.add
    }
    else {
        throw "Configuration File $PathToConfig Not Found"
    }
}


function Get-ConfigSetting {
    <#
    .Synopsis
       Get app settings from config file
    .DESCRIPTION
       Used to retrieve XML Formatted settings from an Application's Config File. 
    .EXAMPLE
       Get-ConfigSetting -path 'c:\program files\Company\Program\App.exe.config'
    #>
    Param ( [Parameter(Mandatory)] [string] $Path )

    [xml]$Data = get-content $path
    return $Data.configuration.appSettings.Add
}


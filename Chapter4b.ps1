#region Bad Example

clear-host
[xml]$control = $null
"<datatype><log>hello world</log></datatype>" > '.\MyControlFile.txt'
remove-item .\MyControlFile.xml -ErrorAction SilentlyContinue


write-host "get the data from the control file: .\MyControlFile.xml"
try {
    [xml]$control = get-content '.\MyControlFile.xml'
}
catch {
    write-host "Unable to open '.\MyControlFile.xml'"
}
write-host "the log value is: [$($control.datatype.log)]"
# Continue using the $control variable...

#endregion

#region Good Example

[xml]$control = get-content '.\MyControlFile.txt' -ErrorAction stop
write-verbose "the log value is: [$($control.datatype.log)]" -verbose
# Continue using the $control variable...

#endregion

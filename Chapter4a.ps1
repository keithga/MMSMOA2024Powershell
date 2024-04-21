#Region bad example

If ( -not ( get-command mycustom.exe ) ) { 
    msiexec.exe -q -i mycustom.msi
}

#endregion

#region good example 1

try { 
    get-command mycustom.Exportable -ErrorAction stop | out-null
}
catch { 
    write-host "Install MyCustom.exe"
    # msiexec –q –i mycustom.msi
}

#endregion

#region good example 2

If ( -not ( get-command mycustom.exe -ErrorAction SilentlyContinue ) ) { 
    write-host "Install MyCustom.exe"
    # msiexec –q –i mycustom.msi
}

#endregion
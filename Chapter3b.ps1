function Write-MySuperLog { param([Alias("message")] $msg) $msg | % { write-host "$((get-date).tostring('s')): $($_)" -ForegroundColor green }}

$FriendlyName = 'My Super Cert'
$DNSName = 'myserver.contoso.local'

$params = @{
    DnsName = $DNSName
    KeyLength = 2048
    KeyAlgorithm = 'RSA'
    HashAlgorithm = 'SHA256'
    KeyExportPolicy = 'Exportable'
    NotAfter = (Get-Date).AddYears(100)
    CertStoreLocation = 'Cert:\LocalMachine\My'
    FriendlyName = $FriendlyName
}

#region Bad Example Code

# Create self-signed certificate
Write-MySuperLog -Message "Creating Self-signed Certificate"
Write-MySuperLog -Message "Certificate FriendlyName: $FriendlyName"
Write-MySuperLog -Message "Certificate DNSName: $DNSName"
Write-MySuperLog -Message "Certificate Path: Cert:Localmachine\My"
Write-MySuperLog -Message "Certificate valid until: 200 years"

$cert = New-SelfSignedCertificate @params

# Create self-signed certificate
Write-MySuperLog -Message "New Self Signed Certificate Created."
Write-MySuperLog -Message "Certificate FriendlyName: $($Cert.FriendlyName)"
Write-MySuperLog -Message "Certificate DNSName: $($Cert.DnsNameList -join ',')"
Write-MySuperLog -Message "Certificate Path: $($Cert.PSPath)"
Write-MySuperLog -Message "Certificate valid until: $($cert.notbefore)"
Write-MySuperLog -Message "Using $($cert.FriendlyName) as signing cert"

#endregion 

#region Good Example Code

write-verbose "Call New-SelfSignedCertificate with Params:" -verbose
$params | out-string | write-verbose -Verbose
$cert = New-SelfSignedCertificate @params
$cert | fl * | out-string | write-verbose -Verbose

#endregion

#endregion

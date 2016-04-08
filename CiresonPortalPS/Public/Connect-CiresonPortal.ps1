function Connect-CiresonPortal
{
PARAM(
    [Alias('RunAs')]
	[System.Management.Automation.Credential()]
	$Credential = [System.Management.Automation.PSCredential]::Empty,
    [parameter(Mandatory)]
    $URL)
    Set-Variable -name CiresonPortalCred -Value $Credential -Scope Global
    Set-Variable -name CiresonPortalURL -Value $URL -Scope Global
}

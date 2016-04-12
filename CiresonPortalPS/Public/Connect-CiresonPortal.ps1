function Connect-CiresonPortal
{
<#
	.SYNOPSIS
		Function to create variables used to connect to Cireson Portal API
	
	.DESCRIPTION
		Function to create variables used to connect to Cireson Portal API
	
	.PARAMETER Credential
		Specifies the credential to use
	
	.PARAMETER URL
		Specifies the URL of the CiresonPortal
	
	.EXAMPLE
		Connect-CiresonPortal -URL "http://CiresonPortal.local" -Credential $cred
	
	.NOTES
		Francois-Xavier Cat
		@lazywinadm
		www.lazywinadmin.com
		github.com/lazywinadmin
#>
	PARAM (
		[parameter(Mandatory)]
    	[Alias('RunAs')]
		[System.Management.Automation.Credential()]
		$Credential = [System.Management.Automation.PSCredential]::Empty,
    	[parameter(Mandatory)]
    	$URL)
    Set-Variable -name CiresonPortalCred -Value $Credential -Scope Global -Force
    Set-Variable -name CiresonPortalURL -Value $URL -Scope Global -Force
}

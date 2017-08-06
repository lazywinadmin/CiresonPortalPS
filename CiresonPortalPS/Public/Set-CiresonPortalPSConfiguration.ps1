function Set-CiresonPortalPSConfiguration
{
<#
	.SYNOPSIS
		Function to configure the connection with the Cireson Portal API
	
	.DESCRIPTION
		Function to configure the connection with the Cireson Portal API.
		This function will basically store the Credential and the API URI into two variables:
			-> CiresonPortalCred
			-> CiresonPortalURL
	
	.PARAMETER Credential
		Specifies the credential to use
	
	.PARAMETER URL
		Specifies the URL of the CiresonPortal
	
	.EXAMPLE
		Set-CiresonPortalConnection -URL "http://CiresonPortal.local" -Credential $cred
		
	.EXAMPLE
		Set-CiresonPortalConnection -URL "http://CiresonPortal.local" -Credential (Get-Credential)
	
	.NOTES
		Francois-Xavier Cat
		@lazywinadm
		lazywinadmin.com
		github.com/lazywinadmin
#>
	[CmdletBinding(SupportsShouldProcess = $True)]
	PARAM (
		[parameter(Mandatory = $true)]
		[Alias("RunAs")]
		[System.Management.Automation.PSCredential]
		[System.Management.Automation.Credential()]
		$Credential,
		[parameter(Mandatory = $true)]
		$URL)
	
	if ($pscmdlet.ShouldProcess($Credential, "Set Variables used by Cireson Portal cmdlets"))
	{
		Set-Variable -name CiresonPortalCred -Value $Credential -Scope Global -Force
		Set-Variable -name CiresonPortalURL -Value $URL -Scope Global -Force
	}
}

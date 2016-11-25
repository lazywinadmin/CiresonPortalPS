function Get-CiresonPortalPSConfiguration
{
<#
.SYNOPSIS
	Function to get your connection configuration to the Cireson Portal API

.DESCRIPTION
	Function to get your connection configuration to the Cireson Portal API
	It will verify that the two variables $CiresonPortalURL and $CiresonPortalCred
	are present.

.EXAMPLE
	Get-CiresonPortalPSConfiguration

	Retrieve the CiresonPortalPS module configuration

.NOTES
	Francois-Xavier Cat
	lazywinadmin.com
	@lazywinadm
	github.com/lazywinadmin
#>
	#requires -Version 3
	[CmdletBinding()]
	PARAM()
	PROCESS
	{
		$CheckCiresonPortalURL = (Get-Variable -name CiresonPortalURL -Scope Global -ErrorAction SilentlyContinue)
		$CheckCiresonPortalCredential = (Get-Variable -name CiresonPortalCred -Scope Global -ErrorAction SilentlyContinue)
		
		$Check = [PSCustomObject][ordered]@{
					"URL" = $CheckCiresonPortalURL
					"Credential" = $CheckCiresonPortalCredential}


		IF(-not$CheckCiresonPortalURL -or -not$CheckCiresonPortalCredential)
		{
			Write-Warning -Message "[Get-CiresonPortalPSConfiguration] Missing settings, Use Set-CiresonPortalPSConfiguration to configure the connection"
			$Check
		}
		ELSE{
			$Check
		}
	}
}
function Get-CiresonPortalConfigurationItem
{
<#
.SYNOPSIS
	Function to retrieve Configuration Item

.DESCRIPTION
	Function to retrieve Configuration Item

.PARAMETER ItemFilter
	Specifies the ItemFilter
.EXAMPLE
	Get-CiresonPortalConfigurationItem

	Function to retrieve Configuration Item
.NOTES
	Francois-Xavier Cat
	lazywinadmin.com
	@lazywinadm
	github.com/lazywinadmin
#>
	#requires -version 3
	[CmdletBinding()]
	[OutputType([pscustomobject])]
	param
	(
		[Parameter(Mandatory = $true)]
		$ItemFilter
	)
	
	BEGIN
	{
		TRY
		{
			Write-Verbose -Message $(New-ScriptMessage -Block BEGIN -message 'Checking Pre-Requisites')
			[void](Get-CiresonPortalPSConfiguration -WarningAction Stop)
		}
		CATCH
		{
			# Stop the function
			break
		}
		
	}
	PROCESS
	{
		TRY
		{
			# Configuration Items
			$URI = $CiresonPortalURL, "api/V3/Config/GetAffectedItemsList?itemFilter=$ItemFilter" -join '/'
			Write-Verbose -Message $(New-ScriptMessage -Block PROCESS -message $URI)
			(Invoke-RestMethod $URI -Credential $CiresonPortalCred) -as [PSCustomObject]
		}
		CATCH
		{
			$Error[0]
		}
	}
}

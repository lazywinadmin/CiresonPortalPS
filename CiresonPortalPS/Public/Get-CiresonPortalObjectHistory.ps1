function Get-CiresonPortalObjectHistory
{
<#
	.SYNOPSIS
		Function to retrieve the history of an SCSM object
	
	.DESCRIPTION
		Function to retrieve the history of an SCSM object
	
	.PARAMETER Id
		Specifies the Base ID / GUID of the object that you want to retrieve the history for.
			
	.EXAMPLE
		# Retrieve Object History
		Get-CiresonPortalObjectHistory -Id 'f05ea0f0-bd02-143e-2b74-303609750328'
		
	.NOTES
        github.com/lazywinadmin/CiresonPortal

        Contribution from Adrian Paech, Thank you!
        https://community.cireson.com/profile/Adrian_Paech
#>
#requires -version 3
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory = $true)]
		[guid]$Id
	)
	BEGIN
	{
		TRY{
			Write-Verbose -Message $(New-ScriptMessage -Block BEGIN -message 'Checking Pre-Requisites')
			[void](Get-CiresonPortalPSConfiguration -WarningAction Stop)
		}
		CATCH
		{
			# Stop the function
			Throw "Not Connected to Cireson Portal"
		}
	}
	PROCESS
	{
		TRY
		{
			# Build the Query
			$URI = $CiresonPortalURL, "Search/GetObjectHistory?id=$Id" -join '/'
			
			# Invoke the Query
			Write-Verbose -Message $(New-ScriptMessage -Block PROCESS -message $URI)
			(Invoke-RestMethod $URI -Credential $CiresonPortalCred) -as [pscustomobject]
		}
		CATCH{
			$error[0]
		}
	}
}

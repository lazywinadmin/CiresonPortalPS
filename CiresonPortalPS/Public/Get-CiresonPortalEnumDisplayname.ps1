function Get-CiresonPortalEnumDisplayName
{
<#
	.SYNOPSIS
		Function to retrieve the Display Name of a specific Enum ID.
	
	.DESCRIPTION
		Function to retrieve the Display Name of a specific Enum ID.
	
	.PARAMETER ClassID
		Enum ID. the value must be a GUID.
	
	.EXAMPLE
		# Retrieve the Activity Stage
		Get-CiresonPortalEnumDisplayName -ID 'f05ea0f0-bd02-143e-2b74-303609750328'
	
	.NOTES
		github.com/lazywinadmin/CiresonPortalPS

		Contribution from Adrian Paech, Thank you!
    	https://community.cireson.com/profile/Adrian_Paech
#>
#requires -version 3
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory = $true)]
		[guid]$ID
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
			$URI = $CiresonPortalURL, "api/V3/Enum/GetEnumDisplayName?id=$ID" -join '/'
			
			# Invoke the Query
			Write-Verbose -Message $(New-ScriptMessage -Block PROCESS -message $URI)
			(Invoke-RestMethod $URI -Credential $CiresonPortalCred) -as [pscustomobject]
		}
		CATCH{
			$PSCmdlet.ThrowTerminatingError($_)
		}
	}
}

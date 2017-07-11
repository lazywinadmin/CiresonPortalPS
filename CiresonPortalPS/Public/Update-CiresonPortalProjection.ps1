function Update-CiresonPortalProjection
{
<#
.SYNOPSIS
    Function to update a type projection with changes.

.DESCRIPTION
    Function to update a type projection with changes.

.PARAMETER OrigionalData
    The origional PSCustomObject which contains all of the properties of the type projection

.PARAMETER CurrentData
    The 'copy' of Origional with required changes. 
    Making a copy can be a bit tricky, the only effective way to do this is to use: $CurrentData = $OrigionalData | ConvertTo-Json -depth 100 | ConvertFrom-Json
    Alternatively 'Get-CiresonPortalProjection' Provides a 'ReturnDuplicateCopy' parameter, which will produce a duplicate copy of the origional Json response for this purpose.

.EXAMPLE
    Update-CiresonPortalProjection -OrigionalData $orig -CurrentData $new

.NOTES
    github.com/lazywinadmin/CiresonPortal

    Contribution from Adrian Paech, Thank you!
    https://community.cireson.com/profile/Adrian_Paech
#>
[CmdletBinding()]
PARAM(
    [parameter(Mandatory=$true)]
    [PSCustomObject]$OrigionalData,

    [parameter(Mandatory=$true)]
    [PSCustomObject]$CurrentData
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
			break
		}
	}
	PROCESS
	{
        TRY{
            # Build the Query
            $URI = $CiresonPortalURL,"/api/V3/Projection/Commit" -join '/'
            Write-Verbose -Message $(New-ScriptMessage -Block PROCESS -message $URI)
            
            $JSONCurrent = $CurrentData | ConvertTo-Json -Depth 100
            $JSONOrig = $OrigionalData | ConvertTo-Json -Depth 100

            $JSONCombined = '{ "formJson" : { "current" : ' + $JSONCurrent + ', "original" : ' + $JSONOrig + ' } }'

            # Invoke the Post Query
            Invoke-RestMethod $URI -Credential $CiresonPortalCred -Method Post -ContentType "application/json" -Body $JSONCombined 
        }
        CATCH{
            $PSCmdlet.ThrowTerminatingError($_)
        }
    }
}
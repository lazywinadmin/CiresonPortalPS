function Get-CiresonPortalProjection
{
<#
.SYNOPSIS
    Function to retrieve WorkItem Projection

.DESCRIPTION
    Function to retrieve WorkItem Projection

.PARAMETER Id
    The string id of the object (i.e. IR123)

.PARAMETER TypeProjectionId
    The id of the type projection

.PARAMETER ReturnDuplicateCopy
    If True, will return an array with two results.
    The results will be identical, however each object will be a duplicate of the other. 
    This will assist with using "Commit-CiresonPortalProjection".

.EXAMPLE
    Get-CiresonPortalProjection -Id "SR1234" -$TypeProjectionId "d53bc187-1943-b180-8db1-e8f1306b0bad" -ReturnDuplicateCopy $true

.NOTES
    github.com/lazywinadmin/CiresonPortal

    Contribution from Adrian Paech, Thank you!
    https://community.cireson.com/profile/Adrian_Paech
#>
[CmdletBinding()]
PARAM(
    [parameter(Mandatory=$true)]
    [System.String]$Id,

    [parameter(Mandatory=$true)]
    [guid]$TypeProjectionId,

    [bool]$ReturnDuplicateCopy
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
        # Build the Query
        $URI = $CiresonPortalURL,"api/V3/Projection/GetProjection?id=$Id&typeProjectionId=$TypeProjectionId" -join '/'
        Write-Verbose -Message $(New-ScriptMessage -Block PROCESS -message $URI)
        
        # Invoke the Query
        $result = (Invoke-RestMethod $URI -Credential $CiresonPortalCred) -as [pscustomobject]

        If ($ReturnDuplicateCopy) {
            $result, $($result | ConvertTo-Json -depth 100 | ConvertFrom-Json)
        }
        Else {
            $result            
        }
    }
}
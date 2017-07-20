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

    # You can use SMLets to get a list of all available Type Projection IDs...
    Import-Module SMLets
    Get-SCSMTypeProjection | Select Name, Id

.PARAMETER ReturnDuplicateCopy
    If Specified, will return an array with two results.
    The results will be identical, however each object will be a duplicate of the other. 
    This will assist with using "Commit-CiresonPortalProjection".

.EXAMPLE
    # Get our SR Type Projection
    Import-Module SMLets    
    $SRTypeProjID = (Get-SCSMTypeProjection -Name "Cireson.ServiceRequest.ViewModel").Id
    
    # Get Type Projection Data results for SR1234
    Get-CiresonPortalProjection -Id "SR1234" -$TypeProjectionId $SRTypeProjID

    # OR... Get duplicate copy of Type Projection results for SR1234
    $dupTPs = Get-CiresonPortalProjection -Id "SR1234" -$TypeProjectionId $SRTypeProjID -ReturnDuplicateCopy

    # Store the results into seperate variables which can then be used to update a type projection with 'Update-CiresonPortalProjection'
    $orig = $dupTPs[0]; $new = $dupTPs[0]

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

    [Switch]$ReturnDuplicateCopy
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
        # Build the Query
        $URI = $CiresonPortalURL,"api/V3/Projection/GetProjection?id=$Id&typeProjectionId=$TypeProjectionId" -join '/'
        Write-Verbose -Message $(New-ScriptMessage -Block PROCESS -message $URI)
        
        # Invoke the Query
        $result = (Invoke-RestMethod -Uri $URI -Credential $CiresonPortalCred) -as [pscustomobject]

        If ($ReturnDuplicateCopy) {
            $result, $($result | ConvertTo-Json -depth 100 | ConvertFrom-Json)
        }
        Else {
            $result            
        }
    }
}
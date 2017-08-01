function Create-CiresonPortalProjectionByTemplate
{
<#
.SYNOPSIS
    Function to Create a new blank work item.

.DESCRIPTION
    Function to Create a new blank work item.

.PARAMETER Id
    The Id of the Work Item Template.

.PARAMETER createdById
    The Id of the user who is creating the work item.
    This is the BaseId of the user.

.EXAMPLE
    # Get the ID of our Template
    Import-Module SMLets   
    $WITemplate = (Get-SCSMObjectTemplate -Name "ObjectTemplate.e005211b04264471af76e136e6571eec" -ComputerName "agdsm02").Id
    
    # This returns back JSON code of the new ticket that has been temporarily created.
    Create-CiresonPortalProjectionByTemplate -Id $WITemplate -createdById "f45469a7-5424-601d-05e7-dcdc2b7a10b4"
    
    This is then combined with "Update-CiresonPortalProjection" in order to save the new work item.

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
    [guid]$createdById
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
        $URI = $CiresonPortalURL,"api/V3/Projection/CreateProjectionByTemplate?id=$Id&createdById=$createdById" -join '/'
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
function Update-CiresonPortalProjection
{
<#
.SYNOPSIS
    Function to update a type projection with changes.

.DESCRIPTION
    In order for this function to work, you need to pass two objects to 'Update-CiresonPortalProjection'. 
    'OrigionalData' should contain the data structure of the Type Projection, and 'CurrentData' should contain the updated data structure of the Type Projection.
    The cireson portal REST API will then digest this data, compare the difference, and then apply the changes.
    By default, the Cireson Portal will run a Concurrency Check, to verify that 'OrigionalData' matches the data currently stored within SCSM.
    If you dont need to undertake this check, you can turn this off to force changes to apply: -Force

.PARAMETER OrigionalData
    The origional PSCustomObject which contains all of the properties of the type projection

.PARAMETER CurrentData
    The 'copy' of Origional with required changes. 
    Making a copy can be a bit tricky, the only effective way to do this is to use: $CurrentData = $OrigionalData | ConvertTo-Json -depth 100 | ConvertFrom-Json
    Alternatively 'Get-CiresonPortalProjection' Provides a 'ReturnDuplicateCopy' parameter, which will produce a duplicate copy of the origional Json response for this purpose.

.PARAMETER Force
    When 'True' This will prevent a concurrency check from running, comparing 'OrigionalData' to ensure it matches the current data within SCSM. 
    
.EXAMPLE
    Update-CiresonPortalProjection -OrigionalData $orig -CurrentData $new -Force
    
.EXAMPLE
    Updating a property via a type projection:

    # Get your type projection ID.
    Import-Module SMLets
    $SRTypeProjID = (Get-SCSMTypeProjection -Name "Cireson.ServiceRequest.ViewModel").Id
    
    # Get Duplicate Copy of Type Projection
    $dupTPs = get-CiresonPortalProjection -Id "SR11499" -TypeProjectionId $SRTypeProj -ReturnDuplicateCopy
    $orig = $dupTPs[0]
    $new = $dupTPs[1]

    $new.Title = "Some New Title"

    # Save Changes
    Update-CiresonPortalProjection -OrigionalData $orig -CurrentData $new

.EXAMPLE
    Adding a new relationship that does not already exist:

    # Get your type projection ID.
    $SCSMServer = "<SERVER NAME>"

    Import-Module SMLets
    $SRTypeProjID = (Get-SCSMTypeProjection -ComputerName $SCSMServer -Name "Cireson.ServiceRequest.ViewModel").Id
    
    # Get Duplicate Copy of Type Projection
    $dupTPs = get-CiresonPortalProjection -Id "SR11499" -TypeProjectionId $SRTypeProjID -ReturnDuplicateCopy
    $orig = $dupTPs[0]
    $new = $dupTPs[1]

    # Get User
    $user = Get-CiresonPortalUser -UserDisplayName "<USERNAME or DISPLAY NAME> "
    
    # Rename 'Id' property to 'BaseId'
    # This is required to allow data to be digested correctly by the Cireson Portal API...
    $user | add-member -Name BaseId -MemberType NoteProperty -Value $user.Id
    $user.PSObject.Members.Remove('Id')

    # Add your relationship if the relationship property does not already exist. (in this case for 'AssignedWorkItem')
    $new | add-member -Name AssignedWorkItem -MemberType NoteProperty -Value $user
    # Alternatively update the relationship if it already exists
    $new.AssignedWorkItem = $user

    # Save Changes
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
    [PSCustomObject]$CurrentData,
        
    [Switch]$Force
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
        TRY{
            # Build the Query
            If ($Force) {
                $URI = $CiresonPortalURL,"/api/V3/Projection/Commit?runConcurrencyCheck=False" -join '/'
            }
            Else {
                $URI = $CiresonPortalURL,"/api/V3/Projection/Commit" -join '/'
            }
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
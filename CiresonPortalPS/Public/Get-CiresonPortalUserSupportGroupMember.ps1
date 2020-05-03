function Get-CiresonPortalUserSupportGroupMember
{
<#
.SYNOPSIS
    Returns a list of members of a support group enumeration.
.DESCRIPTION
    Returns a list of members of a support group enumeration.
.PARAMETER SupporGroupID
    Specifies the Suppor Group ID (GUID)
.EXAMPLE
    Get-CiresonPortalSupportGroupMember -SupporGroupID $ID
.NOTES
    Francois-Xavier Cat
    lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
#>
PARAM(
    [parameter(Mandatory)]
    $SupportGroupID
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
        # Build Query
        $URI = $CiresonPortalURL, "api/V3/User/GetSupportGroupUsers?id=$SupportGroupID" -join '/'
        Write-Verbose -Message $(New-ScriptMessage -Block PROCESS -message $URI)
        
        # Invoke Query
        (Invoke-RestMethod $URI -Credential $CiresonPortalCred) -as [pscustomobject]
    }
}

function Get-CiresonPortalUserSupportGroupMember
{
<#
.SYNOPSIS
    Returns a list of members of a support group enumeration.
.EXAMPLE
    Get-CiresonPortalSupportGroupMember -SupporGroupID $ID
.NOTES
    Francois-Xavier	Cat
    www.lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
#>
PARAM(
    [parameter(Mandatory)]
    $SupporGroupID
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
        # Build Query
        $URI = $CiresonPortalURL, "api/V3/User/GetSupportGroupUsers?id=$SupportGroupID" -join '/'
        Write-Verbose -Message $(New-ScriptMessage -Block PROCESS -message $URI)
        
        # Invoke Query
        (Invoke-RestMethod $URI -Credential $CiresonPortalCred) -as [pscustomobject]
    }
}

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
    # Returns a list of members of a support group enumeration.
    $URI = $CiresonPortalURL, "api/V3/User/GetSupportGroupUsers?id=$SupportGroupID" -join '/'
    Invoke-RestMethod $URI -Credential $CiresonPortalCred
}

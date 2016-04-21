function Get-CiresonPortalUserDomainGroup
{
<#
Returns a list of all domain groups.

Get-CiresonPortalDomainGroup
.NOTES
    Francois-Xavier	Cat
    www.lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
#>

    $URI = $CiresonPortalURL,"api/V3/User/GetConsoleGroups" -join '/'
    Invoke-RestMethod $URI -Credential $CiresonPortalCred
}

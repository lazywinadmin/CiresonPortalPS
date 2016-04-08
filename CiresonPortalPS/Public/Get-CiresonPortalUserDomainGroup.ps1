function Get-CiresonPortalUserDomainGroup
{
<#
Returns a list of all domain groups.

Get-CiresonPortalDomainGroup
#>

    $URI = $CiresonPortalURL,"/V3/User/GetConsoleGroups" -join '/'
    Invoke-RestMethod $URI -Credential $CiresonPortalCred
}

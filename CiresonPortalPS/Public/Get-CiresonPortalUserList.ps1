function Get-CiresonPortalUserList
{
<#
.SYNOPSIS
    Returns a list of users with minimal properties.
.EXAMPLE
    Get-CiresonPortalUserList -UserFilter 'francois-xavier'
.NOTES
    Francois-Xavier	Cat
    www.lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
#>
PARAM(
    [parameter(Mandatory)]
    [string]$UserFilter,
    [switch]$FilterByAnalyst=$False,
    [switch]$GroupsOnly=$false,
    [int]$maxNumberOfResults=10
)
    
    $URI = $CiresonPortalURL,"api/V3/User/GetUserList?userFilter=$UserFilter&filterByAnalyst=$FilterByAnalyst&groupsOnly=$GroupsOnly&maxNumberOfResults=$maxNumberOfResults" -join '/'
    Invoke-RestMethod $URI -Credential $CiresonPortalCred
}

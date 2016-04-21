function Get-CiresonPortalUserSearch
{
<#
.SYNOPSIS
    Returns a list of filtered users and/or groups

    /V3/User/GetUserSearchResults?userFilter={userFilter}&page={page}&pageSize={pageSize}&filterByAnalyst={filterByAnalyst}&groupsOnly={groupsOnly}
.NOTES
    Francois-Xavier	Cat
    www.lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
#>
PARAM(
    [parameter(Mandatory)]
    [string]$UserFilter,
    [int]$Page=1,
    [int]$PageSize=1,
    [switch]$FilterByAnalyst=$False,
    [switch]$GroupsOnly=$false
)
    $URI = $CiresonPortalURL,"api/V3/User/GetUserSearchResults?userFilter=$UserFilter&page=$Page&pageSize=$PageSize&filterByAnalyst=$FilterByAnalyst&groupsOnly=$GroupsOnly&dataFilters=&dataSorts=" -join '/'
    Invoke-RestMethod $URI -Credential $CiresonPortalCred
}
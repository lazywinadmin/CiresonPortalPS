function Get-CiresonPortalUserList
{
<#
    Returns a list of users with minimal properties.
    Get-CiresonPortalUserList -UserFilter 'francois-xavier'
#>
PARAM(
    [parameter(Mandatory)]
    [string]$UserFilter,
    [switch]$FilterByAnalyst=$False,
    [switch]$GroupsOnly=$false,
    [int]$maxNumberOfResults=10
)
    
    $URI = $CiresonPortalURL,"/V3/User/GetUserList?userFilter=$UserFilter&filterByAnalyst=$FilterByAnalyst&groupsOnly=$GroupsOnly&maxNumberOfResults=$maxNumberOfResults" -join '/'
    Invoke-RestMethod $URI -Credential $CiresonPortalCred
}

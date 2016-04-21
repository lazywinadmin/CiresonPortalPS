function Get-CiresonPortalWorkItemByUserGroup
{
<#
    # Get Work Item for my group (Returns Grid Work Items for User Groups)

    Get-CiresonPortalWorkItemByUserGroup -UserID $UserID
    .NOTES
    Francois-Xavier	Cat
    www.lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
#>
PARAM(
[parameter(Mandatory)]
[guid]$UserID,
[Switch]$isScoped=$false,
[Switch]$showActivities=$true,
[Switch]$showInactiveItems=$true
)
    # Build the Query
    $URI = $CiresonPortalURL,"api/V3/WorkItem/GetGridWorkItemsMyGroups?userId=$UserID&isScoped=$($isScoped.tostring().tolower())&showActivities=$($showActivities.tostring().tolower())&showInactiveItems=$($showInactiveItems.tostring().tolower())" -join '/'
    
    # Invoke the Query
    Invoke-RestMethod $URI -Credential $CiresonPortalCred
}

function Get-CiresonPortalWorkItemByUserGroup
{
<#
    # Get Work Item for my group (Returns Grid Work Items for User Groups)

    Get-CiresonPortalWorkItemByUserGroup -UserID $UserID
#>
PARAM(
[parameter(Mandatory)]
[guid]$UserID,
[Switch]$isScoped=$false,
[Switch]$showActivities=$true,
[Switch]$showInactiveItems=$true
)
    # Configuration Items
    $URI = $CiresonPortalURL,"/V3/WorkItem/GetGridWorkItemsMyGroups?userId=$UserID&isScoped=$($isScoped.tostring().tolower())&showActivities=$($showActivities.tostring().tolower())&showInactiveItems=$($showInactiveItems.tostring().tolower())" -join '/'
    Invoke-RestMethod $URI -Credential $CiresonPortalCred
}

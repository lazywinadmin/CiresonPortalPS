function Get-CiresonPortalWorkItemClosedByUser
{
<#
    Returns Closed Grid Work Items for User - GetGridWorkItemsMyClosedRequests
    
    Get-CiresonPortalWorkItemClosedByUser -UserID $TestUserGUID -MaxCount 1
#>
PARAM(
[parameter(Mandatory)]
[guid]$UserID,
[int]$MaxCount
)
    # Configuration Items
    $URI = $CiresonPortalURL,"/V3/WorkItem/GetGridWorkItemsMyClosedRequests?userId=$UserID&maxCount=$MaxCount" -join '/'
    Invoke-RestMethod $URI -Credential $CiresonPortalCred
}

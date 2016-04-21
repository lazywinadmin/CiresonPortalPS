function Get-CiresonPortalWorkItemClosedByUser
{
<#
    Returns Closed Grid Work Items for User - GetGridWorkItemsMyClosedRequests
    
    Get-CiresonPortalWorkItemClosedByUser -UserID $TestUserGUID -MaxCount 1
    .NOTES
    Francois-Xavier	Cat
    www.lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
#>
PARAM(
[parameter(Mandatory)]
[guid]$UserID,
[int]$MaxCount
)
    # Build the Query
    $URI = $CiresonPortalURL,"api/V3/WorkItem/GetGridWorkItemsMyClosedRequests?userId=$UserID&maxCount=$MaxCount" -join '/'
    
    # Invoke the Query
    Invoke-RestMethod $URI -Credential $CiresonPortalCred
}

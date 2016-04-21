function Get-CiresonPortalWorkItemItemsByUser
{
  <#
  .SYNOPSIS
  .NOTES
    Francois-Xavier	Cat
    www.lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
  
  #>
PARAM(
  [parameter(Mandatory)]
  $UserID,
  [Switch]$isScoped=$false,
  [Switch]$showActivities=$true,
  [Switch]$showInactiveItems=$true
)
    # Build the Query
    $URI = $CiresonPortalURL,"api/V3/WorkItem/GetGridWorkItemsByUser?userId=$UserID&isScoped=$($isScoped.tostring().tolower())&showActivities=$($showActivities.tostring().tolower())&showInactiveItems=$($showInactiveItems.tostring().tolower())" -join '/'
    
    # Invoke the Query
    Invoke-RestMethod $URI -Credential $CiresonPortalCred
}

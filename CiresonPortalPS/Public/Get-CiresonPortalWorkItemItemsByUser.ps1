function Get-CiresonPortalWorkItemItemsByUser
{
PARAM(
  [parameter(Mandatory)]
  $UserID,
  [Switch]$isScoped=$false,
  [Switch]$showActivities=$true,
  [Switch]$showInactiveItems=$true
)
    # Configuration Items
    $URI = $CiresonPortalURL,"/V3/WorkItem/GetGridWorkItemsByUser?userId=$UserID&isScoped=$($isScoped.tostring().tolower())&showActivities=$($showActivities.tostring().tolower())&showInactiveItems=$($showInactiveItems.tostring().tolower())" -join '/'
    Invoke-RestMethod $URI -Credential $CiresonPortalCred
}

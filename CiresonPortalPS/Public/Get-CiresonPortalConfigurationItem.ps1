function Get-CiresonPortalConfigurationItem
{
PARAM(
[parameter(Mandatory)]
$ItemFilter
)
    # Configuration Items
    $URI = $CiresonPortalURL,"/V3/Config/GetAffectedItemsList?itemFilter=$ItemFilter" -join '/'
    Invoke-RestMethod $URI -Credential $CiresonPortalCred
}

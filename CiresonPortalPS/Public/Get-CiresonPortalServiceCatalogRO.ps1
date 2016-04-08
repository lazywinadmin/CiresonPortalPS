function Get-CiresonPortalServiceCatalogRO
{
<#
.EXAMPLE
    Get-ServiceCatalogRO -SearchText "Other Request" -SearchType All
#>
PARAM(
$SearchText,
[ValidateSet("Incidents","Requests","Favorites","All")]
$SearchType
)
    $URL = $CiresonPortalURL,"/V3/ServiceCatalog/Search?searchText=$SearchText&searchType=$SearchType&skipCount=0&takeCount=0" -join '/'
    Invoke-RestMethod $url -Credential $CiresonPortalCred
}

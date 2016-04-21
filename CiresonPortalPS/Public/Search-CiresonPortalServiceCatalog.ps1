function Search-CiresonPortalServiceCatalog
{
<#
.EXAMPLE
    Get-ServiceCatalogRO -SearchText "Other Request" -SearchType All
.NOTES
    Francois-Xavier	Cat
    www.lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
#>
PARAM(
$SearchText,
[ValidateSet("Incidents","Requests","Favorites","All")]
$SearchType
)
    $URL = $CiresonPortalURL,"api/V3/ServiceCatalog/Search?searchText=$SearchText&searchType=$SearchType&skipCount=0&takeCount=0" -join '/'
    Invoke-RestMethod $url -Credential $CiresonPortalCred
}

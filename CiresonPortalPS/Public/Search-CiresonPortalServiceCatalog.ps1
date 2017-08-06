function Search-CiresonPortalServiceCatalog
{
<#
.SYNOPSIS
    Search the service catalog by type of Request Offering and by text.
.DESCRIPTION
    Search the service catalog by type of Request Offering and by text.
.PARAMETER searchText
    Text to search on
.PARAMETER searchType
    String, values can be "Incidents", "Requests", "Favorites", or "All"
.PARAMETER skipCount
    Default to 0, calculated automatically based of results already returned
.PARAMETER takeCount
    For pagination / infinite-scroll. Integer number of results to return per page
.EXAMPLE
    Get-ServiceCatalogRO -SearchText "Other Request" -SearchType All
.NOTES
    Francois-Xavier Cat
    lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
#>
#requires -version 3
[CmdletBinding()]
PARAM(
    $SearchText,
    [ValidateSet("Incidents","Requests","Favorites","All")]
    $SearchType,
    $SkipCount=0,
    $takeCount=0
)
    BEGIN
	{
		TRY{
			Write-Verbose -Message $(New-ScriptMessage -Block BEGIN -message 'Checking Pre-Requisites')
			[void](Get-CiresonPortalPSConfiguration -WarningAction Stop)
		}
		CATCH
		{
			# Stop the function
			Throw "Not Connected to Cireson Portal"
		}
	}
	PROCESS
	{
        # Build Query
        $URL = $CiresonPortalURL,"api/V3/ServiceCatalog/Search?searchText=$SearchText&searchType=$SearchType&skipCount=$SkipCount&takeCount=$takeCount" -join '/'
        Write-Verbose -Message $(New-ScriptMessage -Block PROCESS -message $URL)
        
        # Invoke Query
        (Invoke-RestMethod $url -Credential $CiresonPortalCred) -as [pscustomobject]
    }
}

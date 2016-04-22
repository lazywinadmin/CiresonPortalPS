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
#requires -version 3
[CmdletBinding()]
PARAM(
    $SearchText,
    [ValidateSet("Incidents","Requests","Favorites","All")]
    $SearchType
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
			break
		}
	}
	PROCESS
	{
        # Build Query
        $URL = $CiresonPortalURL,"api/V3/ServiceCatalog/Search?searchText=$SearchText&searchType=$SearchType&skipCount=0&takeCount=0" -join '/'
        Write-Verbose -Message $(New-ScriptMessage -Block PROCESS -message $URL)
        
        # Invoke Query
        (Invoke-RestMethod $url -Credential $CiresonPortalCred) -as [pscustomobject]
    }
}

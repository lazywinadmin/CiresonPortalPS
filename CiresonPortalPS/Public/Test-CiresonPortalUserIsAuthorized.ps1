function Test-CiresonPortalUserIsAuthorized
{
<#
.EXAMPLE
    Test-CiresonPortalUserIsAuthorized -UserName 'francois-xavier.cat' -Domain 'TestDomain'
.NOTES
    Francois-Xavier	Cat
    www.lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
#>
#requires -version 3
[CmdletBinding()]
PARAM(
    [parameter(Mandatory)]
    [String]$UserName,
    [String]$Domain)
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
        # Build the Query
        $URI = $CiresonPortalURL,"api/V3/User/IsUserAuthorized?userName=$UserName&domain=$Domain" -join '/'
        Write-Verbose -Message $(New-ScriptMessage -Block PROCESS -message $URI)
        
        # Invoke the Query
        Invoke-RestMethod $URI -Credential $CiresonPortalCred -Method Post
    }
}
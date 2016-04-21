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
PARAM(
    [parameter(Mandatory)]
    [String]$UserName,
    [String]$Domain)
    
    # Build the Query
    $URI = $CiresonPortalURL,"api/V3/User/IsUserAuthorized?userName=$UserName&domain=$Domain" -join '/'
    
    # Invoke the Query
    Invoke-RestMethod $URI -Credential $CiresonPortalCred -Method Post
}
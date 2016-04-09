function Test-CiresonPortalUserIsAuthorized
{
<#
.EXAMPLE
    Test-CiresonPortalUserIsAuthorized -UserName 'francois-xavier.cat' -Domain 'TestDomain'
#>
PARAM(
    [parameter(Mandatory)]
    [String]$UserName,
    [String]$Domain)
    $URI = $CiresonPortalURL,"/V3/User/IsUserAuthorized?userName=$UserName&domain=$Domain" -join '/'
    Invoke-RestMethod $URI -Credential $CiresonPortalCred -Method Post
}
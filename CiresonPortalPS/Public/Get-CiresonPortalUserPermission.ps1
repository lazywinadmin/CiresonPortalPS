function Get-CiresonPortalUserPermission
{
<#
.EXAMPLE
    Get-CiresonPortalUserPermission -UserName 'francois-xavier.cat'
.EXAMPLE
    Get-CiresonPortalUserPermission -UserName 'francois-xavier.cat' -Domain 'TestDomain'
#>
PARAM(
    [parameter(Mandatory)]
    [String]$UserName,
    [String]$Domain)
    
    (Test-CiresonPortalUserIsAuthorized @PSBoundParameters).security
}
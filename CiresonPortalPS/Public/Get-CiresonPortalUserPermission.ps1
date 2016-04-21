function Get-CiresonPortalUserPermission
{
<#
.EXAMPLE
    Get-CiresonPortalUserPermission -UserName 'francois-xavier.cat'
.EXAMPLE
    Get-CiresonPortalUserPermission -UserName 'francois-xavier.cat' -Domain 'TestDomain'
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
    
    (Test-CiresonPortalUserIsAuthorized @PSBoundParameters).security
}
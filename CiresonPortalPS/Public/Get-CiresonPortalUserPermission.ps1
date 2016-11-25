function Get-CiresonPortalUserPermission
{
<#
.SYNOPSIS
    Returns the user permissions
.DESCRIPTION
    Returns the user permissions
.PARAMETER UserName
    Specifies the account to check
.PARAMETER Domain
    Specifies the domain where the username belong
.EXAMPLE
    Get-CiresonPortalUserPermission -UserName 'francois-xavier.cat'
.EXAMPLE
    Get-CiresonPortalUserPermission -UserName 'francois-xavier.cat' -Domain 'TestDomain'
.NOTES
    Francois-Xavier Cat
    lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
#>
PARAM(
    [parameter(Mandatory)]
    [String]$UserName,
    [String]$Domain)
    
    (Test-CiresonPortalUserIsAuthorized @PSBoundParameters).security
}
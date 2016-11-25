function Get-CiresonPortalUserPreference
{
<#
.SYNOPSIS
    Retrieve the user Preferences
.DESCRIPTION
    Retrieve the user Preferences
.PARAMETER UserName
    Specifies the account of the user
.PARAMETER Domain
    Specifies the domain where the username belong
.EXAMPLE
    Get-CiresonPortalUserPreference -UserName francois-xavier.cat
.EXAMPLE
    Get-CiresonPortalUserPreference -UserName 'francois-xavier.cat' -Domain 'TestDomain'
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
    
    (Test-CiresonPortalUserIsAuthorized @PSBoundParameters).Preferences
}
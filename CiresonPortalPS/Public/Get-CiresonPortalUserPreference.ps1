function Get-CiresonPortalUserPreference
{
<#
.EXAMPLE
    Get-CiresonPortalUserPreference -UserName francois-xavier.cat
.EXAMPLE
    Get-CiresonPortalUserPreference -UserName 'francois-xavier.cat' -Domain 'TestDomain'
#>
PARAM(
    [parameter(Mandatory)]
    [String]$UserName,
    [String]$Domain)
    
    (Test-CiresonPortalUserIsAuthorized @PSBoundParameters).Preferences
}
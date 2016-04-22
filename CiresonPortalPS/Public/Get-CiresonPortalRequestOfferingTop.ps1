function Get-CiresonPortalRequestOfferingTop
{
<#
.SYNOPSIS
    Function to retrieve Top Request Offering for a User
.DESCRIPTION
    Function to retrieve Top Request Offering for a User
.EXAMPLE
    Get-CiresonPortalRequestOfferingTop -UserID $User.Id -ReturnAmount 2
.NOTES
    Francois-Xavier	Cat
    www.lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
#>
#requires -version 3
[Cmdletbinding()]
PARAM(
    [parameter(Mandatory)]
    [GUID]$UserID,
    [int]$ReturnAmount,
    [switch]$IsScoped=$false
)
    $URI = $CiresonPortalURL,"api/V3/ServiceCatalog/GetTopRequestOffering?userId=$UserID&returnAmount=$ReturnAmount&isScoped=$($IsScoped.tostring().tolower())" -join '/'
    (Invoke-RestMethod $URI -Credential $CiresonPortalCred) -as [pscustomobject]
}


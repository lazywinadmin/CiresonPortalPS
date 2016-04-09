function Get-CiresonPortalRequestOfferingTop
{
<#
.SYNOPSYS
    Function to retrieve Top Request Offering for a User
.DESCRIPTION
    Function to retrieve Top Request Offering for a User
.EXAMPLE
    Get-CiresonPortalRequestOfferingTop -UserID $User.Id -ReturnAmount 2
#>
[Cmdletbinding()]
PARAM(
[parameter(Mandatory)]
[GUID]$UserID,
[int]$ReturnAmount,
[switch]$IsScoped=$false
)
    $URI = $CiresonPortalURL,"/V3/ServiceCatalog/GetTopRequestOffering?userId=$UserID&returnAmount=$ReturnAmount&isScoped=$($IsScoped.tostring().tolower())" -join '/'
    Invoke-RestMethod $URI -Credential $CiresonPortalCred
}


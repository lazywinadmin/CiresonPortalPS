function Get-CiresonPortalRequestOfferingDetails
{
<#
.SYNOPSYS
    Function to retrieve a specific Request Offering with more details
.DESCRIPTION
    Function to retrieve a specific Request Offering with more details
.EXAMPLE
    Get-CiresonPortalRequestOfferingDetails -RequestOfferingID 4c2e9de8-c70b-c2df-b0d0-a9820391d294 -ServiceOfferingID 14b7829f-e8d3-2f95-9d20-b54d3aa93556 -UserID $User.id
#>
[Cmdletbinding()]
PARAM(
[parameter(Mandatory)]
[GUID]$UserID,
[parameter(Mandatory)]
[GUID]$RequestOfferingID,
[parameter(Mandatory)]
[GUID]$ServiceOfferingID,
[switch]$IsScoped=$false
)
    $URI = $CiresonPortalURL,"/V3/ServiceCatalog/GetRequestOffering?requestOfferingId=$RequestOfferingID&serviceOfferingId=$ServiceOfferingID&userId=$UserID&isScoped=$($IsScoped.tostring().tolower())" -join '/'
    Invoke-RestMethod $URI -Credential $CiresonPortalCred
}
function Get-CiresonPortalRequestOffering
{
<#
.SYNOPSIS
    Function to retrieve a specific Request Offering
.DESCRIPTION
    Function to retrieve a specific Request Offering
.PARAMETER RequestOfferingID
    Specifies the Request Offering ID (GUID)
.EXAMPLE
    Get-CiresonPortalRequestOffering -RequestOfferingID 4c2e9de8-c70b-c2df-b0d0-a9820391d294
.NOTES
    Francois-Xavier Cat
    lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
#>
#requires -version 3
[Cmdletbinding()]
PARAM(
    [parameter(Mandatory)]
    [GUID]$RequestOfferingID
)
    $URI = $CiresonPortalURL,"api/V3/ServiceCatalog/GetByRequestOfferingId?requestOfferingId=$RequestOfferingID" -join '/'
    Invoke-RestMethod $URI -Credential $CiresonPortalCred
}
function Set-CiresonPortalRequestOfferingAsFavorite
{
<#
.SYNOPSYS
    Function to set a Request Ofering as Favorite for a specific User
.DESCRIPTION
    Function to set a Request Ofering as Favorite for a specific User
.EXAMPLE
    Set-CiresonPortalRequestOfferingAsFavorite -RequestOfferingID 4c2e9de8-c70b-c2df-b0d0-a9820391d294 -UserID 7c7e9d78-c70b-c2df-b0d0-a9820391d294
#>
[Cmdletbinding()]
PARAM(
[parameter(Mandatory)]
[GUID]$UserID,
[parameter(Mandatory)]
[GUID]$RequestOfferingID
)
    $URI = $CiresonPortalURL,"/V3/ServiceCatalog/MarkFavorite?requestOfferingId=$RequestOfferingID&userId=$UserID" -join '/'
    Invoke-RestMethod $URI -Credential $CiresonPortalCred -Method Post
}

Set-CiresonPortalRequestOfferingAsFavorite -RequestOfferingID 4c2e9de8-c70b-c2df-b0d0-a9820391d294 -UserID 7c7e9d78-c70b-c2df-b0d0-a9820391d294

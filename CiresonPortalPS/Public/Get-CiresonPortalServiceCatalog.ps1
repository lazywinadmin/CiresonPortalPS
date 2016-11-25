function Get-CiresonPortalServiceCatalog
{
<#
.SYNOPSIS
    Function to retrieve the Service Catalog for a User
.DESCRIPTION
    Function to retrieve the Service Catalog for a User
.PARAMETER UserID
    Specifies the User ID (GUID)
.PARAMETER IsScoped
    Specifies whether the user is scoped
.PARAMETER IncludeImage
    Specifies if you want to see the base64 encoded string in the output
.PARAMETER ServiceOfferingID
    Specifies the ServiceOfferingID for which you want to see the Service Catalog
.EXAMPLE
    Get-CiresonPortalServiceCatalog -UserID $User.ID
.EXAMPLE
    Get-CiresonPortalServiceCatalog -ServiceOfferingID '14b7829f-e8d3-2f95-9d20-b54d3aa93556'
.NOTES
    Francois-Xavier Cat
    lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
#>
[Cmdletbinding(DefaultParameterSetName="UserID")]
PARAM(
[parameter(Mandatory,ParameterSetName="UserID")]
[guid]$UserID,
[parameter(ParameterSetName="UserID")]
[Switch]$isScoped=$false,
[parameter(ParameterSetName="UserID")]
[Switch]$IncludeImage,
[parameter(ParameterSetName="ServiceOfferingID")]
[GUID]$ServiceOfferingID
)

    IF ($PSCmdlet.ParameterSetName -eq 'UserID')
    {
        Write-Verbose -Message "ParameterSetName = UserID"
        $URI = $CiresonPortalURL,"api/V3/ServiceCatalog/GetServiceCatalog?userId=$userId&isScoped=$($isScoped.tostring().tolower())" -join '/'
        $ServiceCatalog = (Invoke-RestMethod $URI -Credential $CiresonPortalCred) -as [pscustomobject]

        IF ($PSBoundParameters['IncludeImage'])
        {
            Write-Verbose -Message "Include Images"
            Write-Output $ServiceCatalog
        }
        ELSE{
            Write-Verbose -Message "Without Images"
            $ServiceCatalog | Select-Object -Property categoryid,category,ServiceOfferingID,Service,RequestOfferingID,RequestOfferingTitle,RequestOfferingDescription,RequestOfferingTargetTemplateType,IsFavorite,FavoriteImage

            # -ExcludeProperty does not seem to work
            #| Select-Object -ExcludeProperty SyncRoot,RequestOfferingImage64,RequestOfferingImage,ServiceImage, ServiceImage64
        }
    }
    IF ($PSCmdlet.ParameterSetName -eq 'ServiceOfferingID')
    {
        Write-Verbose -Message "ParameterSetName = ServiceOfferingID"
        $URI = $CiresonPortalURL,"api/V3/ServiceCatalog/GetByServiceOfferingId?serviceOfferingId=$ServiceOfferingID" -join '/'
        (Invoke-RestMethod $URI -Credential $CiresonPortalCred) -as [pscustomobject]
    }
}
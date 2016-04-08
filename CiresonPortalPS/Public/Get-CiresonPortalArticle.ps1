function Get-CiresonPortalArticle
{
<#
Gets a list of knowledge articles

Get-CiresonPortalArticle
#>
PARAM()
    $URI = $CiresonPortalURL,"/V3/Article/Get" -join '/'
    Invoke-RestMethod $URI -Credential $CiresonPortalCred
}

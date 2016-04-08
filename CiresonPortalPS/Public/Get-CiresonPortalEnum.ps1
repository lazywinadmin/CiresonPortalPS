function Get-CiresonPortalEnum
{
<#
GetList retrieves the children of an enumeration class id that is a parent. Returns items that are only one level down from the root id that is sent.
.EXAMPLE
    # ServiceRequestPriorityEnum
    Get-CiresonPortalEnum -ClassID 'd55e65ea-fae9-f7db-0937-843bfb1367c0' -ItemFilter ""
#>
PARAM(
    [parameter(Mandatory)]
    $ClassID,
    $ItemFilter,
    [switch]$Flatten)

    $Argument = "id=$ClassID"
    IF($PSBoundParameters['ItemFilter']){$Argument+="&itemFilter=$ItemFilter"}
    IF($PSBoundParameters['Flatten']){$Argument+="&Flatten=$($Flatten.ToString().ToLower())"}
    $URI = $CiresonPortalURL,"/V3/Enum/GetList?$Argument" -join '/'
    Invoke-RestMethod $URI -Credential $CiresonPortalCred
}

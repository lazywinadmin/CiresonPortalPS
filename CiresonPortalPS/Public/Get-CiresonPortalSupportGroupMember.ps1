function Get-CiresonPortalSupportGroupMember
{
<#
Returns a list of members of a support group enumeration.

Get-CiresonPortalSupportGroupMember -SupporGroupID $ID
#>
PARAM(
    [parameter(Mandatory)]
    $SupporGroupID
)
    # Returns a list of members of a support group enumeration.
    $URI = "http://x3000/api/V3/User/GetSupportGroupUsers?id=$SupportGroupID"
    Invoke-RestMethod $URI -Credential $CiresonPortalCred
}

function Get-CiresonPortalUserSupportGroupMember
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
    $URI = $CiresonPortalURL, "/V3/User/GetSupportGroupUsers?id=$SupportGroupID" -join '/'
    Invoke-RestMethod $URI -Credential $CiresonPortalCred
}

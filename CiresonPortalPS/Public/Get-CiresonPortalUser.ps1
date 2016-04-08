function Get-CiresonPortalUser
{
<#
.PARAMETER UserID
    Returns user related information using the User Id
.PARAMETER SIPAddress
    Returns user related information using the SIPAddress
.EXAMPLE
    Get-CiresonPortalUser -UserID $UserID
.EXAMPLE
    Get-CiresonPortalUser -SIPAddress $SIPAddress
#>
[Cmdletbinding(DefaultParameterSetName="UserID")]
PARAM(
    [parameter(ParameterSetName="UserID")]
    $UserID,
    [parameter(ParameterSetName="SIPAddress")]
    $SipAddress)

    IF($PSBoundParameters['UserID'])
    {
        $URI = $CiresonPortalURL,"/V3/User/GetUserRelatedInfoByUserId?userId=$UserID" -join '/'   
    }
    IF($PSBoundParameters['SIPAddress'])
    {
     $URI = $CiresonPortalURL,"/V3/User/GetUserRelatedInfoBySIPAddress?sipAddress=$SIPAddress" -join '/'
    }

    Invoke-RestMethod $URI -Credential $CiresonPortalCred
}

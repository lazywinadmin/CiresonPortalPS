function Get-CiresonPortalUserAnalyst
{
<#
.EXAMPLE
    Get-CiresonPortalAnalyst
#>
PARAM()
    # User who are Analyst
    $URI = $CiresonPortalURL,"/V3/User/GetAnalystResults" -join '/'
    Invoke-RestMethod $URI -Credential $CiresonPortalCred
}

function Get-CiresonPortalUserAnalyst
{
<#
.EXAMPLE
    Get-CiresonPortalAnalyst
.NOTES
	Francois-Xavier	Cat
    www.lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
#>
	PARAM ()
	# User who are Analyst
	$URI = $CiresonPortalURL, "api/V3/User/GetAnalystResults" -join '/'
	(Invoke-RestMethod $URI -Credential $CiresonPortalCred) -as [PSCustomObject]
}

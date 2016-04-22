function Get-CiresonPortalUserAnalyst
{
<#
.SYNOPSIS
	Function to retrieve Analysts
.DESCRIPTION
	Function to retrieve Analysts
	This function is relying on Get-CiresonPortalUser
.EXAMPLE
    Get-CiresonPortalAnalyst
.NOTES
	Francois-Xavier	Cat
    www.lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
#>
	[CmdletBinding()]
	PARAM ()
	# User who are Analyst
	Get-CiresonPortalUser -AllAnalysts
}

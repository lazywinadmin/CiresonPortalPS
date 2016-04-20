function Get-CiresonPortalArticle
{
<#
	.SYNOPSIS
		Function to retrieve the Article (Knowledge Base articke) from the Cireson Portal
	
	.DESCRIPTION
		Function to retrieve the Article (Knowledge Base articke) from the Cireson Portal
	
	.NOTES
		Francois-Xavier Cat
		lazywinadmin.com
		@lazywinadmin
		github.com/lazywinadmin
#>
	
	[OutputType([pscustomobject])]
	param ()
	
	$URI = $CiresonPortalURL, "/V3/Article/Get" -join '/'
	(Invoke-RestMethod $URI -Credential $CiresonPortalCred) -as [PSCustomObject]
}

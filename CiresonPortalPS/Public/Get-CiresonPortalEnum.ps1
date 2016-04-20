function Get-CiresonPortalEnum
{
<#
	.SYNOPSIS
		Function to retrieve the item(s) of a specified Enum class
	
	.DESCRIPTION
		Function to retrieve the item(s) of a specified Enum class
	
	.PARAMETER ClassID
		Specifies the Class ID. the value must be a GUID.
	
	.PARAMETER ItemFilter
		Specifies the text string to search
	
	.PARAMETER Flatten
		Whether to Flatten the display names, default is false
	
	.EXAMPLE
		# Retrieve the Activity Stage
		Get-CiresonPortalEnum -ClassID 'f05ea0f0-bd02-143e-2b74-303609750328'
	
	.EXAMPLE
		# Retrieve the Service Request Priority
		Get-CiresonPortalEnum -ClassID 'd55e65ea-fae9-f7db-0937-843bfb1367c0' -ItemFilter ""
	
	.NOTES
		Francois-Xavier	Cat
		www.lazywinadmin.com
		@lazywinadm
		github.com/lazywinadmin
#>
	[CmdletBinding()]
	param
	(
		[Parameter(Mandatory = $true)]
		[guid]$ClassID,
		
		[string]$ItemFilter,
		
		[switch]$Flatten
	)
	
	$Argument = "id=$ClassID"
	IF ($PSBoundParameters['ItemFilter']) { $Argument += "&itemFilter=$ItemFilter" }
	IF ($PSBoundParameters['Flatten']) { $Argument += "&Flatten=$($Flatten.ToString().ToLower())" }
	$URI = $CiresonPortalURL, "/V3/Enum/GetList?$Argument" -join '/'
	(Invoke-RestMethod $URI -Credential $CiresonPortalCred) -as [pscustomobject]
}

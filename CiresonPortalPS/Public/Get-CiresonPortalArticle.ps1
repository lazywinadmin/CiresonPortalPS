function Get-CiresonPortalArticle
{
<#
	.SYNOPSIS
		Function to retrieve the Article (Knowledge Base articke) from the Cireson Portal
	
	.DESCRIPTION
		Function to retrieve the Article (Knowledge Base articke) from the Cireson Portal
	
		By default if no parameter is specified, the function will retrieve all the article
	
	.PARAMETER ArticleID
		Specifies the Article ID to retrieve
	
	.PARAMETER SearchValue
		Specifies the String to retrieve accross all the articles
	
	.NOTES
		Francois-Xavier Cat
		lazywinadmin.com
		@lazywinadmin
		github.com/lazywinadmin
		
		TODO:
		#GetForGrid
		Invoke-RestMethod $($CiresonPortalURL, "/V3/Article/GetForGrid" -join '/') -Credential $CiresonPortalCred -Method POST
		
		#Filter
		api/V3/Article?articleId={articleId}
		&title={title}
		&createdDate={createdDate}
		&createdDateAfter={createdDateAfter}
		&lastModifiedDate={lastModifiedDate}
		&lastModifiedDateAfter={lastModifiedDateAfter}
		&statusId={statusId}&typeId={typeId}
		&categoryId={categoryId}
		&ownerId={ownerId}
		&lastModifiedById={lastModifiedById}
		&languageId={languageId}
		&languageName={languageName}
#>
	
	[CmdletBinding(DefaultParameterSetName = 'All')]
	[OutputType([pscustomobject])]
	PARAM
	(
		[Parameter(ParameterSetName = 'ArticleID',
				   Mandatory = $true)]
		[string]$ArticleID,
		
		[Parameter(ParameterSetName = 'Search',
				   Mandatory = $true)]
		[String]$SearchValue
	)
	BEGIN
	{
		TRY{
			Write-Verbose -Message $(New-ScriptMessage -Block BEGIN -message 'Checking Pre-Requisites')
			Get-CiresonPortalPSConfiguration -WarningAction Stop
		}
		CATCH
		{
			# Stop the function
			break
		}
	}
	PROCESS
	{
	
		$URI = $CiresonPortalURL, "api/V3/Article" -join '/'
		
		
		IF ($PSBoundParameters['ArticleID'])
		{
			# Retrieve a specific article details
			#  https://support.cireson.com/Help/Api/GET-api-V3-Article_articleId
			$URI = $URI += "?articleID=$ArticleID"
		}
		ELSEIF ($PSBoundParameters['SearchValue'])
		{
			# Search a specific Value
			#  https://support.cireson.com/Help/Api/GET-api-V3-Article_searchValue
			$URI = $URI += "?SearchValue=$SearchValue"
		}
		ELSE
		{
			# Retrieve all article
			#  https://support.cireson.com/Help/Api/GET-api-V3-Article
			$URI = $URI += "/Get"
		}
		
		(Invoke-RestMethod "$URI" -Credential $CiresonPortalCred) -as [PSCustomObject]
	}
}

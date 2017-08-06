function Get-CiresonPortalRequestOfferingTop
{
<#
.SYNOPSIS
    Function to retrieve Top Request Offering for a User
.DESCRIPTION
    Function to retrieve Top Request Offering for a User
.PARAMETER UserID
    Specifies the User ID (GUID)
.PARAMETER returnAmount
    The number of offerings to return
.PARAMETER IsScoped
    Specifies whether the user is scoped
.EXAMPLE
    Get-CiresonPortalRequestOfferingTop -UserID $User.Id -ReturnAmount 2
.NOTES
    Francois-Xavier Cat
    lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
#>
#requires -version 3
[Cmdletbinding()]
PARAM(
    [parameter(Mandatory)]
    [GUID]$UserID,
    [int]$ReturnAmount,
    [switch]$IsScoped=$false
)
    BEGIN
	{
		TRY{
			Write-Verbose -Message $(New-ScriptMessage -Block BEGIN -message 'Checking Pre-Requisites')
			[void](Get-CiresonPortalPSConfiguration -WarningAction Stop)
		}
		CATCH
		{
			# Stop the function
			Throw "Not Connected to Cireson Portal"
		}
	}
	PROCESS
	{
		TRY
		{
			Write-Verbose -Message $(New-ScriptMessage -Block PROCESS -message 'Build URI')
			$URI = $CiresonPortalURL, "api/V3/ServiceCatalog/GetTopRequestOffering?userId=$UserID&returnAmount=$ReturnAmount&isScoped=$($IsScoped.tostring().tolower())" -join '/'
			Write-Verbose -Message $(New-ScriptMessage -Block PROCESS -message 'Query API')
			(Invoke-RestMethod $URI -Credential $CiresonPortalCred) -as [pscustomobject]
		}
		CATCH
		{
			$PSCmdlet.ThrowTerminatingError($_)
		}
	}
}
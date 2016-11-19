function Set-CiresonPortalRequestOfferingAsFavorite
{
<#
.SYNOPSYS
    Function to set a Request Ofering as Favorite for a specific User
.DESCRIPTION
    Function to set a Request Ofering as Favorite for a specific User
.EXAMPLE
    Set-CiresonPortalRequestOfferingAsFavorite -RequestOfferingID 4c2e9de8-c70b-c2df-b0d0-a9820391d294 -UserID 7c7e9d78-c70b-c2df-b0d0-a9820391d294
#>
#requires -version 3
[CmdletBinding(SupportsShouldProcess = $True)]
PARAM(
    [parameter(Mandatory)]
    [GUID]$UserID,
    [parameter(Mandatory)]
    [GUID]$RequestOfferingID
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
            Write-Error $Error[0]
			break
		}
	}
	PROCESS
	{
        if($PSCmdlet.ShouldProcess($UserID,'Set Request Offering as Favorite'))
        {
            # Build the Query
            $URI = $CiresonPortalURL,"api/V3/ServiceCatalog/MarkFavorite?requestOfferingId=$RequestOfferingID&userId=$UserID" -join '/'
            Write-Verbose -Message $(New-ScriptMessage -Block PROCESS -message "Uri = $URI")
            
            # Invoke the Query
            Invoke-RestMethod $URI -Credential $CiresonPortalCred -Method Post
        }
    }
}

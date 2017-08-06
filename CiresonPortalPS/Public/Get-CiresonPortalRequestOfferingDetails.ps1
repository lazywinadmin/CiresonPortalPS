function Get-CiresonPortalRequestOfferingDetails
{
<#
.SYNOPSIS
    Function to retrieve a specific Request Offering with more details
.DESCRIPTION
    Function to retrieve a specific Request Offering with more details
.PARAMETER UserID
    Specifies the User ID (GUID)
.PARAMETER RequestOfferingID
    Specifies the Request Offering ID (GUID)
.PARAMETER ServiceOfferingID
    Specifies the Service Offering ID (GUID)
.PARAMETER IsScoped
    Specifies whether the user is scoped
.EXAMPLE
    Get-CiresonPortalRequestOfferingDetails -RequestOfferingID 4c2e9de8-c70b-c2df-b0d0-a9820391d294 -ServiceOfferingID 14b7829f-e8d3-2f95-9d20-b54d3aa93556 -UserID $User.id
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
    [parameter(Mandatory)]
    [GUID]$RequestOfferingID,
    [parameter(Mandatory)]
    [GUID]$ServiceOfferingID,
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
        TRY{
            Write-Verbose -Message $(New-ScriptMessage -Block PROCESS -message 'Build URI')
            $URI = $CiresonPortalURL,"api/V3/ServiceCatalog/GetRequestOffering?requestOfferingId=$RequestOfferingID&serviceOfferingId=$ServiceOfferingID&userId=$UserID&isScoped=$($IsScoped.tostring().tolower())" -join '/'
            Write-Verbose -Message $(New-ScriptMessage -Block PROCESS -message 'Query API')
            Invoke-RestMethod $URI -Credential $CiresonPortalCred
        }
        CATCH{
                $PSCmdlet.ThrowTerminatingError($_)
        }
    }
}
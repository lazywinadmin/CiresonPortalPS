function Get-CiresonPortalWorkItem
{
<#
.SYNOPSIS
    Function to retrieve WorkItem
.DESCRIPTION
    Function to retrieve WorkItem
.EXAMPLE
    Get-CiresonPortalWorkItemClosedByUser -UserID $TestUserGUID -MaxCount 1
.NOTES
    Francois-Xavier	Cat
    www.lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
#>
[CmdletBinding()]
PARAM(
    [parameter(Mandatory)]
    [guid]$UserID,
    [int]$MaxCount
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
        # Build the Query
        $URI = $CiresonPortalURL,"api/V3/WorkItem/GetGridWorkItemsMyClosedRequests?userId=$UserID&maxCount=$MaxCount" -join '/'
        Write-Verbose -Message $(New-ScriptMessage -Block PROCESS -message $URI)
        
        # Invoke the Query
        (Invoke-RestMethod $URI -Credential $CiresonPortalCred) -as [pscustomobject]
    }
}

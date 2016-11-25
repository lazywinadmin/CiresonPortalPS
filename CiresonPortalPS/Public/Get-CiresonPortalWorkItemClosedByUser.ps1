function Get-CiresonPortalWorkItemClosedByUser
{
<#
.SYNOPSIS
    Returns Closed Grid Work Items for User - GetGridWorkItemsMyClosedRequests
.DESCRIPTION
    Returns Closed Grid Work Items for User - GetGridWorkItemsMyClosedRequests
.PARAMETER UserID
    The Guid user Id.
.PARAMETER MaxCount
    Maximum of entries to return
.EXAMPLE
    Get-CiresonPortalWorkItemClosedByUser -UserID $TestUserGUID -MaxCount 1

.NOTES
    Francois-Xavier Cat
    lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
#>
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
			break
		}
	}
	PROCESS
	{
        # Build the Query
        $URI = $CiresonPortalURL,"api/V3/WorkItem/GetGridWorkItemsMyClosedRequests?userId=$UserID&maxCount=$MaxCount" -join '/'
        
        # Invoke the Query
        (Invoke-RestMethod $URI -Credential $CiresonPortalCred) -as [pscustomobject]
    }
}

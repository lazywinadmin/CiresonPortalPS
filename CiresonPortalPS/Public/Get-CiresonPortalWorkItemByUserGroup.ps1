function Get-CiresonPortalWorkItemByUserGroup
{
<#
    # Get Work Item for my group (Returns Grid Work Items for User Groups)

    Get-CiresonPortalWorkItemByUserGroup -UserID $UserID
    .NOTES
    Francois-Xavier	Cat
    www.lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
#>
#requires -version 3
[CmdletBinding()]
PARAM(
    [parameter(Mandatory)]
    [guid]$UserID,
    [Switch]$isScoped=$false,
    [Switch]$showActivities,
    [Switch]$showInactiveItems
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
			Throw "Not Connected to Cireson Portal"
		}
	}
	PROCESS
	{
        # Build the Query
        $URI = $CiresonPortalURL,"api/V3/WorkItem/GetGridWorkItemsMyGroups?userId=$UserID&isScoped=$($isScoped.tostring().tolower())&showActivities=$($showActivities.tostring().tolower())&showInactiveItems=$($showInactiveItems.tostring().tolower())" -join '/'
        Write-Verbose -Message $(New-ScriptMessage -Block PROCESS -message "Uri = $Uri")

        # Invoke the Query
        (Invoke-RestMethod $URI -Credential $CiresonPortalCred) -as [pscustomobject]
    }
}

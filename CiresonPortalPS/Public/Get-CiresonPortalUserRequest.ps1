function Get-CiresonPortalUserRequest
{
    <#
    .SYNOPSIS
        function to retrieve the WorkItem
    #>
    PARAM(
		[GUID]$UserID)
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
        	Get-CiresonPortalUser -UserID $UserID | select -ExpandProperty myrequest
    }
}
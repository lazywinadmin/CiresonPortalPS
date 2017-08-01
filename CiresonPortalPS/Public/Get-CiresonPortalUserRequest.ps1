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
			Throw "Not Connected to Cireson Portal"
		}
	}
	PROCESS
	{
        	Get-CiresonPortalUser -UserID $UserID | Select-Object -ExpandProperty myrequest
    }
}
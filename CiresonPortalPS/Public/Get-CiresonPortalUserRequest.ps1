function Get-CiresonPortalUserRequest
{
<#
.SYNOPSIS
	function to retrieve requests open by a user
.DESCRIPTION
	function to retrieve requests open by a user
.PARAMETER UserID
    Specifies the GUID of the user account
.EXAMPLE
	Get-CiresonPortalUserRequest -UserID "4c2e9de8-c70b-c2df-b0d0-a9820391d294"
.NOTES
    Francois-Xavier Cat
    lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
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
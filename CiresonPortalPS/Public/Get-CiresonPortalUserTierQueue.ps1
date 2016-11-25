function Get-CiresonPortalUserTierQueue
{
<#
.SYNOPSIS
    Returns a list of Incident Tier Queue Enumerations where the user is a member.
.DESCRIPTION
    Returns a list of Incident Tier Queue Enumerations where the user is a member.
.PARAMETER UserID
    Specifies the User Id
.EXAMPLE
   Get-CiresonPortalUserTierQueue -UserID "030dd483-5d4a-9286-058c-248415b61f7c"
.NOTES
    Francois-Xavier Cat
    lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
.LINK
    https://support.cireson.com/Help/Api/GET-api-V3-User-GetUsersTierQueueEnumerations_id
#>
    [Cmdletbinding()]
    PARAM(
        [parameter(Mandatory)]
        [Guid]$UserID
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
        $URI = $CiresonPortalURL, "api/V3/User/GetUsersTierQueueEnumerations?id=$UserID" -join '/'
        Write-Verbose -Message $(New-ScriptMessage -Block PROCESS -message $URI)
            
        # Invoke the Query
	    (Invoke-RestMethod $URI -Credential $CiresonPortalCred) -as [PSCustomObject]
    }
}

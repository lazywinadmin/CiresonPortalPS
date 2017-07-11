function Get-CiresonPortalUserTierQueue
{
<#

.NOTES
    Francois-Xavier	Cat
    www.lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
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
			Throw "Not Connected to Cireson Portal"
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

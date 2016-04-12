function Test-CiresonPortalConnection
{
<#
	.SYNOPSIS
		Function to test if your environment is ready to connect to the Cireson Portal API
	
	.DESCRIPTION
		Function to test if your environment is ready to connect to the Cireson Portal API
		It will basically verify that the two variables $CiresonPortalURL and $CiresonPortalCred
		are present.
	
	.EXAMPLE
		PS C:\> Test-CiresonPortalConnection
	
	.NOTES
		Francois-Xavier Cat
		@lazywinadm
		www.lazywinadmin.com
		github.com/lazywinadmin
#>
PARAM()
    $Properties = @{
		"URL" = [bool](Get-Variable -name CiresonPortalURL -Scope Global -ErrorAction SilentlyContinue)
		"Credential" = [bool](Get-Variable -name CiresonPortalCred -Scope Global -ErrorAction SilentlyContinue)
	}
	New-Object -TypeName System.Management.Automation.PSObject -Property $Properties
}

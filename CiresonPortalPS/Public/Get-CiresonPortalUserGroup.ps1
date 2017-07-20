function Get-CiresonPortalUserGroup
{
<#
.SYNOPSIS
    Returns a list of all groups.

.DESCRIPTION
    Returns a list of all groups.

.EXAMPLE
    Get-CiresonPortalUserGroup

    Id                             : 37456f9b-4f69-1611-87eb-026f5b4282d5
    Name                           : fxlab\TESTGROUP
    PrincipalName                  : CN=TESTGROUP,OU=TEST,DC=fxlab,DC=local
    UserName                       : TESTGROUP
    Domain                         : 
    Company                        : 
    Title                          : 
    FirstName                      : 
    LastName                       : 
    EmployeeId                     : 
    Analyst                        : 0
    AssetManager                   : 0
    LicenseExpires                 : 0001-01-01T00:00:00
    KnowledgeManager               : 0
    IsAdmin                        : False
    Security                       : 
    IncidentForm                   : 
    ServiceRequestForm             : 
    ChangeRequestForm              : 
    ProblemForm                    : 
    ReleaseRecordForm              : 
    IncidentFormProjectionId       : 00000000-0000-0000-0000-000000000000
    ServiceRequestFormProjectionId : 00000000-0000-0000-0000-000000000000
    ProblemFormProjectionId        : 00000000-0000-0000-0000-000000000000
    ReleaseRecordFormProjectionId  : 00000000-0000-0000-0000-000000000000
    ChangeRequestFormProjectionId  : 00000000-0000-0000-0000-000000000000
    Preferences                    : 
    PreferencesJsonFormat          : 
    LanguageCode                   : ENU
    TeamGroupMembers               : 
    IsLocalizationManager          : False

.NOTES
    Francois-Xavier	Cat
    lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
#>
[cmdletbinding()]
PARAM()
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
        Write-Verbose -Message $(New-ScriptMessage -Block PROCESS -message "All Console Groups")
        # Build Query
        $URI = $CiresonPortalURL,"api/V3/User/GetConsoleGroups" -join '/'
        Write-Verbose -Message $(New-ScriptMessage -Block PROCESS -message $URI)

        # Invoke Query
        (Invoke-RestMethod $URI -Credential $CiresonPortalCred) -as [pscustomobject]
    }
}
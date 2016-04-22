Function Get-CiresonPortalUserSupportGroup
{
<#
.SYNOPSIS
    Retrieve the SupportGroup for a specific type of WorkItem or Activity
.EXAMPLE
    Get-CiresonPortalUserSupportGroup -SupportGroupType ServiceRequest

    Id          : 030dd483-5d4a-9286-058c-248415b61f7c
    Text        : QA
    Name        : QA
    HasChildren : True
    Ordinal     : 1.0
    EnumNodes   : {}

    Id          : 3e468ab2-01da-e378-7893-37df6793d301
    Text        : Facilities
    Name        : Facilities
    HasChildren : True
    Ordinal     : 2.0
    EnumNodes   : {}

    Id          : d1426958-a3d2-09d3-d9fd-2706e78f7413
    Text        : IT
    Name        : IT
    HasChildren : True
    Ordinal     : 3.0
    EnumNodes   : {}
#>
#requires -version 3
[CmdletBinding()]
PARAM (
    [parameter(Mandatory)]
    [ValidateSet('ServiceRequest','IncidentRequest')]
    $SupportGroupType
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
        switch ($SupportGroupType)
        {
            'ServiceRequest' {
                Write-Verbose -Message $(New-ScriptMessage -Block PROCESS -message 'Retrieving Support Group for $SupportGroupType')
                # ServiceRequestSupportGroupEnum '23c243f6-9365-d46f-dff2-03826e24d228'
                Get-CiresonPortalEnum -ClassID '23c243f6-9365-d46f-dff2-03826e24d228'
                }
            'IncidentRequest' {
                Write-Verbose -Message $(New-ScriptMessage -Block PROCESS -message 'Retrieving Support Group for $SupportGroupType')
                # IncidentTierQueuesEnum 'c3264527-a501-029f-6872-31300080b3bf'
                Get-CiresonPortalEnum -ClassID 'c3264527-a501-029f-6872-31300080b3bf'
                }
        }
    }
}
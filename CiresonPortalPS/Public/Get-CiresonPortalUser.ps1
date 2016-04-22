function Get-CiresonPortalUser
{
<#
.PARAMETER UserID
    Returns user related information using the User Id
    
.PARAMETER SIPAddress
    Returns user related information using the SIPAddress
    
.PARAMETER UserDisplayName
    Returns user(s) with specific displayname
    
.EXAMPLE
    Get-CiresonPortalUser -SIPAddress $SIPAddress
<<<<<<< HEAD
    
    Retrieve a user using the SIPAddress
.EXAMPLE
    Get-CiresonPortalUser -UserID 3994eb2c-0829-5cd9-2000-c2fbb11aaa15
    
    Retrieve all the details for a specific User
.EXAMPLE
    Get-CiresonPortalUser -UserDisplayName francois -Verbose
    
    Retrieve all the user that contains francois in the displayname
.EXAMPLE
    Get-CiresonPortalUser -AllAnalysts
    
    Retrieve all the Analysts
=======
>>>>>>> origin/master
.NOTES
    Francois-Xavier	Cat
    www.lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
#>
    [Cmdletbinding(DefaultParameterSetName="UserID")]
    PARAM(
        [parameter(ParameterSetName="UserID",Mandatory)]
        [Guid]$UserID,
        [parameter(ParameterSetName="SIPAddress",Mandatory)]
        $SipAddress,
        [alias('UserFilter')]
        [parameter(ParameterSetName="DisplayName",Mandatory)]
        [string]$UserDisplayName,

<<<<<<< HEAD
        [parameter(ParameterSetName="DisplayName")]
        [switch]$FilterByAnalyst=$false,

        [parameter(ParameterSetName="DisplayName")]
        [int]$maxNumberOfResults=5,

        [parameter(ParameterSetName="AllAnalysts")]
        [Switch]$AllAnalysts
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
        IF($PSBoundParameters['SIPAddress'])
        {
            # Build the Query
            $URI = $CiresonPortalURL,"api/V3/User/GetUserRelatedInfoBySIPAddress?sipAddress=$SIPAddress" -join '/'
            
            # Invoke the Query
            (Invoke-RestMethod $URI -Credential $CiresonPortalCred) -as [pscustomobject]
        }
        ELSEIF($PSBoundParameters['UserDisplayName'])
        {
            Write-Verbose -Message $(New-ScriptMessage -Block PROCESS -message 'ParameterSetName = UserDisplayName')
            
            # Build the Query
            $URI = $CiresonPortalURL,"api/V3/User/GetUserList?userFilter=$UserDisplayName&filterByAnalyst=$($FilterByAnalyst.tostring())&groupsOnly=false&maxNumberOfResults=$maxNumberOfResults" -join '/'
            
            # Invoke the Query
            (Invoke-RestMethod $URI -Credential $CiresonPortalCred) -as [pscustomobject]
        }
        ELSEIF($PSBoundParameters['UserID'])
        {
            Write-Verbose -Message $(New-ScriptMessage -Block PROCESS -message 'ParameterSetName = UserID')
            
            # Build the Query
            $URI = $CiresonPortalURL,"api/V3/User/GetUserRelatedInfoByUserId?userId=$UserID" -join '/'
            
            # Invoke the Query 
            (Invoke-RestMethod $URI -Credential $CiresonPortalCred) | ConvertFrom-Json
        }
        ELSEIF($PSBoundParameters['AllAnalysts'])
        {
            Write-Verbose -Message $(New-ScriptMessage -Block PROCESS -message 'ParameterSetName = AllAnalysts')
            
            # Build the Query
            $URI = $CiresonPortalURL, "api/V3/User/GetAnalystResults" -join '/'
            
            # Invoke the Query
	        (Invoke-RestMethod $URI -Credential $CiresonPortalCred) -as [PSCustomObject]
        }
}
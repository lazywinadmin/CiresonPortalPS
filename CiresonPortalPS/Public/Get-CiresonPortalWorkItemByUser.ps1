function Get-CiresonPortalWorkItemItemsByUser
{
  <#
  .SYNOPSIS
    function to retrieve the WorkItem of a User
    
  .DESCRIPTION
    function to retrieve the WorkItem of a User
    
  .PARAMETER UserID
    Specifies the UserID
    
  .EXAMPLE
    Get-CiresonPortalWorkItemItemsByUser -UserID 3994eb2c-0829-5cd9-2000-c2fbb11aaa15
    
    Title                      : Report Expiring Users to Managers
    BaseId                     : 3e35ce66-dca3-7449-04eb-ad5057157b00
    Id                         : SR9240
    TopParentType              : 
    Icon                       : ServiceRequest.svg
    Status                     : Cancelled
    StatusId                   : 674e87e4-a58e-eab0-9a05-b48881de784c
    Priority                   : 9 - Low
    AssignedUser               : Cat, Francois-Xavier
    AffectedUser               : Cat, Francois-Xavier
    CreatedByUser              : Cat, Francois-Xavier
    Category                   : Other
    Tier                       : IT
    LastModified               : 2016-02-10T14:45:22.55
    Created                    : 2015-11-30T18:52:26.07
    ScheduledStartDate         : 
    ScheduledEndDate           : 
    WorkItemType               : System.WorkItem.ServiceRequest
    IsParent                   : False
    ParentWorkItemId           : 
    ParentWorkItemType         : 
    Index                      : 0
    SLOInstance                : 
    SLOStatus                  : 
    NumericId                  : 9240
    LastModifiedAsString       : 2016-02-10T14:45:22.550
    CreatedAsString            : 2015-11-30T18:52:26.070
    ScheduledStartDateAsString : 
    ScheduledEndDateAsString   : 
    
    Title                      : New IT Hardware
    BaseId                     : 2aa822b0-b144-3acf-bee3-9a11714c5de0
    Id                         : RA491
    TopParentType              : 
    Icon                       : ReviewActivity.svg
    Status                     : Cancelled
    StatusId                   : 89465302-2a23-d2b6-6906-74f03d9b7b41
    Priority                   : 
    AssignedUser               : 
    AffectedUser               : 
    CreatedByUser              : 
    Category                   : 
    Tier                       : 
    LastModified               : 2015-09-25T13:23:06.42
    Created                    : 2015-07-30T18:11:10.78
    ScheduledStartDate         : 
    ScheduledEndDate           : 
    WorkItemType               : System.WorkItem.Activity.ReviewActivity
    IsParent                   : False
    ParentWorkItemId           : SR488
    ParentWorkItemType         : ServiceRequest
    Index                      : 0
    SLOInstance                : 
    SLOStatus                  : 
    NumericId                  : 491
    LastModifiedAsString       : 2015-09-25T13:23:06.420
    CreatedAsString            : 2015-07-30T18:11:10.780
    ScheduledStartDateAsString : 
    ScheduledEndDateAsString   : 
    
  .NOTES
    Francois-Xavier	Cat
    lazywinadmin.com
    @lazywinadm
    github.com/lazywinadmin
  
  #>
PARAM(
  [parameter(Mandatory)]
  $UserID,
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
            Write-Error -Message $Error[0]
			Throw "Not Connected to Cireson Portal"
		}
	}
	PROCESS
	{
    # Build the Query
    $URI = $CiresonPortalURL,"api/V3/WorkItem/GetGridWorkItemsByUser?userId=$UserID&isScoped=$($isScoped.tostring().tolower())&showActivities=$($showActivities.tostring().tolower())&showInactiveItems=$($showInactiveItems.tostring().tolower())" -join '/'
    Write-Verbose -Message $(New-ScriptMessage -Block 'PROCESS' -message "Uri = $URI")
    
    # Invoke the Query
    (Invoke-RestMethod $URI -Credential $CiresonPortalCred) -as [pscustomobject]
  }
}
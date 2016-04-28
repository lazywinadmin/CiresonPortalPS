# CiresonPortalPS
This PowerShell module allows you to interact with the Cireson Portal API. 

You can retrive information from SCSM without the need to have the Smlets module or the Cireson Portal 

Official documentation: https://support.cireson.com/Help#overview

## Installation
#### Download from PowerShell Gallery
Coming soon...
#### Download from GitHub repository

* Download the repository
* Unblock the zip file
* Extract the module folder 'CiresonPortalPS' to a module path (e.g. $home\Documents\WindowsPowerShell\Modules)

## Usage

#### Loading the module and retrieving the functions available
```powershell
# Import the module.
Import-Module -Name CiresonPortalPS

# Get the commands available
Get-Command -Module CiresonPortalPS
```

#### Setting your connection to the Cireson Portal API
```powershell
# Set your Credential in a Variable
$Credential = Get-Credential

# Configure the connection
Set-CiresonPortalPSConfiguration -Credential $Credential -URL 'http://ciresonportal'
```
![alt tag](/Media/Set-CiresonPortalPSConfiguration.png "Set-CiresonPortalPSConfiguration")

#### Retrieving user with a specific string

```powershell
# Retrieve User with a displayname containing "fxtest"
Get-CiresonPortalUser -UserDisplayName 'fxtest'
```
![alt tag](/Media/Get-CiresonPortalUser.png "Get-CiresonPortalUser")


#### Retrieving an Enumaration class

```powershell
# Retrieve the Activity Stage enum
Get-CiresonPortalEnum -ClassID 'f05ea0f0-bd02-143e-2b74-303609750328'
```
![alt tag](/Media/Get-CiresonPortalEnum.png "Get-CiresonPortalEnum")


#### Retrieve all the Article (Knowledge Base Articles)

```powershell
Get-CiresonPortalArticle
```
![alt tag](/Media/Get-CiresonPortalArticle_All.png "Get-CiresonPortalArticle")

# Helper function
function Resolve-Module
{
<#
.SYNOPSIS
    Function to verify that you are using the last version of the modules used in this script
.DESCRIPTION
    Function to verify that you are using the last version of the modules used in this script
    It is getting the module from the local machine (if present) and compare with the one on the Gallery,
    and download/install the last version if needed
.NOTES
    Copied from PSDeploy Project
        https://raw.githubusercontent.com/RamblingCookieMonster/PSDeploy/master/build.ps1
#>
    [Cmdletbinding()]
    param
    (
        [Parameter(Mandatory)]
        [string[]]$Name
    )
    Process
    {
        foreach ($ModuleName in $Name)
        {
            $Module = Get-Module -Name $ModuleName -ListAvailable
            Write-Verbose -Message "Resolving Module $($ModuleName)"

            if ($Module)
            {
                $Version = $Module | Measure-Object -Property Version -Maximum | Select-Object -ExpandProperty Maximum
                $GalleryVersion = Find-Module -Name $ModuleName -Repository PSGallery | Measure-Object -Property Version -Maximum | Select-Object -ExpandProperty Maximum

                if ($Version -lt $GalleryVersion)
                {
                    if ((Get-PSRepository -Name PSGallery).InstallationPolicy -ne 'Trusted') { Set-PSRepository -Name PSGallery -InstallationPolicy Trusted }

                    Write-Verbose -Message "$($ModuleName) Installed Version [$($Version.tostring())] is outdated. Installing Gallery Version [$($GalleryVersion.tostring())]"
                    Install-Module -Name $ModuleName -Force
                    Import-Module -Name $ModuleName -Force -RequiredVersion $GalleryVersion
                }
                else
                {
                    Write-Verbose -Message "Module Installed, Importing $($ModuleName)"
                    Import-Module -Name $ModuleName -Force -RequiredVersion $Version
                }
            }
            else
            {
                Write-Verbose -Message "$($ModuleName) Missing, installing Module"
                Install-Module -Name $ModuleName -Force
                Import-Module -Name $ModuleName -Force -RequiredVersion $Version
            }
        }
    }
}

#---------------------------------# 
# Header                          # 
#---------------------------------# 
Write-Host 'Running AppVeyor build script' -ForegroundColor Yellow
Write-Host "Repository    : $env:APPVEYOR_REPO_NAME"
Write-Host "ModuleName    : $env:ModuleName"
Write-Host "Provider      : $env:APPVEYOR_REPO_PROVIDER"
Write-Host "Branch        : $env:APPVEYOR_REPO_BRANCH"
Write-Host "" 
Write-Host "# BUILD #"
Write-Host " ID      : $env:APPVEYOR_BUILD_ID"
Write-Host " Number  : $env:APPVEYOR_BUILD_NUMBER"
Write-Host " Version : $env:APPVEYOR_BUILD_VERSION"
Write-Host " Folder  : $env:APPVEYOR_BUILD_FOLDER"
Write-Host ""
Write-Host "# COMMIT #"
Write-Host " ID (SHA)      : $env:APPVEYOR_REPO_COMMIT"
Write-Host " Author        : $env:APPVEYOR_REPO_COMMIT_AUTHOR"
Write-Host " Author Email  : $env:APPVEYOR_REPO_COMMIT_AUTHOR_EMAIL"
Write-Host " Date/Time     : $env:APPVEYOR_REPO_COMMIT_TIMESTAMP"
Write-Host " Message       : $env:APPVEYOR_REPO_COMMIT_MESSAGE"
Write-Host " Additional msg: $env:APPVEYOR_REPO_COMMIT_MESSAGE_EXTENDED"

#---------------------------------# 
# BuildScript                     # 
#---------------------------------#
Write-Verbose -Message "Loading Nuget Package Provider"
# Grab nuget bits, install modules, set build variables, start build.
Get-PackageProvider -Name NuGet -ForceBootstrap | Out-Null

Write-Verbose -Message "Verify if we have the last version of Psake,PSDeploy, Pester, BuildHelpers"
Resolve-Module Psake, PSDeploy, Pester, BuildHelpers

# PSDeploy - Set the Build variables
Set-BuildEnvironment

# Invoke the PSake tasks
Invoke-psake .\psake.ps1
exit ( [int]( -not $psake.build_success ) )

<#
Write-host "Get BuildVariables" -ForegroundColor Yellow
Get-BuildVariables 

Write-host "Get-ProjectName" -ForegroundColor Yellow
Get-ProjectName
#>
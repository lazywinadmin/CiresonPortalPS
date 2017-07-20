#
# Module manifest for module 'CiresonPortalPS'
#
# Generated by: Francois-Xavier Cat
#
# Generated on: 2016-04-12
#

@{

# Script module or binary module file associated with this manifest.
RootModule = 'CiresonPortalPS.psm1'

# Version number of this module.
ModuleVersion = '1.0.0.2'

# ID used to uniquely identify this module
GUID = 'c05a29ef-b95f-4d9a-8b30-b07bc3158131'

# Author of this module
Author = 'Francois-Xavier Cat'

# Company or vendor of this module
CompanyName = 'Lazywinadmin.com'

# Copyright statement for this module
Copyright = '(c) 2016 Francois-Xavier Cat. All rights reserved. Licensed under The MIT License (MIT)'

# Description of the functionality provided by this module
Description = 'CiresonPortalPS is a module to interact with the Cireson Portal API'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '3.0'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module
FunctionsToExport = @('Get-CiresonPortalArticle','Get-CiresonPortalConfigurationItem','Get-CiresonPortalEnum','Get-CiresonPortalPSConfiguration','Get-CiresonPortalRequestOffering','Get-CiresonPortalRequestOfferingDetails','Get-CiresonPortalRequestOfferingTop','Get-CiresonPortalServiceCatalog','Get-CiresonPortalTemplate','Get-CiresonPortalUserAnalyst','Get-CiresonPortalUserGroup','Get-CiresonPortalUserPermission','Get-CiresonPortalUserPreference','Get-CiresonPortalUserRequest','Get-CiresonPortalUserSupportGroup','Get-CiresonPortalUserSupportGroupMember','Get-CiresonPortalUserTierQueue','Get-CiresonPortalWorkItem','Get-CiresonPortalWorkItemByUserGroup','Get-CiresonPortalWorkItemClosedByUser','Search-CiresonPortalServiceCatalog','Set-CiresonPortalPSConfiguration','Set-CiresonPortalRequestOfferingAsFavorite','Test-CiresonPortalUserIsAuthorized','Update-CiresonPortalProjection','Get-CiresonPortalProjection','Get-CiresonPortalEnumDisplayName','Get-CiresonPortalUser')

# Cmdlets to export from this module
# CmdletsToExport = '*'

# Variables to export from this module
# VariablesToExport = '*'

# Aliases to export from this module
# AliasesToExport = '*'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'Cireson', 'CiresonPortal'

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/lazywinadmin/CiresonPortalPS/blob/master/LICENSE.md'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/lazywinadmin/CiresonPortalPS/'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        # ReleaseNotes = ''

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}






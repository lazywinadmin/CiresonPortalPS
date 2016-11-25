<#  Assuming the root of the repository looks like this
		/ModuleName/
		/ModuleName/ModuleName.psd1
		/ModuleName/ModuleName.psm1
		/Tests/
		/Tests/MyTest.Tests.ps1
#>

# CONFIGURATION

# My Notes (order is important)




# Get the Module Name
$ModuleName = ((Split-path (Split-Path ($MyInvocation.MyCommand.Path) -Parent)) -split '\\')[-1]

# Remove module if loaded
Remove-Module -Name $ModuleName -ErrorAction SilentlyContinue

# Get the Module PSD1 Path
$ModulePath = "$(Split-path (Split-Path $MyInvocation.MyCommand.Path) -Parent)\$ModuleName\$ModuleName.psd1"

# PESTER TEST
Describe $ModuleName -Tags "Module" {

	# Import Module
	Import-Module $ModulePath
	
	$FunctionsList = (get-command -Module $ModuleName | Where-Object -FilterScript { $_.CommandType -eq 'Function' }).Name
	
	FOREACH ($Function in $FunctionsList)
	{
		# Retrieve the Help of the function
		$Help = Get-Help -Name $Function -Full
		
		$Notes = ($Help.alertSet.alert.text -split '\n')
		
		# Parse the function using AST
		$AST = [System.Management.Automation.Language.Parser]::ParseInput((Get-Content function:$Function), [ref]$null, [ref]$null)
		
		Context "$Function - Help"{
			It "Synopsis"{ $help.Synopsis | Should not BeNullOrEmpty }
			It "Description"{ $help.Description | Should not BeNullOrEmpty }
			It "Notes - Author" { $Notes[0].trim() | Should Be "Francois-Xavier Cat" }
			It "Notes - Site" { $Notes[1].trim() | Should Be "Lazywinadmin.com" }
			It "Notes - Twitter" { $Notes[2].trim() | Should Be "@lazywinadm" }
			It "Notes - Github" { $Notes[3].trim() | Should Be "github.com/lazywinadmin" }
			
			# Get the parameters declared in the Comment Based Help
			$RiskMitigationParameters = 'Whatif', 'Confirm'
			$HelpParameters = $help.parameters.parameter | Where-Object name -NotIn $RiskMitigationParameters
			
			# Get the parameters declared in the AST PARAM() Block
			$ASTParameters = $ast.ParamBlock.Parameters.Name.variablepath.userpath
			
			$FunctionsList = (get-command -Module $ModuleName | Where-Object -FilterScript { $_.CommandType -eq 'Function' }).Name



			It "Parameter - Compare Count Help/AST" {
				$HelpParameters.name.count -eq $ASTParameters.count | Should Be $true
			}
			
			# Parameter Description
			If (-not [String]::IsNullOrEmpty($ASTParameters)) # IF ASTParameters are found
			{
				$HelpParameters | ForEach-Object {
					It "Parameter $($_.Name) - Should contains description"{
						$_.description | Should not BeNullOrEmpty
					}
				}
				
			}
			
			# Examples
			it "Example - Count should be greater than 0"{
				$Help.examples.example.code.count | Should BeGreaterthan 0
			}
			
			# Examples - Remarks (small description that comes with the example)
			foreach ($Example in $Help.examples.example)
			{
				it "Example - Remarks on $($Example.Title)"{
					$Example.remarks | Should not BeNullOrEmpty
				}
			}
		}
	}
}

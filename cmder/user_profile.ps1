# Use this file to run your own startup commands
# Init

$ErrorActionPreference = 'SilentlyContinue'

## Prompt Customization
<#
.SYNTAX
    <PrePrompt><CMDER DEFAULT>
    λ <PostPrompt> <repl input>
.EXAMPLE
    <PrePrompt>N:\Documents\src\cmder [master]
    λ <PostPrompt> |
#>

[ScriptBlock]$PrePrompt = {

}

# Replace the cmder prompt entirely with this.
# [ScriptBlock]$CmderPrompt = {}

[ScriptBlock]$PostPrompt = {
}

## <Continue to add your own>

# # Delete default powershell aliases that conflict with bash commands
# if (get-command git) {
#     del -force alias:cat
#     del -force alias:clear
#     del -force alias:cp
#     del -force alias:diff
#     del -force alias:echo
#     del -force alias:kill
#     del -force alias:ls
#     del -force alias:mv
#     del -force alias:ps
#     del -force alias:pwd
#     del -force alias:rm
#     del -force alias:sleep
#     del -force alias:tee
# }

# Autorun commands

if (Get-Module "PSReadLine" ) { . ".\psreadline_profile.ps1" }
if (Get-Command "winfetch.ps1" ) { winfetch.ps1 }

# Set new aliases

if (Get-Command "wget.exe") { Remove-Item -Force Alias:wget }
if (Get-Command "nvim.exe") {
	Remove-Item -Force Alias:nv
	New-Alias -Name nv -Value nvim.exe
}


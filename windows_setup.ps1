<#
 __       __  __                  __                                           ______               __
|  \  _  |  \|  \                |  \                                         /      \             |  \
| $$ / \ | $$ \$$ _______    ____| $$  ______   __   __   __   _______       |  $$$$$$\  ______   _| $$_    __    __   ______
| $$/  $\| $$|  \|       \  /      $$ /      \ |  \ |  \ |  \ /       \      | $$___\$$ /      \ |   $$ \  |  \  |  \ /      \
| $$  $$$\ $$| $$| $$$$$$$\|  $$$$$$$|  $$$$$$\| $$ | $$ | $$|  $$$$$$$       \$$    \ |  $$$$$$\ \$$$$$$  | $$  | $$|  $$$$$$\
| $$ $$\$$\$$| $$| $$  | $$| $$  | $$| $$  | $$| $$ | $$ | $$ \$$    \        _\$$$$$$\| $$    $$  | $$ __ | $$  | $$| $$  | $$
| $$$$  \$$$$| $$| $$  | $$| $$__| $$| $$__/ $$| $$_/ $$_/ $$ _\$$$$$$\      |  \__| $$| $$$$$$$$  | $$|  \| $$__/ $$| $$__/ $$
| $$$    \$$$| $$| $$  | $$ \$$    $$ \$$    $$ \$$   $$   $$|       $$       \$$    $$ \$$     \   \$$  $$ \$$    $$| $$    $$
 \$$      \$$ \$$ \$$   \$$  \$$$$$$$  \$$$$$$   \$$$$$\$$$$  \$$$$$$$         \$$$$$$   \$$$$$$$    \$$$$   \$$$$$$ | $$$$$$$
                                                                                                                     | $$
                                                                                                                     | $$
                                                                                                                      \$$
Author:	   b3nn3tt@hbcomputersecurity.co.uk
Version:   1.0
Git: 	   https://github.com/InfoSec-Research/

This script is used to set up a fresh Windows 10 installation.
#>

########## ADMINISTRATOR CHECK ##########

#This script needs to be run as an Administrator in order to function properly. If the script is executed as a standard user, a privilege escalation via UAC will be launched.
If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
    Write-Host "You didn't run this script as an Administrator. Spawning an Administrator shell in..."
    Write-Host "3"
    Start-Sleep 1
    Write-Host "2"
    Start-Sleep 1
    Write-Host "1"
    Start-Sleep 1
    Start-Process powershell.exe -ArgumentList ("-NoProfile -NoExit -WindowStyle Maximized -ExecutionPolicy Bypass -c cd '$pwd';.\windows_setup.ps1 " -f $PSCommandPath) -Verb RunAs
    Exit
}

########## SCRIPT IMPORTS AND ROOT ##########

#Set the root for all script calls
$tool_root = (get-location).path

#Import (dot-source) all sub-scripts
$scripts = (Get-ChildItem $tool_root\scripts\).name

foreach ($script in $scripts) {
    . .\scripts\$script
}

########## START WITH A CLEAR SCREEN ##########
Clear-Host

########## FUNCTION CALLS ##########

#Tool Banner
Get-Banner

#Main Menu
Menu

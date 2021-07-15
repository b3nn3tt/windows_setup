Function Sub_Menu
{
    Clear-Host
    Do
    {
        Write-Host '==================================='
        Write-Host "    Application Management Menu   " -ForegroundColor Green
        Write-Host '==================================='
        Write-Host "`r`nSelect one of the following options" -ForegroundColor Yellow
        Write-Host "-----------------------------------"
        Write-Host ''
        Write-Host -Object '1.  Install Applications '
        Write-Host ''
        Write-Host -Object '2.  Edit Application List '
        Write-Host ''
        Write-Host -Object '3.  Return to the Main Menu '
        Write-Host ''

        Write-Host -Object $errout
        $Menu = Read-Host -Prompt "Enter 1-3"

        switch ($Menu)
        {
           1
            {
                Clear-Host
                Write-Host "The following applications will now be installed:`r`n"
                Get-Content $PSScriptRoot\..\resources\packages\packages.txt
                Read-Host -Prompt "`r`nPress ENTER to begin the installation"
                Install_Apps
                Read-Host -Prompt "`r`n[*]Application installation complete. Press ENTER to continue or CTRL+C to quit"
                Clear-Host
            }
            2
            {
                Clear-Host
                Write-Host "[+]Opening Applicaiton List"
                notepad.exe $PSScriptRoot\..\resources\packages\packages.txt
                Clear-Host
            }
            3
            {
                Clear-Host
                Menu
            }
            default
            {
                Clear-Host
                $errout = 'Invalid option - please try again: Try 1-3'
            }

        }
    }
    until ($Menu -eq 'q')
}

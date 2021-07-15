Function Menu
{
    Do
    {
        Write-Host '==================================='
        Write-Host "             Main Menu          " -ForegroundColor Green
        Write-Host '==================================='
        Write-Host "`r`nSelect one of the following options" -ForegroundColor Yellow
        Write-Host "-----------------------------------"
        Write-Host ''
        Write-Host -Object '1.  De-Bloat Windows '
        Write-Host ''
        Write-Host -Object '2.  Disable Cortana '
        Write-Host ''
        Write-Host -Object '3.  Disable Services '
        Write-Host ''
        Write-Host -Object '4.  Manage Applications '
        Write-Host ''
        Write-Host -Object 'Q.  Quit'
        Write-Host -Object $errout
        $Menu = Read-Host -Prompt "Enter 1-4, or Q to Quit"

        switch ($Menu)
        {
           1
            {
                Clear-Host
                Write-Host "[-]Removing unwanted default applications from Windows"
                debloat
                debloat
                Read-Host -Prompt "`r`n[*]All unwanted default applications have been removed. Press ENTER to continue or CTRL+C to quit"
                Clear-Host
            }
            2
            {
                Clear-Host
                Write-Host "[-]Disabling Cortana"
                disable_cortana
                Read-Host -Prompt "`r`n[*]Cortana has been disabled. Press ENTER to continue or CTRL+C to quit"
                Clear-Host
            }
            3
            {
                Clear-Host
                Write-Host "[-]Disabling unwanted services within Windows"
                disable_services
                Read-Host -Prompt "`r`n[*]All unwanted services have been disabled. Note that some services will continue to run until you reboot. Press ENTER to continue or CTRL+C to quit"
                Clear-Host
            }
            4
            {
                Sub_Menu
            }
            Q
            {
                Clear-Host
                Exit
            }
            default
            {
                Clear-Host
                $errout = 'Invalid option - please try again: Try 1-3, or Q only'
            }

        }
    }
    until ($Menu -eq 'q')
}

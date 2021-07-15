function Install_Apps {
  $Packages = Get-Content $PSScriptRoot\..\resources\packages\packages.txt

    If(Test-Path -Path "$env:ProgramData\Chocolatey") {
    ForEach ($PackageName in $Packages)
      {
          $IsInstalled = choco find --local-only $PackageName -r

          if ($IsInstalled) {
              Write-Host "$PackageName is already installed. Searching for update..."
              choco upgrade $PackageName -y
          } Else {
              choco install $PackageName -y
          }
      }
  }
  Else {
    # Install Chocolatey
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

    # Now Chololatey is installed, we can install packages from installation text file
    ForEach ($PackageName in $Packages)
      {
          choco install $PackageName -y
      }
  }
}



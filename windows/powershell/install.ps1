Install-Module -Name PowerShellGet -Force
Install-Module -Name PSReadLine -Force
Install-Module -Name cd-extras -Force
Install-Module -Name Terminal-Icons -Repository PSGallery -Force
Install-Module -Name PSFzf -Force

winget install fzf
winget install starship

New-Item -Type dir ~\Documents\WindowsPowerShell
Copy-Item .\profile.ps1 ~\Documents\WindowsPowerShell

New-Item -Type dir ~\.config
Copy-Item ..\..\starship.toml ~\.config

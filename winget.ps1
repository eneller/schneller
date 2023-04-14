# inspired by https://github.com/Kugane/winget/blob/main/winget-basic.ps1
# use https://github.com/ChrisTitusTech/winutil for further tweaks


#############################################################################################
################################ Don't change anything below ################################
#############################################################################################

### Install WinGet ###
# Based on this gist: https://gist.github.com/crutkas/6c2096eae387e544bd05cde246f23901
$hasPackageManager = Get-AppxPackage -Name 'Microsoft.Winget.Source' | Select Name, Version
$hasVCLibs = Get-AppxPackage -Name 'Microsoft.VCLibs.140.00.UWPDesktop' | Select Name, Version
$hasXAML = Get-AppxPackage -Name 'Microsoft.UI.Xaml.2.7*' | Select Name, Version
$hasAppInstaller = Get-AppxPackage -Name 'Microsoft.DesktopAppInstaller' | Select Name, Version
$DesktopPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop)
$errorlog = "winget_error.log"


function install_winget {
    Clear-Host
    Write-Host -ForegroundColor Yellow "Checking if WinGet is installed"
    if (!$hasPackageManager) {
            if ($hasVCLibs.Version -lt "14.0.30035.0") {
                Write-Host -ForegroundColor Yellow "Installing VCLibs dependencies..."
                Add-AppxPackage -Path "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx"
                Write-Host -ForegroundColor Green "VCLibs dependencies successfully installed."
            }
            else {
                Write-Host -ForegroundColor Green "VCLibs is already installed. Skip..."
            }
            if ($hasXAML.Version -lt "7.2203.17001.0") {
                Write-Host -ForegroundColor Yellow "Installing XAML dependencies..."
                Add-AppxPackage -Path "https://github.com/Kugane/winget/raw/main/Microsoft.UI.Xaml.2.7_7.2203.17001.0_x64__8wekyb3d8bbwe.Appx"
                Write-Host -ForegroundColor Green "XAML dependencies successfully installed."
            }
            else {
                Write-Host -ForegroundColor Green "XAML is already installed. Skip..."
            }
            if ($hasAppInstaller.Version -lt "1.16.12653.0") {
                Write-Host -ForegroundColor Yellow "Installing WinGet..."
    	        $releases_url = "https://api.github.com/repos/microsoft/winget-cli/releases/latest"
    		    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    		    $releases = Invoke-RestMethod -Uri "$($releases_url)"
    		    $latestRelease = $releases.assets | Where-Object { $_.browser_download_url.EndsWith("msixbundle") } | Select-Object -First 1
    		    Add-AppxPackage -Path $latestRelease.browser_download_url
                Write-Host -ForegroundColor Green "WinGet successfully installed."
            }
        # Fix for hangup on first start
        winget search clamav --accept-source-agreements
    }
    else {
        Write-Host -ForegroundColor Green "WinGet is already installed. Skip..."
        # Fix for hangup on first start
        winget search clamav --accept-source-agreements
        }
    Pause
    Clear-Host
}

### Install Apps with GUI ###
# Based on this gist: https://gist.github.com/Codebytes/29bf18015f6e93fca9421df73c6e512c
function install_gui {
    Write-Host -ForegroundColor Cyan "Installing new Apps wit GUI"
    Foreach ($gui in $graphical) {
        $listGUI = winget list --exact -q $gui.name
        if (![String]::Join("", $listGUI).Contains($gui.name)) {
            Write-Host -ForegroundColor Yellow "Install:" $gui.name
            if ($gui.source -ne $null) {
                winget install --exact --interactive --accept-package-agreements --accept-source-agreements $gui.name --source $gui.source
                if ($LASTEXITCODE -eq 0) {
                    Write-Host -ForegroundColor Green $gui.name "successfully installed."
                }
                else {
                    $gui.name + " couldn't be installed." | Add-Content "$DesktopPath\$errorlog"
                    Write-Host
                    Write-Host -ForegroundColor Red $gui.name "couldn't be installed."
                    Write-Host -ForegroundColor Yellow "Write in $DesktopPath\$errorlog"
                    Write-Host
                    Pause
                }
            }
            else {
                winget install --exact --interactive --accept-package-agreements --accept-source-agreements $gui.name
                if ($LASTEXITCODE -eq 0) {
                    Write-Host -ForegroundColor Green $gui.name "successfully installed."
                }
                else {
                    $gui.name + " couldn't be installed." | Add-Content "$DesktopPath\$errorlog"
                    Write-Host
                    Write-Host -ForegroundColor Red $gui.name "couldn't be installed."
                    Write-Host -ForegroundColor Yellow "Write in $DesktopPath\$errorlog"
                    Write-Host
                    Pause
                }            
            }
        }
        else {
            Write-Host -ForegroundColor Yellow "Skip installation of" $gui.name
        }
    }
    Pause
    Clear-Host
}

### Install Apps silent ###
function install_silent {
    Write-Host -ForegroundColor Cyan "Installing new Apps"
    Foreach ($app in $apps) {
        $listApp = winget list --exact -q $app.name
        if (![String]::Join("", $listApp).Contains($app.name)) {
            Write-Host -ForegroundColor Yellow  "Install:" $app.name
            # MS Store apps
            if ($app.source -ne $null) {
                winget install --exact --silent --accept-package-agreements --accept-source-agreements $app.name --source $app.source
                if ($LASTEXITCODE -eq 0) {
                    Write-Host -ForegroundColor Green $app.name "successfully installed."
                }
                else {
                    $app.name + " couldn't be installed." | Add-Content "$DesktopPath\$errorlog"
                    Write-Host
                    Write-Host -ForegroundColor Red $app.name "couldn't be installed."
                    Write-Host -ForegroundColor Yellow "Write in $DesktopPath\$errorlog"
                    Write-Host
                    Pause
                }    
            }
            # All other Apps
            else {
                winget install --exact --silent --scope machine --accept-package-agreements --accept-source-agreements $app.name
                if ($LASTEXITCODE -eq 0) {
                    Write-Host -ForegroundColor Green $app.name "successfully installed."
                }
                else {
                    $app.name + " couldn't be installed." | Add-Content "$DesktopPath\$errorlog"
                    Write-Host
                    Write-Host -ForegroundColor Red $app.name "couldn't be installed."
                    Write-Host -ForegroundColor Yellow "Write in $DesktopPath\$errorlog"
                    Write-Host
                    Pause
                }  
            }
        }
        else {
            Write-Host -ForegroundColor Yellow "Skip installation of" $app.name
        }
    }
    Pause
    Clear-Host
}

### Debloating ###
# Based on this gist: https://github.com/W4RH4WK/Debloat-Windows-10/blob/master/scripts/remove-default-apps.ps1
function debloating {
    Write-Host -ForegroundColor Cyan "Remove bloatware"
    Foreach ($blt in $bloatware) {
        Write-Host -ForegroundColor Red "Removing:" $blt
        Get-AppxPackage -AllUsers $blt | Remove-AppxPackage
    }
    Pause
    Clear-Host
}

### Register Taskjob ###
function taskjob {
    $taskname = 'WinGet AutoUpgrade & Cleanup'
    Write-Host -ForegroundColor Yellow "Checking for Taskjob..."
    if ($(Get-ScheduledTask -TaskName $taskname -ErrorAction SilentlyContinue).TaskName -eq $taskname) {
        Unregister-ScheduledTask -TaskName $taskname -Confirm:$False
        Write-Host -ForegroundColor Yellow "Taskjob already exists. Update to newer version..."
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        Invoke-WebRequest -Uri https://github.com/Kugane/winget/raw/main/WinGet%20AutoUpgrade%20%26%20Cleanup.xml -OutFile '$taskjob' 
        Register-ScheduledTask -xml (Get-Content '$taskjob' | Out-String) -TaskName $taskname
        Write-Host -ForegroundColor Green "Taskjob successfully updated."
    }
    else {
        Write-Host -ForegroundColor Yellow "Installing taskjob..."
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        Invoke-WebRequest -Uri https://github.com/Kugane/winget/raw/main/WinGet%20AutoUpgrade%20%26%20Cleanup.xml -OutFile '$taskjob' 
        Register-ScheduledTask -xml (Get-Content '$taskjob' | Out-String) -TaskName $taskname
        Write-Host -ForegroundColor Green "Taskjob successfully installed."
    }
    Pause
    Clear-Host
}

### Get List of installed Apps ###
function get_list {
    $timestamp = get-date -Format dd_MM_yyyy
    $newPath = "$DesktopPath\" + "winget_"+ $env:computername + "_$timestamp" + ".txt"
    Write-Host -ForegroundColor Yellow "Generating Applist..."
    winget list > $newPath
    Write-Host -ForegroundColor Magenta "List saved on $newPath"
    Pause
}

### Finished ###
function finish {
    Write-Host
    Write-Host -ForegroundColor Magenta  "Installation finished"
    Write-Host
    Pause
}

### Question what to do ###
function menu {
    [string]$Title = 'Winget Menu'
    Clear-Host
    Write-Host "================ $Title ================"
    Write-Host
    Write-Host "1: Do all steps below"
    Write-Host
    Write-Host "2: Just install winget"
    Write-Host
    Write-Host "3: Install Apps under graphical"
    Write-Host "4: Install Apps under apps"
    Write-Host "5: Remove bloatware"
    Write-Host
    Write-Host "6: Install Taskjob for automatic updates"
    Write-Host "7: Get List of all installed Apps"
    Write-Host
    Write-Host -ForegroundColor Magenta "0: Quit"
    Write-Host
    
    $actions = "0"
    while ($actions -notin "0..7") {
    $actions = Read-Host -Prompt 'What do you want to do?'
        if ($actions -in 0..7) {
            if ($actions -eq 0) {
                exit
            }
            if ($actions -eq 1) {
                install_winget
                install_gui
                install_silent
                debloating
                taskjob
                finish
            }
            if ($actions -eq 2) {
                install_winget
                finish
            }
            if ($actions -eq 3) {
                install_winget
                install_gui
                finish
            }
            if ($actions -eq 4) {
                install_winget
                install_silent
                finish
            }
            if ($actions -eq 5) {
                debloating
                finish
            }
            if ($actions -eq 6) {
                taskjob
                finish
            }
            if ($actions -eq 7) {
                install_winget
                get_list
            }
            menu
        }
        else {
            menu
        }
    }
}
menu


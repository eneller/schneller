# inspired by https://github.com/Kugane/winget/blob/main/winget-basic.ps1
# use https://github.com/ChrisTitusTech/winutil for further tweaks
# needs Set-ExecutionPolicy RemoteSigned to allow execution

# Based on this gist: https://gist.github.com/Codebytes/29bf18015f6e93fca9421df73c6e512c


function winget_iterate {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]
        $winget_command,
        [Parameter(Mandatory=$true)]
        [HashTable[]]
        $app_list
    )



    Write-Host -ForegroundColor Cyan "Installing new Apps"
    echo $list
    Foreach ($app in $app_list){
        $listApp = winget list --exact -q $app.name
        if ([String]::Join("", $listApp).Contains($app.name)) {
            Write-Host -ForegroundColor Yellow  "Installing:" $app.name

            # MS Store apps or other apps that need a specific source
            if ($app.source -ne $null) {
                '$winget_command $app.name --source $app.source'
                if ($LASTEXITCODE -eq 0) {
                    Write-Host -ForegroundColor Green $app.name "successfully installed."
                }
                else {
                    $app.name | Add-Content "$desktoppath\$errorlog"
                    Write-Host -ForegroundColor Red $app.name "couldn't be installed."
                    # Pause
                }    
            }

            # All other Apps
            else {
                winget install --exact --silent --scope machine --accept-package-agreements --accept-source-agreements $app.name
                if ($LASTEXITCODE -eq 0) {
                    Write-Host -ForegroundColor Green $app.name "successfully installed."
                }
                else {
                    $app.name | Add-Content "$desktoppath\$errorlog"
                    Write-Host -ForegroundColor Red $app.name "couldn't be installed."
                    # Pause
                }  
            }
        }
        else {
            Write-Host -ForegroundColor Yellow "Skipped installation of" $app.name "- No match found"
        }
    }
    Write-Host -ForegroundColor Yellow "Error log written to $desktoppath\$errorlog"

    # Pause
    # Clear-Host
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


$winget_install_command = "winget install --exact --scope machine --accept-package-agreements --accept-source-agreements"
# TODO use --silent for silent install and --interactive for gui install
$desktoppath = [Environment]::GetFolderPath("Desktop")
$errorlog = "errors.txt"
# winget_iterate -winget_command $winget_install_command -app_list $apps


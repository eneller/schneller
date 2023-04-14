# schneller-setup:windows
Uses WinGet in a powershell script to install my most-frequently used programs.
Executing powershell scripts requires  `Set-ExecutionPolicy RemoteSigned` enabled to allow execution.

## Usage
1. Source both files
```powershell
. .\winget.ps1
. .\package_lists.ps1
```
2. Run script. The $winget_install_command is provided within the script file.
Different app lists can be found inside the [package_list](https://github.com/eneller/schneller-setup/blob/windows/package_lists.ps1)
```powershell
winget_iterate -winget_command $winget_install_command -app_list $apps_all
```
3. (Optional) use https://github.com/ChrisTitusTech/winutil for further tweaks
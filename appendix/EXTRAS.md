# Random Things

Run the following commands in Administrative Powershell

To get a list of classic apps (name, version, publisher, date):
```powershell
Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Format-Table -AutoSize > C:\InstalledPrograms.txt
```

To get a list of Microsoft Store (UWP) apps:
```powershell
Get-AppxPackage | Select Name, PackageFullName | Format-Table -AutoSize > C:\InstalledStoreApps.txt
```

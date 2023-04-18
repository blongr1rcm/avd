$fileexists = Test-Path -Path 'c:\windows\tmp\fslogix.txt'
 If ($fileexists ) {
    Exit
}
New-Item -Path "$env:TEMP\FSLogix" -ItemType Directory -ErrorAction SilentlyContinue
Invoke-WebRequest -Uri https://aka.ms/fslogix_download -OutFile "$env:TEMP\FSLogix\fslogix.zip"
Expand-Archive "$env:TEMP\FSLogix\fslogix.zip" -DestinationPath "$env:TEMP\FSLogix" -Force
Start-Process -FilePath "$env:TEMP\FSLogix\x64\Release\FSLogixAppsSetup.exe" -ArgumentList "/install /quiet" -Wait -Passthru
New-Item -Path "c:\windows\tmp" -ItemType Directory -ErrorAction SilentlyContinue
New-Item -Path 'c:\windows\tmp\fslogix.txt' -ItemType File -ErrorAction SilentlyContinue


$path = "HKLM:\Software\Policies\Microsoft\AzureADAccount"
$name = "LoadCredKeyFromProfile"
$type = "DWord"
$value = 1
$path1 = "HKLM:\SOFTWARE\FSLogix\Profiles"
$name1 = "Enabled"
$type1 = "DWord"
$value1 = 1
$name2 = "VHDLocations"
$type2 = "String"
$value2 = "\\stavdmgmteus201.file.core.windows.net\profiles"
$name3 = "VolumeType"
$type3 = "String"
$value3 = "VHDX"
$name3 = "DeleteLocalProfileWhenVHDShouldApply"
$type3 = "DWord"
$value3 = 1

New-ItemProperty -Path $path -Name $name -PropertyType $type -Value $value
New-ItemProperty -Path $path1 -Name $name1 -PropertyType $type1 -Value $value1
New-ItemProperty -Path $path2 -Name $name2 -PropertyType $type2 -Value $value2
New-ItemProperty -Path $path3 -Name $name3 -PropertyType $type3 -Value $value3

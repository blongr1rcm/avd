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


$path = "HKLM:\SOFTWARE\Policies\Microsoft\AzureADAccount"
$path1 = "HKLM:\SOFTWARE\FSLogix\Profiles"
$path2 = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\Kerberos\Parameters"

$name = "LoadCredKeyFromProfile"
$type = "DWord"
$value = 1

$name1 = "Enabled"
$type1 = "DWord"
$value1 = 1

$name2 = "CCDLocations"
$type2 = "String"
$value2 = "type=smb,connectionString=\\stmgmtsbeus201.file.core.windows.net\profiles;type=smb,connectionString=\\stmgmtsbcus01.file.core.windows.net\profiles"

$name3 = "VolumeType"
$type3 = "String"
$value3 = "VHDX"

$name4 = "DeleteLocalProfileWhenVHDShouldApply"
$type4 = "DWord"
$value4 = 1

$name5 = "ClearCacheOnLogoff"
$type5 = "DWord"
$value5 = 1

$name6 = "HealthyProvidersRequiredForRegister"
$type6 = "DWord"
$value6 = 1

$name7 = "CloudKerberosTicketRetrievalEnabled"
$type7 = "DWord"
$value7 = 1

New-Item -Path $path
New-ItemProperty -Path $path -Name $name -PropertyType $type -Value $value
New-ItemProperty -Path $path1 -Name $name1 -PropertyType $type1 -Value $value1
New-ItemProperty -Path $path1 -Name $name2 -PropertyType $type2 -Value $value2
New-ItemProperty -Path $path1 -Name $name3 -PropertyType $type3 -Value $value3
New-ItemProperty -Path $path1 -Name $name4 -PropertyType $type4 -Value $value4
New-ItemProperty -Path $path1 -Name $name5 -PropertyType $type5 -Value $value5
New-ItemProperty -Path $path1 -Name $name6 -PropertyType $type6 -Value $value6
New-ItemProperty -Path $path2 -Name $name7 -PropertyType $type7 -Value $value7
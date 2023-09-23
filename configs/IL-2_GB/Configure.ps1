Write-Output "Configuring IL-2 Sturmovik Great Battles for use with ControllerBuddy-Profiles...`n"

Set-Variable UninstallRegistryKey -Option Constant -Value "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{66F649A9-0FA2-487E-BC0D-894BD7E89D5E}_is1"
Set-Variable InstallLocationRegistryValue -Option Constant -Value InstallLocation

$il2Dir = (Get-ItemPropertyValue -Path $UninstallRegistryKey -Name $InstallLocationRegistryValue -ErrorAction Ignore).TrimEnd('\')

if ($null -eq $il2Dir) {
    Write-Output "Error: IL-2 Sturmovik Great Battles registry value '$UninstallRegistryKey\$InstallLocationRegistryValue' does not exist"
    Exit 1
}

$il2InputDir = "$il2Dir\data\input"

if (-not (Test-Path $il2InputDir -PathType Container)) {
    Write-Output "Error: IL-2 Sturmovik Great Battles input directory '$il2InputDir' does not exist"
    Exit 1
}

Import-Module -Name "$PSScriptRoot\..\.lib\DirectInput"

$vJoyDevice = Get-VJoyDevice

if ($null -eq $vJoyDevice) {
    Write-Output 'Error: Could not find vJoy device'
    Exit 1
}

$devicesTxt = "$il2InputDir\devices.txt"

if (Test-Path $devicesTxt -PathType Leaf) {
    $devicesTxtContent = (Get-Content $devicesTxt -Raw)
}

if ([string]::IsNullOrEmpty($devicesTxtContent)) {
    $devicesTxtContent = 'configId,guid,model|'
}

$vJoyDeviceLineWithoutIndex = $([uri]::EscapeUriString("`"$(($vJoyDevice.InstanceGuid.ToString().ToLower() -split '-', 5)[0..2] -join '-')-0000545345440380`",$($vJoyDevice.InstanceName.ToString())"))
$vJoyDeviceLineWithIndexZero = "0,$vJoyDeviceLineWithoutIndex"
$escapedVJoyDeviceLineWithoutIndex = $([Regex]::Escape($vJoyDeviceLineWithoutIndex))

$devicesTxtContent = $devicesTxtContent -replace "(?m)^[1-9][0-9]*(,$escapedVJoyDeviceLineWithoutIndex)", '0$1'
$devicesTxtContent = $devicesTxtContent -replace "(?m)^0(,(?!$escapedVJoyDeviceLineWithoutIndex))", '1$1'

if ($devicesTxtContent -notmatch $([Regex]::Escape($vJoyDeviceLineWithIndexZero))) {
    $devicesTxtContent += "`n`n$vJoyDeviceLineWithIndexZero"
}

try {
    Set-Content -Path $devicesTxt -Value $devicesTxtContent -NoNewline
    Write-Output "Wrote file: $devicesTxt"
} catch {
    Write-Output "Error: Could not write file: $devicesTxt"
    Exit 1
}

Write-Output ''

$currentFilesFilename = 'current.*'
$currenFiles = Get-ChildItem -Path $PSScriptRoot -File -Depth 0 -Filter $currentFilesFilename

if ($currenFiles.count -eq 0) {
    Write-Output "Error: $currentFilesFilename files are missing"
    Exit 1
}

foreach ($currenFile in $currenFiles) {
    $destinationFile = "$il2InputDir\$($currenFile.Name)"

    try {
        Copy-Item $currenFile.FullName $il2InputDir -errorAction stop
        Write-Output "Copied '$($currenFile.Name)' to: $destinationFile"
    } catch {
        Write-Output "Error: Could not copy '$($currenFile.Name)' to: $destinationFile"
        Exit 1
    }
}

$snapsCfgFilename = 'snaps.cfg'
$snapsCfg = "$PSScriptRoot\$snapsCfgFilename"

if (-not (Test-Path $snapsCfg -PathType Leaf)) {
    Write-Output "Error: $snapsCfgFilename file is missing"
    Exit 1
}

$snapviewsDir = "$il2Dir\data\LuaScripts\snapviews"
$destinationFile = "$snapviewsDir\$snapsCfgFilename"

try {
    Copy-Item $snapsCfg $snapviewsDir -errorAction stop
    Write-Output "Copied '$snapsCfg' to: $destinationFile"
} catch {
    Write-Output "Error: Could not copy '$snapsCfgFilename' to: $destinationFile"
    Exit 1
}

Write-Output "`nIL-2 Sturmovik Great Battles is now fully configured!"
Exit 0
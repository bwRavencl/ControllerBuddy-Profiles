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
$devicesTxtContent = "configId,guid,model|`n`n0," + $([uri]::EscapeUriString("`"$(($vJoyDevice.InstanceGuid.ToString().ToLower() -split '-', 5)[0..2] -join '-')-0000545345440380`",$($vJoyDevice.InstanceName.ToString())"))

try {
    Get-ChildItem -Path $il2InputDir -File -Depth 0 | Remove-Item
    Write-Output "Cleared IL-2 Sturmovik Great Battles input directory '$il2InputDir'"
} catch {
    Write-Output "Error: Could not clear IL-2 Sturmovik Great Battles input directory '$il2InputDir'"
    Exit 1
}

Write-Output ''

try {
    Set-Content -Path $devicesTxt -Value $devicesTxtContent -NoNewline
    Write-Output "Wrote file: $devicesTxt"
} catch {
    Write-Output "Error: Could not write file: $devicesTxt"
    Exit 1
}

Write-Output ''

$inputFiles = Get-ChildItem -Path $PSScriptRoot -File -Depth 0 -Include ('current.*', 'global.*')

if ($inputFiles.count -eq 0) {
    Write-Output "Error: Input config files in '$PSScriptRoot' are missing"
    Exit 1
}

foreach ($inputFile in $inputFiles) {
    $destinationFile = "$il2InputDir\$($inputFile.Name)"

    try {
        Copy-Item $inputFile.FullName $il2InputDir -errorAction stop
        Write-Output "Copied '$($inputFile.Name)' to: $destinationFile"
    } catch {
        Write-Output "Error: Could not copy '$($inputFile.Name)' to: $destinationFile"
        Exit 1
    }
}

Write-Output ''

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
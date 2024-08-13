Write-Output "Configuring IL-2 Sturmovik Great Battles for use with ControllerBuddy-Profiles...`n"

Set-Variable UninstallRegistryKey -Option Constant -Value "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{66F649A9-0FA2-487E-BC0D-894BD7E89D5E}_is1"
Set-Variable InstallLocationRegistryValue -Option Constant -Value InstallLocation

$il2Dir = (Get-ItemPropertyValue -Path $UninstallRegistryKey -Name $InstallLocationRegistryValue -ErrorAction Ignore)

if ($null -eq $il2Dir) {
    Write-Output "Error: IL-2 Sturmovik Great Battles registry value '$UninstallRegistryKey\$InstallLocationRegistryValue' does not exist"
    Exit 1
} else {
    $il2Dir = $il2Dir.TrimEnd('\')
}

$il2DataDir = "$il2Dir\data"
$il2InputDir = "$il2DataDir\input"

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
$guidParts = ($vJoyDevice.InstanceGuid.ToString().ToLower() -split '-', 4)
$lastPart = $guidParts[3] -replace '-' -split '(..)' -ne ''
[array]::Reverse($lastPart)
$guidParts[3] = -join $lastPart
$modifiedGuid = $guidParts -join '-'

$devicesTxtContent = "configId,guid,model|`r`r`n0," + $([uri]::EscapeUriString("`"$modifiedGuid`",$($vJoyDevice.InstanceName.ToString())"))

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

$snapviewsDir = "$il2DataDir\LuaScripts\snapviews"
$destinationFile = "$snapviewsDir\$snapsCfgFilename"

try {
    Copy-Item $snapsCfg $snapviewsDir -errorAction stop
    Write-Output "Copied '$snapsCfg' to: $destinationFile"
} catch {
    Write-Output "Error: Could not copy '$snapsCfgFilename' to: $destinationFile"
    Exit 1
}

Write-Output ''

$startupCfg = "$il2DataDir\startup.cfg"

if (-not (Test-Path $startupCfg -PathType Leaf)) {
    Write-Output "Error: file '$startupCfg' does not exist"
    Exit 1
}

try {
    New-Item $startupCfg -Value ((Get-Content -Raw $startupCfg) -replace 'fullscreen\s*=\s*1', 'fullscreen = 0') -Force | Out-Null
    Write-Output "Updated file: $startupCfg"
} catch {
    Write-Output "Error: Could not update file: $startupCfg"
    Exit 1
}

Write-Output "`nIL-2 Sturmovik Great Battles is now fully configured!"
Exit 0
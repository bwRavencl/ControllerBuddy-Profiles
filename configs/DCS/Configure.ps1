Write-Output "Configuring DCS World for use with ControllerBuddy-Profiles...`n"

Add-Type @"
using System;
using System.Runtime.InteropServices;

public static class KnownFolders {
    [DllImport("shell32.dll")]
    public static extern int SHGetKnownFolderPath(
        [MarshalAs(UnmanagedType.LPStruct)] Guid rfid,
        uint dwFlags,
        IntPtr hToken,
        out IntPtr ppszPath);

    [DllImport("ole32.dll")]
    private static extern void CoTaskMemFree(IntPtr ptr);

    public static string GetPath(Guid rfid) {
        IntPtr pPath;
        int hr = SHGetKnownFolderPath(rfid, 0, IntPtr.Zero, out pPath);
        if (hr != 0) {
            Marshal.ThrowExceptionForHR(hr);
        }
        string path = Marshal.PtrToStringUni(pPath);
        CoTaskMemFree(pPath);
        return path;
    }
}
"@

Set-Variable -Name SavedGamesGuid -Option Constant -Value ([Guid]"4C5C32FF-BB9D-43b0-B5B4-2D72E54EAAA4")

$savedGamesDir = [KnownFolders]::GetPath($savedGamesGuid)
$dcsUserDir = "$savedGamesDir\DCS"

if (-not (Test-Path $dcsUserDir -PathType Container)) {
    Write-Output "Error: DCS user directory '$dcsUserDir' does not exist"
    Exit 1
}

Import-Module -Name "$PSScriptRoot\..\.lib\DirectInput"

$vJoyDevice = Get-VJoyDevice

if ($null -eq $vJoyDevice) {
    Write-Output 'Error: Could not find vJoy device'
    Exit 1
}

$isWine = Test-Path -Path 'HKCU:\Software\Wine'
$gamepadDevices = Get-GamepadDeviceList

if (-not $isWine) {
    while ($gamepadDevices.Count -lt 1) {
        Add-Type -AssemblyName PresentationCore, PresentationFramework

        if ([System.Windows.MessageBox]::Show("There is currently no controller connected.`nTo retry, please connect your controller now.`n`nRetry?", 'No controller connected', [System.Windows.MessageBoxButton]::YesNo, [System.Windows.MessageBoxImage]::Warning) -ne [System.Windows.MessageBoxResult]::Yes) {
            Write-Output 'Error: No controller connected'
            Exit 1
        }

        $gamepadDevices = Get-GamepadDeviceList
    }
}

$configDir = "$dcsUserDir\Config"
$inputDir = "$configDir\Input"

function Copy-DiffLuaFile {
    param (
        [Parameter(Mandatory)]
        [string]$Source,
        [Parameter(Mandatory)]
        [string]$Target,
        [Parameter(Mandatory)]
        [string]$DeviceCategory
    )

    $diffLuaFiles = Get-ChildItem -Path $PSScriptRoot -File -Depth 1 -Filter $Source

    if ($diffLuaFiles.count -eq 0) {
        Write-Output "Error: $Source file(s) are missing"
        Exit 1
    }

    foreach ($diffLuaFile in $diffLuaFiles) {
        $destinationDir = "$inputDir\$($diffLuaFile.Directory.Name)\$DeviceCategory"
        $destinationFile = "$destinationDir\$Target"

        try {
            New-Item $destinationDir -ItemType 'directory' -Force | Out-Null
            Copy-Item $diffLuaFile.FullName $destinationFile -errorAction stop
            Write-Output "Copied '$($diffLuaFile.Directory.Name)' input config to: $destinationFile"
        } catch {
            Write-Output "Error: Could not copy '$($diffLuaFile.Directory.Name)' input config to: $destinationFile"
            Exit 1
        }
    }

    Write-Output ''
}

function Split-InstanceGuid {
    param (
        [Parameter(Mandatory)]
        [object]$Device
    )

    $Device.InstanceGuid.ToString() -split '-'
}

function Get-DcsInstanceGuid {
    param (
        [Parameter(Mandatory)]
        [object]$Device,
        [Parameter(Mandatory = $false)]
        [string]$GuidPart0
    )

    $guidParts = Split-InstanceGuid $Device

    if ($GuidPart0) {
        $guidParts[0] = $GuidPart0
    }

    for ($i=0; $i -lt $guidParts.Count; $i++) {
        if ( $i -eq 2) {
            $guidParts[$i] = $guidParts[$i].ToLower()
        } else {
            $guidParts[$i] = $guidParts[$i].ToUpper()
        }
    }

    $guidParts -join '-'
}

Copy-DiffLuaFile -Source 'vJoy Device.diff.lua' -Target "$($vJoyDevice.InstanceName) {$(Get-DcsInstanceGuid $vJoyDevice)}.diff.lua" -DeviceCategory 'joystick'

if ($isWine) {
    $currentGuidPart0 = [Convert]::ToUint32((Split-InstanceGuid $vJoyDevice)[0], 16)
    $currentOffset = $WineHidJoystickGuidPart0 -bxor $currentGuidPart0
    $startOffset = [Math]::Max($currentOffset - 5, 0)
    $endOffset = $currentOffset + 5

    $startOffset..$endOffset | Where-Object { $_ -ne $currentOffset } | ForEach-Object {
        $guidPart0 = "{0:X8}" -f ($WineHidJoystickGuidPart0 -bxor $_)
        Copy-DiffLuaFile -Source 'vJoy Device.diff.lua' -Target "$($vJoyDevice.InstanceName) {$(Get-DcsInstanceGuid $vJoyDevice $guidPart0)}.diff.lua" -DeviceCategory 'joystick'
    }
}

Copy-DiffLuaFile -Source 'Keyboard.diff.lua' -Target 'Keyboard.diff.lua' -DeviceCategory 'keyboard'

$disabledDevicesLuaFile = "$inputDir\disabled.lua"

try {
    $fileContent = @'
local disabled = {
	["devices"] = {

'@
    $gamepadDevices | ForEach-Object {
        $fileContent += "`t`t[`"$($_.InstanceName) {$(Get-DcsInstanceGuid $_)}`"] = true,`n"
    }
    $fileContent += @'
	},
	["pnp"] = false,
}
return disabled
'@

    New-Item -Path $disabledDevicesLuaFile -Value ($fileContent | Out-String) -Force | Out-Null
    Write-Output "Wrote file: $disabledDevicesLuaFile"
} catch {
    Write-Output "Error: Could not write file: $disabledDevicesLuaFile"
    Exit 1
}

$optionsLuaFile = "$configDir\options.lua"
if (-not (Test-Path $optionsLuaFile -PathType Leaf)) {
    Write-Output "Error: file '$optionsLuaFile' does not exist"
    Exit 1
}

$synchronizeControlsLine = Select-String -Path $optionsLuaFile -Pattern '^\s*\["synchronize_controls"\]'
if ($null -eq $synchronizeControlsLine) {
    Write-Output "Error: file '$optionsLuaFile' is missing the 'synchronize_controls' line"
    Exit 1
}

$synchronizeControlsLineParts = $synchronizeControlsLine.Line -split '=', 2
if ($synchronizeControlsLineParts.Count -ne 2) {
    Write-Output "Error: file '$optionsLuaFile' contains a malformed 'synchronize_controls' line"
    Exit 1
}

if (($synchronizeControlsLineParts[1].Trim() -replace ',') -ne 'true') {
    try {
        Write-Output ''
        $optionsLuaContent = Get-Content $optionsLuaFile
        $optionsLuaContent[$synchronizeControlsLine.LineNumber - 1] = "`t`t[`"synchronize_controls`"] = true,"

        New-Item -Path $optionsLuaFile -Value ($optionsLuaContent | Out-String) -Force | Out-Null
        Write-Output "Updated file: $optionsLuaFile"
    } catch {
        Write-Output "Error: Could not update file: $optionsLuaFile"
        Exit 1
    }
}

Write-Output "`nDCS World is now fully configured!"
Exit 0
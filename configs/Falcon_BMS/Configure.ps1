Set-Variable BmsMajorMinorVersion -Option Constant -Value '4.38'
Set-Variable BmsFullName -Option Constant -Value "Falcon BMS $BmsMajorMinorVersion"

Write-Output "Configuring $BmsFullName for use with ControllerBuddy-Profiles...`n"

Set-Variable BMSPatchVersion -Option Constant -Value '2'
Set-Variable BMSExeVersion -Option Constant -Value "$BmsMajorMinorVersion.$BMSPatchVersion"

Set-Variable LauncherProductVersion -Option Constant -Value '3.0.2'
Set-Variable LauncherFileVersion -Option Constant -Value "$LauncherProductVersion.0"
Set-Variable LauncherUserConfigFilePattern -Option Constant -Value "$env:LOCALAPPDATA\Benchmark_Sims\FalconBMS.Launcher.exe_Url_*\$LauncherFileVersion\user.config"

Set-Variable BmsRegistryKey -Option Constant -Value "HKLM:\SOFTWARE\WOW6432Node\Benchmark Sims\$BmsFullName"
Set-Variable BmsBaseDirRegistryValue -Option Constant -Value baseDir

Set-Variable BMSUserConfigFileLauncherSectionHeadline -Option Constant -Value '// LAUNCHER OVERRIDES BEGIN HERE - DO NOT EDIT OR ADD BELOW THIS LINE'
Set-Variable BMSUserConfigFileDisableXInputLine -Option Constant -Value 'set g_bUseXInput 0'
Set-Variable BMSUserConfigFileEnableMouseButton4Line -Option Constant -Value 'set g_bMouseButton4TogglesClickablePit 1'

Set-Variable PopFilePatches -Option Constant -Value @{
    0x1A0 = 0x00
    0x188 = 0xCD
    0x189 = 0xCC
    0x18A = 0x4C
    0x18B = 0x3E
}

$bmsDir = (Get-ItemPropertyValue -Path $BmsRegistryKey -Name $BmsBaseDirRegistryValue -ErrorAction Ignore)

if ($null -eq $bmsDir) {
    Write-Output "Error: $BmsFullName registry value '$BmsRegistryKey\$BmsBaseDirRegistryValue' does not exist"
    Exit 1
} else {
    $bmsDir = $bmsDir.TrimEnd('\')
}

$bmsConfigDir = Join-Path $bmsDir User\Config

if (-not (Test-Path $bmsConfigDir -PathType Container)) {
    Write-Output "Error: $BmsFullName config directory '$bmsConfigDir' does not exist"
    Exit 1
}

$falconBmsExe = Join-Path $bmsDir 'Bin\x64\Falcon BMS.exe'

if (-not (Test-Path $falconBmsExe -PathType Leaf)) {
    Write-Output "Error: Falcon BMS executable '$falconBmsExe' does not exist"
    Exit 1
}

$falconBmsActualVersion = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($falconBmsExe).ProductVersion

if ($falconBmsActualVersion -ne $BMSExeVersion) {
    Write-Output "Error: Falcon BMS version mismatch: required $BMSExeVersion but found $falconBmsActualVersion"
    Exit 1
}

$launcherExe = Join-Path $bmsDir Launcher\FalconBMS.Launcher.exe

if (-not (Test-Path $launcherExe -PathType Leaf)) {
    Write-Output "Error: Launcher executable '$launcherExe' does not exist"
    Exit 1
}

$launcherActualVersion = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($launcherExe).ProductVersion

if ($launcherActualVersion -ne $LauncherProductVersion) {
    Write-Output "Error: Launcher version mismatch: required $LauncherProductVersion but found $launcherActualVersion"
    Exit 1
}

$directInputModule = Join-Path $PSScriptRoot ..\.lib\DirectInput
try {
    Import-Module -Name $directInputModule -ErrorAction Stop
} catch {
    Write-Output "Error: Could not import module '$directInputModule'"
    Exit 1
}

$vJoyDevice = Get-VJoyDevice

if ($null -eq $vJoyDevice) {
    Write-Output 'Error: Could not find vJoy device'
    Exit 1
}

try {
    $vJoyDeviceCapabilities = Get-DeviceCapability $vJoyDevice

    if (($null -eq $vJoyDeviceCapabilities.AxeCount) -or ($null -eq $vJoyDeviceCapabilities.ButtonCount) -or ($null -eq $vJoyDeviceCapabilities.PovCount)) {
        throw 'Incomplete vJoy device capabilities'
    }
} catch {
    Write-Output 'Error: Could not read vJoy device capabilities'
    Exit 1
}

$schema_version = '2'
$binding_type = 'hotas'
$vJoyProductGuidBytes = $vJoyDevice.ProductGuid.ToByteArray()
$product_id_hex = [BitConverter]::ToUInt16($vJoyProductGuidBytes, 0).ToString('X4')
$vendor_id_hex = [BitConverter]::ToUInt16($vJoyProductGuidBytes, 2).ToString('X4')
$pidvid = $product_id_hex + $vendor_id_hex
$durable_device_key = $pidvid
$product_name = $vJoyDevice.ProductName
$instance_name = $vJoyDevice.InstanceName
$duplicate_pidvid_sequence_number = 'null'
$axis_count = $vJoyDeviceCapabilities.AxeCount
$button_count = $vJoyDeviceCapabilities.ButtonCount
$pov_count = $vJoyDeviceCapabilities.PovCount
$capabilities_read_successfully = 'true'
$last_seen_instance_guid = $vJoyDevice.InstanceGuid.ToString('B')
$axis_binding_scope = 'shared_currently_f16_wins_if_files_differ'

Set-Variable F16VjoyDeviceBindingsFileContent -Option Constant -Value @"
{
  "schema_version": $schema_version,
  "binding_type": "$binding_type",
  "durable_device_key": "$durable_device_key",
  "pidvid": "$pidvid",
  "product_name": "$product_name",
  "instance_name": "$instance_name",
  "vendor_id_hex": "$vendor_id_hex",
  "product_id_hex": "$product_id_hex",
  "duplicate_pidvid_sequence_number": $duplicate_pidvid_sequence_number,
  "axis_count": $axis_count,
  "button_count": $button_count,
  "pov_count": $pov_count,
  "capabilities_read_successfully": $capabilities_read_successfully,
  "last_seen_instance_guid": "$last_seen_instance_guid",
  "aircraft_profile": "F-16",
  "axis_binding_scope": "$axis_binding_scope",
  "axis_bindings": [
    {
      "logical_axis_name": "Pitch",
      "physical_axis_index": 1,
      "saturation": "None",
      "deadzone": "Small",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Roll",
      "physical_axis_index": 0,
      "saturation": "None",
      "deadzone": "Small",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Yaw",
      "physical_axis_index": 5,
      "saturation": "None",
      "deadzone": "Small",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Throttle",
      "physical_axis_index": 2,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false,
      "afterburner_detent": 49220,
      "idle_detent": 0
    },
    {
      "logical_axis_name": "Throttle_Right",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Toe_Brake",
      "physical_axis_index": 6,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": true
    },
    {
      "logical_axis_name": "Toe_Brake_Right",
      "physical_axis_index": 7,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": true
    },
    {
      "logical_axis_name": "FOV",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Trim_Pitch",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Trim_Yaw",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Trim_Roll",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Radar_Antenna_Elevation",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Range_Knob",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Cursor_X",
      "physical_axis_index": 3,
      "saturation": "None",
      "deadzone": "Small",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Cursor_Y",
      "physical_axis_index": 4,
      "saturation": "None",
      "deadzone": "Small",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "COMM_Channel_1",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "COMM_Channel_2",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "MSL_Volume",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Threat_Volume",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "intercom",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "AI_vs_IVC",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "HUD_Brightness",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "FLIR_Brightness",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "HMS_Brightness",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Reticle_Depression",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Camera_Distance",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "HSI_Course_Knob",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "HSI_Heading_Knob",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Altimeter_Knob",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "ILS_Volume_Knob",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    }
  ],
  "button_bindings": [
    {
      "button_index": 0,
      "assignment_index": 0,
      "shift_state": "Unshifted",
      "trigger": "Press",
      "callback_name": "SimTriggerFirstDetent",
      "invoke": "Default",
      "sound_id": -1
    },
    {
      "button_index": 1,
      "assignment_index": 0,
      "shift_state": "Unshifted",
      "trigger": "Press",
      "callback_name": "SimTriggerSecondDetent",
      "invoke": "Default",
      "sound_id": -1
    },
    {
      "button_index": 2,
      "assignment_index": 0,
      "shift_state": "Unshifted",
      "trigger": "Press",
      "callback_name": "SimPickle",
      "invoke": "Default",
      "sound_id": -1
    }
  ],
  "pov_bindings": [
  ]
}

"@

Set-Variable F15ABCDVjoyDeviceBindingsFileContent -Option Constant -Value @"
{
  "schema_version": $schema_version,
  "binding_type": "$binding_type",
  "durable_device_key": "$durable_device_key",
  "pidvid": "$pidvid",
  "product_name": "$product_name",
  "instance_name": "$instance_name",
  "vendor_id_hex": "$vendor_id_hex",
  "product_id_hex": "$product_id_hex",
  "duplicate_pidvid_sequence_number": $duplicate_pidvid_sequence_number,
  "axis_count": $axis_count,
  "button_count": $button_count,
  "pov_count": $pov_count,
  "capabilities_read_successfully": $capabilities_read_successfully,
  "last_seen_instance_guid": "$last_seen_instance_guid",
  "aircraft_profile": "F-15ABCD",
  "axis_binding_scope": "$axis_binding_scope",
  "axis_bindings": [
    {
      "logical_axis_name": "Pitch",
      "physical_axis_index": 1,
      "saturation": "None",
      "deadzone": "Small",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Roll",
      "physical_axis_index": 0,
      "saturation": "None",
      "deadzone": "Small",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Yaw",
      "physical_axis_index": 5,
      "saturation": "None",
      "deadzone": "Small",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Throttle",
      "physical_axis_index": 2,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false,
      "afterburner_detent": 49220,
      "idle_detent": 0
    },
    {
      "logical_axis_name": "Throttle_Right",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Toe_Brake",
      "physical_axis_index": 6,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": true
    },
    {
      "logical_axis_name": "Toe_Brake_Right",
      "physical_axis_index": 7,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": true
    },
    {
      "logical_axis_name": "FOV",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Trim_Pitch",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Trim_Yaw",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Trim_Roll",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Radar_Antenna_Elevation",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Range_Knob",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Cursor_X",
      "physical_axis_index": 3,
      "saturation": "None",
      "deadzone": "Small",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Cursor_Y",
      "physical_axis_index": 4,
      "saturation": "None",
      "deadzone": "Small",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "COMM_Channel_1",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "COMM_Channel_2",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "MSL_Volume",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Threat_Volume",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "intercom",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "AI_vs_IVC",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "HUD_Brightness",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "FLIR_Brightness",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "HMS_Brightness",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Reticle_Depression",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Camera_Distance",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "HSI_Course_Knob",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "HSI_Heading_Knob",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "Altimeter_Knob",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    },
    {
      "logical_axis_name": "ILS_Volume_Knob",
      "physical_axis_index": null,
      "saturation": "None",
      "deadzone": "None",
      "curve": 1,
      "center_offset": 0,
      "invert": false
    }
  ],
  "button_bindings": [
    {
      "button_index": 0,
      "assignment_index": 0,
      "shift_state": "Unshifted",
      "trigger": "Press",
      "callback_name": "SimF15FirstTriggerIdent",
      "invoke": "Default",
      "sound_id": -1
    },
    {
      "button_index": 1,
      "assignment_index": 0,
      "shift_state": "Unshifted",
      "trigger": "Press",
      "callback_name": "SimF15SecondTriggerIdent",
      "invoke": "Default",
      "sound_id": -1
    },
    {
      "button_index": 2,
      "assignment_index": 0,
      "shift_state": "Unshifted",
      "trigger": "Press",
      "callback_name": "SimF15WeaponRelease",
      "invoke": "Default",
      "sound_id": -1
    },
    {
      "button_index": 3,
      "assignment_index": 0,
      "shift_state": "Unshifted",
      "trigger": "Press",
      "callback_name": "SimF15FlapsRetract",
      "invoke": "Default",
      "sound_id": 115
    },
    {
      "button_index": 4,
      "assignment_index": 0,
      "shift_state": "Unshifted",
      "trigger": "Press",
      "callback_name": "SimF15FlapsExtend",
      "invoke": "Default",
      "sound_id": 115
    }
  ],
  "pov_bindings": [
  ]
}

"@

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

function Get-DeviceBindingsFileName {
    param (
        [Parameter(Mandatory)]
        [string]$AircraftProfile,
        [Parameter(Mandatory)]
        [string]$DurableDeviceKey,
        [Parameter(Mandatory)]
        [string]$ProductName
    )

    $fileNameProductName = ($ProductName -replace '[^A-Za-z0-9\~\`\[\]\{\}\-_\=\''\x20]', '') -replace '/', '-'

    return "DeviceBindings_${AircraftProfile}_${DurableDeviceKey}_${fileNameProductName}.json"
}

$jsonDir = Join-Path $bmsConfigDir JSON

if (-not (Test-Path -LiteralPath $jsonDir -PathType Container)) {
    try {
        New-Item -ItemType Directory -Path $jsonDir -ErrorAction Stop | Out-Null
        Write-Output "Created directory: $jsonDir"
    } catch {
        Write-Output "Error: Could not create directory '$jsonDir'"
        Exit 1
    }
}

function Write-VjoyDeviceBindingsFile {
    param (
        [Parameter(Mandatory)]
        [string]$AircraftProfile,
        [Parameter(Mandatory)]
        [string]$Content
    )

    $path = Join-Path $jsonDir (Get-DeviceBindingsFileName -AircraftProfile $AircraftProfile -DurableDeviceKey $durable_device_key -ProductName $product_name)

    try {
        [System.IO.File]::WriteAllText($path, $Content, (New-Object System.Text.UTF8Encoding($false)))
        Write-Output "Wrote file: $path"
    } catch {
        Write-Output "Error: Could not write file: $path"
        Exit 1
    }
}

Write-VjoyDeviceBindingsFile 'F-16' $F16VjoyDeviceBindingsFileContent
Write-VjoyDeviceBindingsFile 'F-15ABCD' $F15ABCDVjoyDeviceBindingsFileContent

$gamepadInfos = @(foreach ($device in $gamepadDevices) {
    if ([string]::IsNullOrEmpty($device.ProductName)) {
        continue
    }

    $bytes = $device.ProductGuid.ToByteArray()
    [pscustomobject]@{
        Device = $device
        PidVid = [BitConverter]::ToUInt16($bytes, 0).ToString('X4') + [BitConverter]::ToUInt16($bytes, 2).ToString('X4')
        Seq = $null
    }
})

foreach ($group in @($gamepadInfos | Group-Object PidVid | Where-Object Count -gt 1)) {
    $sequenceNumber = 1
    foreach ($info in $group.Group) {
        $info.Seq = $sequenceNumber++
    }
}

function Remove-BindingsJson {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [string]$AircraftProfile
    )

    $keyboardJson = Join-Path $jsonDir "KeyboardBindings_$AircraftProfile.json"

    if ((Test-Path -LiteralPath $keyboardJson -PathType Leaf) -and $PSCmdlet.ShouldProcess($keyboardJson, 'Remove file')) {
        try {
            Remove-Item -LiteralPath $keyboardJson -Force -ErrorAction Stop
            Write-Output "Removed file: $keyboardJson"
        } catch {
            Write-Output "Error: Could not remove file: $keyboardJson"
            Exit 1
        }
    }

    foreach ($info in $gamepadInfos) {
        $durableDeviceKey = if ($null -ne $info.Seq) { "$($info.PidVid)_$($info.Seq)" } else { $info.PidVid }
        $gamepadJson = Join-Path $jsonDir (Get-DeviceBindingsFileName -AircraftProfile $AircraftProfile -DurableDeviceKey $durableDeviceKey -ProductName $info.Device.ProductName)

        if ((Test-Path -LiteralPath $gamepadJson -PathType Leaf) -and $PSCmdlet.ShouldProcess($gamepadJson, 'Remove file')) {
            try {
                Remove-Item -LiteralPath $gamepadJson -Force -ErrorAction Stop
                Write-Output "Removed file: $gamepadJson"
            } catch {
                Write-Output "Error: Could not remove file: $gamepadJson"
                Exit 1
            }
        }
    }
}

Remove-BindingsJson 'F-16'
Remove-BindingsJson 'F-15ABCD'

function Set-UserConfigSetting {
    [CmdletBinding(SupportsShouldProcess)]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', 'Name', Justification = 'False positive as rule does not scan child scopes')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', 'Value', Justification = 'False positive as rule does not scan child scopes')]
    param (
        [Parameter(Mandatory)]
        [string]$Name,
        [Parameter(Mandatory)]
        [string]$Value
    )
    $userConfigXml.configuration.userSettings.'FalconBMS.Launcher.Properties.Settings'.setting | Where-Object { ($_.name -eq $Name) -and ($_.value -ne $Value) } | ForEach-Object {
        if ($PSCmdlet.ShouldProcess($Name, "Set value to '$Value'")) {
            $_.value = $Value
        }
        $true
    }
}

$launcherUserConfigFiles = @(Get-ChildItem -Path $LauncherUserConfigFilePattern -File -ErrorAction Ignore)

foreach ($launcherUserConfigFile in $launcherUserConfigFiles) {
    $launcherUserConfigPath = $launcherUserConfigFile.FullName

    try {
        $userConfigXml = [xml]::new()
        $userConfigXml.PreserveWhitespace = $true
        $userConfigXml.Load($launcherUserConfigPath)

        if (Set-UserConfigSetting -Name 'Misc_ExMouseLook' -Value 'True') {
            try {
                $userConfigXml.Save($launcherUserConfigPath)
                Write-Output "Wrote file: $launcherUserConfigPath"
            } catch {
                Write-Output "Error: Could not write file: $launcherUserConfigPath"
                Exit 1
            }
        }
    } catch {
        Write-Output "Error: Could not process file: $launcherUserConfigPath"
        Exit 1
    }
}

function Add-UserConfigLine {
    param (
        [Parameter(Mandatory)]
        [string[]]$Line
    )

    $content = @()
    if (Test-Path $bmsUserConfigFile -PathType Leaf) {
        $content = @(Get-Content -Path $bmsUserConfigFile -ErrorAction Stop)
    }

    $changed = $false

    foreach ($settingLine in $Line) {
        $parts = $settingLine.Split(' ', [System.StringSplitOptions]::RemoveEmptyEntries)
        if ($parts.Count -ne 3 -or $parts[0] -ne 'set') {
            Write-Output "Invalid user config line: $settingLine"
            Exit 1
        }
        $setVariableRegex = "^\s*set\s+$([regex]::Escape($parts[1]))\s"

        $headlineIndex = -1
        $matchingIndexes = @()
        for ($i = 0; $i -lt $content.Count; $i++) {
            if (($headlineIndex -lt 0) -and ($content[$i] -match $BMSUserConfigFileLauncherSectionHeadline)) {
                $headlineIndex = $i
            }
            if ($content[$i] -match $setVariableRegex) {
                $matchingIndexes += $i
            }
        }

        if ($matchingIndexes.Count -eq 1) {
            $existingIndex = $matchingIndexes[0]
            $existingLine = ($content[$existingIndex] -replace '\s+', ' ').Trim()
            if (($existingLine -eq $settingLine) -and (($headlineIndex -lt 0) -or ($existingIndex -lt $headlineIndex))) {
                continue
            }
        }

        $newContent = @()
        for ($i = 0; $i -lt $content.Count; $i++) {
            if ($matchingIndexes -contains $i) {
                continue
            }
            if ($i -eq $headlineIndex) {
                $newContent += $settingLine
            }
            $newContent += $content[$i]
        }
        if ($headlineIndex -lt 0) {
            $newContent += $settingLine
        }

        $content = $newContent
        $changed = $true
    }

    if ($changed) {
        Set-Content -Path $bmsUserConfigFile -Value $content -ErrorAction Stop
        Write-Output "Wrote file: $bmsUserConfigFile"
    }
}

$bmsUserConfigFile = Join-Path $bmsConfigDir 'Falcon BMS User.cfg'
try {
    Add-UserConfigLine @($BMSUserConfigFileDisableXInputLine, $BMSUserConfigFileEnableMouseButton4Line)
} catch {
    Write-Output "Error: Could not process file: $bmsUserConfigFile"
    Exit 1
}

$popFiles = Get-ChildItem "$bmsConfigDir" -Filter *.pop

if ($popFiles.Count -eq 0) {
    Write-Output "Error: No .pop file found in '$bmsConfigDir' - launch $BmsFullName to generate it, then exit and rerun this script"
    Exit 1
}

$popFiles | Foreach-Object {
    $popFile = $_.FullName

    try {
        $popFileBytes = [System.IO.File]::ReadAllBytes($popFile)
        $popFileChanged = $false

        foreach ($offset in $PopFilePatches.Keys) {
            if ($popFileBytes[$offset] -ne $PopFilePatches[$offset]) {
                $popFileBytes[$offset] = $PopFilePatches[$offset]
                $popFileChanged = $true
            }
        }

        if ($popFileChanged) {
            try {
                [System.IO.File]::WriteAllBytes($popFile, $popFileBytes)
                Write-Output "Wrote file: $popFile"
            }
            catch {
                Write-Output "Error: Could not write file: $popFile"
                Exit 1
            }
        }
    }
    catch {
        Write-Output "Error: Could not process file: $popFile"
        Exit 1
    }
}

Write-Output "`n$BmsFullName is now fully configured!"
Exit 0
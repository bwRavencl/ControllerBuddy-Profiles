Write-Output "Configuring DCS World for use with ControllerBuddy-Profiles...`n"

$savedGamesDir = "$env:USERPROFILE\Saved Games"
$dcsUserDirs = @("$savedGamesDir\DCS", "$savedGamesDir\DCS.openbeta") | Where-Object -FilterScript { Test-Path $_ -PathType Container }

if ($dcsUserDirs.count -eq 0) {
    Write-Output "Error: No DCS user directory exists, neither '$($dcsUserDirs -join ''' nor ''')'"
    Exit 1
}

Import-Module -Name "$PSScriptRoot\..\.lib\DirectInput"

$vJoyDevice = Get-VJoyDevice

if ($null -eq $vJoyDevice) {
    Write-Output 'Error: Could not find vJoy device'
    Exit 1
}

$gamepadDevices = Get-GamepadDeviceList

function Get-DcsInstanceGuid {
    param (
        [Parameter(Mandatory=$true)]
        [SharpDX.DirectInput.DeviceInstance]$Device
    )

    $guidParts = $Device.InstanceGuid.ToString() -split '-', 5

    for ($i=0; $i -lt $guidParts.Count; $i++) {
        if ( $i -lt 2) {
            $guidParts[$i] = $guidParts[$i].ToUpper()
        } else {
            $guidParts[$i] = $guidParts[$i].ToLower()
        }
    }

    $guidParts -join '-'
}

foreach ($dcsUserDir in $dcsUserDirs) {
    $configDir = "$dcsUserDir\Config"
    $inputDir = "$configDir\Input"

    $diffLuaFilename = 'vJoy Device.diff.lua'
    $diffLuaFiles = Get-ChildItem -Path $PSScriptRoot -File -Depth 1 -Filter $diffLuaFilename

    if ($diffLuaFiles.count -eq 0) {
        Write-Output "Error: $diffLuaFilename files are missing"
        Exit 1
    }

    foreach ($diffLuaFile in $diffLuaFiles) {
        $destinationDir = "$inputDir\$($diffLuaFile.Directory.Name)\joystick"
        $destinationFile = "$destinationDir\$($vJoyDevice.InstanceName) {$(Get-DcsInstanceGuid $vJoyDevice)}.diff.lua"

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

    $disabledDevicesLuaFile = "$inputDir\disabled.lua"

    try {
        $fileContent =@'
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

        Set-Content -Path $disabledDevicesLuaFile -Value $fileContent -NoNewline
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

    $synchronizeControlsLine = Select-String -Path $optionsLuaFile -Pattern '["synchronize_controls"]' -SimpleMatch
    if ($null -eq $synchronizeControlsLine)
    {
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

            Set-Content -Path $optionsLuaFile -Value $optionsLuaContent
            Write-Output "Updated file: $optionsLuaFile"
        } catch {
            Write-Output "Error: Could not update file: $optionsLuaFile"
            Exit 1
        }
    }
}

$simpleRadioDir = (Get-ItemPropertyValue -Path HKCU:\SOFTWARE\DCS-SR-Standalone -Name SRPathStandalone -ErrorAction Ignore).TrimEnd('\')

if ($null -ne $simpleRadioDir) {
    if (-not (Test-Path $simpleRadioDir -PathType Container)) {
        Write-Output "Error: DCS-SimpleRadio-Standalone directory '$simpleRadioDir' does not exist"
        Exit 1
    }

    $defaultCfgFile = "$simpleRadioDir\default.cfg"

    try {
        if (Test-Path $defaultCfgFile -PathType Leaf) {
            $fileContent = (Get-Content $defaultCfgFile -Raw)

            $regex = '(?m)^\[Switch\d+][\s\S]*?(\[|\z)'

            while ($fileContent -match $regex) {
                $fileContent = $fileContent -replace $regex, '$1'
            }

            $fileContent = $fileContent.Trim()

            if (-not ([string]::IsNullOrEmpty($fileContent))) {
                while (-not ($fileContent.EndsWith("`n`n"))) {
                    $fileContent += "`n"
                }
            }

            $fileContent | Out-File $defaultCfgFile -NoNewline
        }

        $simpleRadioSwitchSections = @"
[Switch1]
name=`"$($vJoyDevice.InstanceName)`"
button=99
value=1
guid=$($vJoyDevice.InstanceGuid)

[Switch2]
name=`"$($vJoyDevice.InstanceName)`"
button=100
value=1
guid=$($vJoyDevice.InstanceGuid)

[Switch3]
name=`"$($vJoyDevice.InstanceName)`"
button=101
value=1
guid=$($vJoyDevice.InstanceGuid)

[Switch4]
name=`"$($vJoyDevice.InstanceName)`"
button=102
value=1
guid=$($vJoyDevice.InstanceGuid)
"@

        Add-Content -Path $defaultCfgFile -Value $simpleRadioSwitchSections
        Write-Output "Updated file: $defaultCfgFile"
    } catch {
        Write-Output "Error: Could not update file: $defaultCfgFile"
        Exit 1
    }
}

Write-Output "`nDCS World is now fully configured!"
Exit 0
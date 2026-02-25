Write-Output "Configuring F-22: Air Dominance Fighter for use with ControllerBuddy-Profiles...`n"

Set-Variable ControllersCfgFileTemplate -Option Constant -Value @'
STICK_X {{{0}}} 00000002 
STICK_Y {{{0}}} 00000102 
THROTTLE {{{0}}} 00000202 INVERT
RUDDER {{{0}}} 00000502 
POV {{00000000-0000-0000-0000-000000000000}} 00000000 
TRIGGER {{{0}}} 00000004 
TGLABRK {{00000000-0000-0000-0000-000000000000}} 00000000 
THRSVCT {{00000000-0000-0000-0000-000000000000}} 00000000 
TGLGEAR {{00000000-0000-0000-0000-000000000000}} 00000000 
CYCA2GW {{00000000-0000-0000-0000-000000000000}} 00000000 
CYCA2AW {{00000000-0000-0000-0000-000000000000}} 00000000 
SHOOTLIST_CREATE {{00000000-0000-0000-0000-000000000000}} 00000000 
SHOOTLIST_CYCLE {{00000000-0000-0000-0000-000000000000}} 00000000 
SENSORS_UP {{00000000-0000-0000-0000-000000000000}} 00000000 
SENSORS_DOWN {{00000000-0000-0000-0000-000000000000}} 00000000 
LAUNCH_COUNTERMSR {{{0}}} 00000104 
VIEW_COCKPIT {{00000000-0000-0000-0000-000000000000}} 00000000 
VIEW_TARGET {{00000000-0000-0000-0000-000000000000}} 00000000 

'@

Import-Module -Name (Join-Path $PSScriptRoot ..\.lib\Steam)

$f22adfDir = Get-SteamGamePath 3146140

if (-not $f22adfDir) {
    Write-Output "Error: F-22: Air Dominance Fighter is not installed"
    Exit 1
}

Import-Module -Name (Join-Path $PSScriptRoot ..\.lib\DirectInput)

$vJoyDevice = Get-VJoyDevice

if ($null -eq $vJoyDevice) {
    Write-Output 'Error: Could not find vJoy device'
    Exit 1
}

try {
    $controllersCfg = Join-Path $f22adfDir CONTROLLERS.CFG
    $controllersCfgContent = $ControllersCfgFileTemplate -f $vJoyDevice.InstanceGuid.ToString().ToUpper()
    $controllersCfgContent | Set-Content -Path $controllersCfg -Encoding ASCII -NoNewline
    Write-Output "Wrote file: $controllersCfg"
} catch {
    Write-Output "Error: Could not update file: $controllersCfg"
    Exit 1
}

Write-Output "`nF-22: Air Dominance Fighter is now fully configured!"
Exit 0
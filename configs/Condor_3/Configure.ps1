Write-Output "Configuring Condor 3 for use with ControllerBuddy-Profiles...`n"

Set-Variable ControlsIniKeyboardAssignments -Option Constant -Value @'
3000=0
3001=0
3002=0
3003=0
3004=44
3005=45
3006=46
3007=211
3008=210
3009=88
3010=49
3011=48
3012=33
3013=47
3014=34
3015=52
3016=19
3017=17
3018=20
3019=37
3020=38
3021=24
3022=23
3023=51
3024=18
3025=29
3026=27
3027=26
3028=13
3029=12
3030=11
3031=43
3032=40
3033=57
3034=75
3035=77
3036=72
3037=80
3038=76
3039=81
3040=71
3041=73
3042=201
3043=209
3044=53
3045=54
3046=199
3047=207
3048=157
3049=203
3050=205
3051=200
3052=208
3053=181
3054=55
3055=82
3056=87
3057=59
3058=60
3059=61
3060=62
3061=63
3062=64
3063=65
3064=66
3065=67
3066=78
3067=74
3068=21
3069=1
3070=42
3071=25
3072=16
3073=30
3074=14
3075=15
3076=39
3077=41
3078=32
3079=31
3080=35
3081=36
'@

Set-Variable ControlsIniVjoyAssignments -Option Constant -Value @'
0=0
1=4
2=20
3=8
'@

Set-Variable SetupIniInputSection -Option Constant -Value @'
[Input]
ForceFeedback=0
AutoRudder=0
ReverseRudder=0
StickTrim=0
MouseLook=1
LeftButtonForMouseLook=0
AileronsNonLinearity=6
AileronsRatio=10
ElevatorNonLinearity=6
ElevatorRatio=10
RudderNonLinearity=6
RudderRatio=10
StickForceSimulation=4
PedalsForceSimulation=4
ViewSmoothing=0
StickCenterWithHandOff=1
VerticalViewCenter=0
'@

$pilotsDir = "$([Environment]::GetFolderPath("MyDocuments"))\Condor3\Pilots"

if (-not (Test-Path $pilotsDir -PathType Container)) {
    Write-Output "Error: Condor 3 'Pilots' directory '$pilotsDir' does not exist"
    Exit 1
}

$pilotDirs = Get-ChildItem -Path $pilotsDir -Directory
if ($pilotDirs.Count -eq 0) {
    Write-Output "Error: Condor 3 'Pilots' directory is empty"
    Exit 1
}

Import-Module -Name "$PSScriptRoot\..\.lib\DirectInput"

$keyboardDevice = Get-KeyboardDevice

if ($null -eq $keyboardDevice) {
    Write-Output 'Error: Could not find keyboard device'
    Exit 1
}

$vJoyDevice = Get-VJoyDevice

if ($null -eq $vJoyDevice) {
    Write-Output 'Error: Could not find vJoy device'
    Exit 1
}

function Get-DeviceHeader {
    param (
        [Parameter(Mandatory)]
        [object]$Device
    )

    "[{$($Device.InstanceGuid.ToString().ToUpper())}]`n"
}

$pilotDirs | ForEach-Object {
    $controlsFile = "$($_.FullName)\controls.ini"

    try {
        Set-Content -Path $controlsFile -Value "$(Get-DeviceHeader $keyboardDevice)$ControlsIniKeyboardAssignments`n$(Get-DeviceHeader $vJoyDevice)$ControlsIniVjoyAssignments"
        Write-Output "Wrote file: $controlsFile"
    } catch {
        Write-Output "Error: Could not write file: $controlsFile"
        Exit 1
    }

    $setupFile = "$($_.FullName)\Setup.ini"

    try {
        if (Test-Path $setupFile -PathType Leaf) {
            New-Item $setupFile -Value ((Get-Content -Raw $setupFile) -replace '(?m)^\[Input][\s\S]*?(\[|\z)', '$1') -Force | Out-Null
        }

        Add-Content -Path $setupFile -Value $SetupIniInputSection
        Write-Output "Updated file: $setupFile"
    } catch {
        Write-Output "Error: Could not update file: $setupFile"
        Exit 1
    }
}

Write-Output "`nCondor 3 is now fully configured!"
Exit 0
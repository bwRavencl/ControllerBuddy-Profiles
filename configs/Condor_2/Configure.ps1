Write-Host Configuring Condor 2 for use with ControllerBuddy-Profiles...`n

Set-Variable ControlsIniKeyboardAssignments -Option Constant -Value @'
3008=203
3009=205
3010=200
3011=208
3012=44
3013=45
3014=46
3015=211
3016=210
3017=88
3018=49
3019=48
3020=33
3021=47
3022=34
3023=52
3024=19
3025=17
3026=20
3027=75
3028=77
3029=72
3030=80
3031=76
3032=71
3033=73
3034=78
3035=74
3036=21
3037=1
3038=25
3039=16
3040=14
3041=15
3042=55
3043=41
3044=32
3045=31
3046=59
3047=60
3048=61
3049=62
3050=63
3051=64
3052=65
3053=66
3054=67
3055=2
3056=3
3057=4
3058=5
3059=50
3060=201
3061=209
3062=157
3063=199
3064=207
3065=27
3066=26
3067=13
3068=12
3069=43
3070=40
3071=11
3072=35
3073=36
3074=18
3075=37
3076=38
3077=24
3078=23
3079=57
3080=30
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
ViewSmoothing=3
StickCenterWithHandOff=1
VerticalViewCenter=0
'@

$pilotsDir = "$([Environment]::GetFolderPath("MyDocuments"))\Condor\Pilots"

if (-not (Test-Path $pilotsDir -PathType Container)) {
    Write-Host "Error: Condor 2 'Pilots' directory '$pilotsDir' does not exist"
    Exit 1
}

$pilotDirs = Get-ChildItem -Path $pilotsDir -Directory
if ($pilotDirs.Count -eq 0) {
    Write-Host "Error: Condor 2 'Pilots' directory is empty"
    Exit 1
}

Import-Module -Name "$PSScriptRoot\..\.lib\DirectInput"

$keyboardDevice = Get-KeyboardDevice

if ($keyboardDevice -eq $null) {
    Write-Host Error: Could not find keyboard device
    Exit 1
}

$vJoyDevice = Get-VJoyDevice

if ($vJoyDevice -eq $null) {
    Write-Host Error: Could not find vJoy device
    Exit 1
}

function Get-DeviceHeader {
    param (
        [Parameter(Mandatory=$true)]
        [SharpDX.DirectInput.DeviceInstance]$Device
    )

    "[{$($Device.InstanceGuid.ToString().ToUpper())}]`n"
}

$pilotDirs | foreach {
    $controlsFile = "$($_.FullName)\controls.ini"

    try {
        Set-Content -Path $controlsFile -Value "$(Get-DeviceHeader $keyboardDevice)$ControlsIniKeyboardAssignments`n$(Get-DeviceHeader $vJoyDevice)$ControlsIniVjoyAssignments"
        Write-Host Wrote file: $controlsFile
    } catch {
        Write-Host Error: Could not write file: $controlsFile
        Exit 1
    }

    $setupFile = "$($_.FullName)\Setup.ini"

    try {
        if (Test-Path $setupFile -PathType Leaf) {
            (Get-Content $setupFile -Raw) -replace '(?m)^\[Input][\s\S]*?(\[|\z)', '$1' | Out-File $setupFile -NoNewline
        }

        Add-Content -Path $setupFile -Value $SetupIniInputSection
        Write-Host Updated file: $setupFile
    } catch {
        Write-Host Error: Could not update file: $setupFile
        Exit 1
    }
}

Write-Host `nCondor 2 is now fully configured!
Exit 0
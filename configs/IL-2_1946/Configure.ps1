Write-Output "Configuring IL-2 1946 for use with ControllerBuddy-Profiles...`n"

Set-Variable ConfIniRtsSectionContent -Option Constant -Value @'
;ProcessAffinityMask=1
mouseUse=2
joyUse=1
trackIRUse=1
DisableIME=0
locale=
UseSmartAxis=0
JoyProfile=0
'@

Set-Variable ConfIniRtsMouseSectionContent -Option Constant -Value @'
SensitivityX=1.0
SensitivityY=1.0
Invert=0
SensitivityZ=1.0
'@

Set-Variable ConfIniRtsJoystickSectionContent -Option Constant -Value @'
X=0 1 4 9 16 25 36 49 64 81 100 0
Y=0 1 4 9 16 25 36 49 64 81 100 0
Z=0 10 20 30 40 50 60 70 80 90 100
RZ=0 10 20 30 40 50 60 70 80 90 100 0
FF=0
U=0 10 20 30 40 50 60 70 80 90 100 0
V=0 10 20 30 40 50 60 70 80 90 100 0
1X=0 100 100 100 100 100 100 100 100 100 100 0 0
1Y=0 100 100 100 100 100 100 100 100 100 100 0 0
1Z=0 100 100 100 100 100 100 100 100 100 100 0 0
1RX=0 100 100 100 100 100 100 100 100 100 100 0 0
1RY=0 100 100 100 100 100 100 100 100 100 100 0 0
1RZ=0 100 100 100 100 100 100 100 100 100 100 0 0
1U=0 100 100 100 100 100 100 100 100 100 100 0 0
1V=0 100 100 100 100 100 100 100 100 100 100 0 0
1X1=0 100 100 100 100 100 100 100 100 100 100 0 0
1Y1=0 100 100 100 100 100 100 100 100 100 100 0 0
1Z1=0 100 100 100 100 100 100 100 100 100 100 0 0
1RX1=0 100 100 100 100 100 100 100 100 100 100 0 0
1RY1=0 100 100 100 100 100 100 100 100 100 100 0 0
'@

Set-Variable SettingsIniHotKeyPilotSectionContent -Option Constant -Value @'
Joystick19 JoystickDevice0=AIRCRAFT_GEAR_DOWN_MANUAL
Z=RudderLeft
Joystick4 JoystickDevice0=AIRCRAFT_TOGGLE_AIRBRAKE
X=RudderRight
W=Boost
V=AIRCRAFT_FLAPS_NOTCH_DOWN
Shift Z=AIRCRAFT_TRIM_R_0
Joystick20 JoystickDevice0=CompressorMinus
R=Radiator
Shift X=AIRCRAFT_TRIM_R_0
N=AIRCRAFT_STABILIZER
Joystick5 JoystickDevice0=AIRCRAFT_CARRIERHOOK
I=AIRCRAFT_TOGGLE_ENGINE
Ctrl Z=AIRCRAFT_TRIM_R_MINUS
G=Gear
Joystick21 JoystickDevice0=CompressorPlus
F=AIRCRAFT_FLAPS_NOTCH_UP
Ctrl X=AIRCRAFT_TRIM_R_PLUS
B=Brake
Ctrl T=AIRCRAFT_DROP_TANKS
Joystick6 JoystickDevice0=AIRCRAFT_BRAKESHOE
Equals=AIRCRAFT_POWER_PLUS_5
Joystick22 JoystickDevice0=EngineSelectAll
9=Power90
8=Power80
7=Power70
6=Power60
5=Power50
4=Power40
3=Power30
2=Power20
Joystick7 JoystickDevice0=AIRCRAFT_TAILWHEELLOCK
1=Power0
0=Power100
Slash=AIRCRAFT_RUDDER_CENTRE
Period=AIRCRAFT_RUDDER_RIGHT_1
Shift 4=Step90
Shift 3=Step60
Joystick23 JoystickDevice0=EngineSelectNone
Comma=AIRCRAFT_RUDDER_LEFT_1
Shift 2=Step30
Shift 1=Step0
Shift 0=StepAuto
Joystick0 JoystickDevice0=Weapon0
Down=ElevatorDown
Right=AileronRight
Up=ElevatorUp
Joystick8 JoystickDevice0=WINGFOLD
Left=AileronLeft
Shift Up=AIRCRAFT_TRIM_V_0
Space=Weapon2
Joystick24 JoystickDevice0=EngineSelectLeft
Shift Left=AIRCRAFT_TRIM_H_0
Joystick1 JoystickDevice0=Weapon1
Joystick9 JoystickDevice0=COCKPITDOOR
Ctrl Down=AIRCRAFT_TRIM_V_PLUS
Ctrl Right=AIRCRAFT_TRIM_H_PLUS
Ctrl Up=AIRCRAFT_TRIM_V_MINUS
Joystick25 JoystickDevice0=EngineSelectRight
Underscore=AIRCRAFT_POWER_MINUS_5
Ctrl Left=AIRCRAFT_TRIM_H_MINUS
Joystick2 JoystickDevice0=Weapon2
Enter=Weapon0
Joystick18 JoystickDevice0=AIRCRAFT_GEAR_UP_MANUAL
NumPad-=AIRCRAFT_POWER_MINUS_5
Backspace=Weapon1
NumPad+=AIRCRAFT_POWER_PLUS_5
Joystick3 JoystickDevice0=Weapon3
Alt Space=Weapon3
'@

Set-Variable SettingsIniHotKeyGunnerSectionContent -Option Constant -Value @'
MouseLeft=Fire
'@

Set-Variable SettingsIniHotKeyAircraftViewSectionContent -Option Constant -Value @'
Ctrl F8=NextViewEnemyFollow
NumPad-0=PadlockViewForward
Ctrl F2=NextViewEnemy
Ctrl F1=CockpitShow
Y=PadlockViewPrev
Alt F7=ViewEnemyDirectGround
U=PadlockViewNext
Alt F6=ViewEnemyDirectAir
C=changeCockpit
End=fov70
PageDown=fov90
Delete=fov30
F8=OutsideViewFollow
F7=ViewEnemyGround
F6=ViewEnemyAir
F5=PadlockViewGround
F4=PadlockView
F3=OutsideViewFly
Shift F8=NextViewFollow
F2=OutsideView
Shift F7=ViewFriendGround
F1=CockpitView
Shift F6=ViewFriendAir
Shift F5=PadlockViewFriendGround
Shift F4=PadlockViewFriend
Shift F2=NextView
Shift F1=cockpitAim
'@

Set-Variable SettingsIniHotKeySnapViewSectionContent -Option Constant -Value @'
NumPad-4=Snap_m2_0
NumPad-3=Snap_3_0
NumPad-2=Snap_0_m2
NumPad-1=Snap_m3_0
Pov90 JoystickPov0=Snap_2_0
Pov135 JoystickPov0=Snap_3_0
Pov180 JoystickPov0=Snap_0_m1
Pov225 JoystickPov0=Snap_m3_0
Pov270 JoystickPov0=Snap_m2_0
Pov315 JoystickPov0=Snap_m1_0
F9=SnapPanSwitch
Pov0 JoystickPov0=Snap_0_2
NumPad-9=Snap_1_0
NumPad-8=Snap_0_0
Pov45 JoystickPov0=Snap_1_0
NumPad-7=Snap_m1_0
NumPad-6=Snap_2_0
NumPad-5=Snap_0_2
'@

Set-Variable SettingsIniHotKeyPanViewSectionContent -Option Constant -Value @'
NumPad-4=PanLeft2
NumPad-3=PanRight3
NumPad-2=PanDown
NumPad-1=PanLeft3
Pov90 JoystickPov0=PanRight2
Pov135 JoystickPov0=PanRight3
Pov180 JoystickPov0=PanDown
Pov225 JoystickPov0=PanLeft3
Pov270 JoystickPov0=PanLeft2
Pov315 JoystickPov0=PanLeft
Pov0 JoystickPov0=PanUp
NumPad-9=PanRight
NumPad-8=PanUp
Pov45 JoystickPov0=PanRight
NumPad-7=PanLeft
NumPad-6=PanRight2
NumPad-5=PanReset
'@

Set-Variable SettingsIniHotKeyHeadMoveSectionContent -Option Constant -Value @'
Joystick11 JoystickDevice0=Head_DOWN
Joystick12 JoystickDevice0=Head_LEANL
Joystick13 JoystickDevice0=Head_LEANR
Joystick14 JoystickDevice0=Head_LEANF
Joystick15 JoystickDevice0=Head_LEANB
Joystick16 JoystickDevice0=Head_RET_TO_DEF
Joystick10 JoystickDevice0=Head_UP
'@

Set-Variable SettingsIniHotKeyOrdersSectionContent -Option Constant -Value @'
Y=order15
W=order11
U=order16
T=order14
R=order13
Q=order10
I=order17
E=order12
9=order9
8=order8
7=order7
6=order6
5=order5
4=order4
3=order3
2=order2
1=order1
0=order0
Escape=deactivate
Tab=activate
'@

Set-Variable SettingsIniHotKeyMiscSectionContent -Option Constant -Value @'
BackQuote=chat
T=toggleSmokes
S=onlineRating
M=pad
A=autopilot
Ctrl L=cockpitLight
Ctrl E=ejectPilot
Ctrl D=cockpitDim
Joystick17 JoystickDevice0=AUX_A
'@

Set-Variable SettingsIniHotKeyTimeCompressionSectionContent -Option Constant -Value @'
CloseBracket=timeSpeedUp
OpenBracket=timeSpeedDown
P=timeSpeedPause
Quote=timeSpeedNormal
Pause=timeSpeedPause
'@

Set-Variable SettingsIniHotKeyMoveSectionContent -Option Constant -Value @'
JoystickDevice0 AXE_RZ=rudder
JoystickDevice0 AXE_Y=elevator
JoystickDevice0 AXE_X=aileron
AXE_RX JoystickDevice0=brakes_left
AXE_RY JoystickDevice0=brakes_right
AXE_U JoystickDevice0=-pitch
AXE_V JoystickDevice0=-mixture
AXE_Z JoystickDevice0=-power
'@

Set-Variable GameServiceGamesCooperativeRegistryKey -Option Constant -Value ('HKLM:\Software' + ($(if ([Environment]::Is64BitOperatingSystem) { '\WOW6432Node' } else { '' })) + '\Ubi Soft\Game Service Games')
Set-Variable PfCooperativeRegistryKey -Option Constant -Value "$GameServiceGamesCooperativeRegistryKey\PF_COOPERATIVE"
Set-Variable PfDogfightRegistryKey -Option Constant -Value "$GameServiceGamesCooperativeRegistryKey\PF_DOGFIGHT"
Set-Variable DirectoryRegistryValue -Option Constant -Value directory

$gsDataDir = Get-ItemPropertyValue -Path $PfCooperativeRegistryKey -Name $DirectoryRegistryValue -ErrorAction Ignore

if ($null -eq $gsDataDir) {
    $gsDataDir = Get-ItemPropertyValue -Path $PfDogfightRegistryKey -Name $DirectoryRegistryValue -ErrorAction Ignore
}

if ($null -eq $gsDataDir) {
    Write-Output "Error: IL-2 1946 registry values '$PfCooperativeRegistryKey\$DirectoryRegistryValue' and '$PfDogfightRegistryKey\$DirectoryRegistryValue' do not exist"
    Exit 1
} else {
    $il2Dir = $gsDataDir.TrimEnd('\GSData')
}

if (-not (Test-Path $il2Dir -PathType Container)) {
    Write-Output "Error: IL-2 1946 directory '$il2Dir' does not exist"
    Exit 1
}

$confIniFile = Join-Path $il2Dir conf.ini

if (-not (Test-Path $confIniFile -PathType Leaf)) {
    Write-Output "Error: IL-2 1946 config file '$confIniFile' does not exist"
    Exit 1
}

$confIniContent = Get-Content -Raw $confIniFile

function Update-SectionContent {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '', Justification = 'False positive as function itself does not change system state')]
    param(
        [Parameter(Mandatory)]
        [AllowEmptyString()]
        [string]$FileContent,
        [Parameter(Mandatory)]
        [string]$SectionTitle,
        [Parameter(Mandatory)]
        [string]$SectionContent,
        [Parameter(Mandatory)]
        [bool]$AddEmptyLineBetweenSections
    )

    $escapedTitle = [regex]::Escape($SectionTitle)
    $pattern = "(?ms)^\[$escapedTitle\]\s*(.*?)\s*(?=^\[|\z)"

    if ($FileContent -match $pattern) {
        $replacement = "[$SectionTitle]`r`n$SectionContent`r`n"
        if ($AddEmptyLineBetweenSections) {
            $replacement += "`r`n"
        }
        $updatedContent = [regex]::Replace($FileContent, $pattern, $replacement)
    } else {
        if ($FileContent -notmatch '\S') {
            $updatedContent = "[$SectionTitle]`r`n$SectionContent`r`n"
        } else {
            $updatedContent = $FileContent.TrimEnd() + "`r`n"
            if ($AddEmptyLineBetweenSections) {
                $updatedContent += "`r`n"
            }
            $updatedContent += "[$SectionTitle]`r`n$SectionContent`r`n"
        }
    }

    return $updatedContent.TrimEnd()
}

$confIniContent = Update-SectionContent -FileContent $confIniContent -SectionTitle 'rts' -SectionContent $ConfIniRtsSectionContent -AddEmptyLineBetweenSections $true
$confIniContent = Update-SectionContent -FileContent $confIniContent -SectionTitle 'rts_mouse' -SectionContent $ConfIniRtsMouseSectionContent -AddEmptyLineBetweenSections $true
$confIniContent = Update-SectionContent -FileContent $confIniContent -SectionTitle 'rts_joystick' -SectionContent $ConfIniRtsJoystickSectionContent -AddEmptyLineBetweenSections $true

try {
    Set-Content -Path $confIniFile -Value $confIniContent
    Write-Output "Wrote file: $confIniFile"
} catch {
    Write-Output "Error: Could not write file: $confIniFile"
    Exit 1
}

$usersDir = Join-Path $il2Dir Users

if (-not (Test-Path $usersDir -PathType Container)) {
    Write-Output "Error: IL-2 1946 users directory '$usersDir' does not exist"
    Exit 1
}

$userDirs = Get-ChildItem -Path $usersDir -Directory
if ($userDirs.Count -eq 0) {
    Write-Output "Error: IL-2 1946 'Users' directory is empty"
    Exit 1
}

$userDirs | ForEach-Object {
    $settingsIniFile = Join-Path $_.FullName settings.ini

    if (-not (Test-Path $settingsIniFile -PathType Leaf)) {
        Write-Output "Error: IL-2 1946 settings file '$settingsIniFile' does not exist"
        Exit 1
    }

    $settingsIniContent = Get-Content -Raw $settingsIniFile

    $settingsIniContent = Update-SectionContent -FileContent $settingsIniContent -SectionTitle 'HotKey pilot' -SectionContent $SettingsIniHotKeyPilotSectionContent -AddEmptyLineBetweenSections $false
    $settingsIniContent = Update-SectionContent -FileContent $settingsIniContent -SectionTitle 'HotKey gunner' -SectionContent $SettingsIniHotKeyGunnerSectionContent -AddEmptyLineBetweenSections $false
    $settingsIniContent = Update-SectionContent -FileContent $settingsIniContent -SectionTitle 'HotKey aircraftView' -SectionContent $SettingsIniHotKeyAircraftViewSectionContent -AddEmptyLineBetweenSections $false
    $settingsIniContent = Update-SectionContent -FileContent $settingsIniContent -SectionTitle 'HotKey SnapView' -SectionContent $SettingsIniHotKeySnapViewSectionContent -AddEmptyLineBetweenSections $false
    $settingsIniContent = Update-SectionContent -FileContent $settingsIniContent -SectionTitle 'HotKey PanView' -SectionContent $SettingsIniHotKeyPanViewSectionContent -AddEmptyLineBetweenSections $false
    $settingsIniContent = Update-SectionContent -FileContent $settingsIniContent -SectionTitle 'HotKey HeadMove' -SectionContent $SettingsIniHotKeyHeadMoveSectionContent -AddEmptyLineBetweenSections $false
    $settingsIniContent = Update-SectionContent -FileContent $settingsIniContent -SectionTitle 'HotKey orders' -SectionContent $SettingsIniHotKeyOrdersSectionContent -AddEmptyLineBetweenSections $false
    $settingsIniContent = Update-SectionContent -FileContent $settingsIniContent -SectionTitle 'HotKey misc' -SectionContent $SettingsIniHotKeyMiscSectionContent -AddEmptyLineBetweenSections $false
    $settingsIniContent = Update-SectionContent -FileContent $settingsIniContent -SectionTitle 'HotKey timeCompression' -SectionContent $SettingsIniHotKeyTimeCompressionSectionContent -AddEmptyLineBetweenSections $false
    $settingsIniContent = Update-SectionContent -FileContent $settingsIniContent -SectionTitle 'HotKey move' -SectionContent $SettingsIniHotKeyMoveSectionContent -AddEmptyLineBetweenSections $false

    try {
        Set-Content -Path $settingsIniFile -Value $settingsIniContent
        Write-Output "Wrote file: $settingsIniFile"
    } catch {
        Write-Output "Error: Could not write file: $settingsIniFile"
        Exit 1
    }
}

Write-Output "`nIL-2 1946 is now fully configured!"
Exit 0
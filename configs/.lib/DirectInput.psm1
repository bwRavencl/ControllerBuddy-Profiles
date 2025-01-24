if (Test-Path -Path 'HKCU:\Software\Wine') {
    Set-Variable VjoyProductGuid -Option Constant -Value '56781234-0000-0000-0000-504944564944'
} else {
    Set-Variable VjoyProductGuid -Option Constant -Value 'bead1234-0000-0000-0000-504944564944'
}

Unblock-File "$PSScriptRoot\*"

if ($PSVersionTable.PSEdition -eq 'Core') {
    Add-Type -LiteralPath "$PSScriptRoot\SharpGen.Runtime.dll"
    Add-Type -LiteralPath "$PSScriptRoot\Vortice.DirectX.dll"
    Add-Type -LiteralPath "$PSScriptRoot\Vortice.DirectInput.dll"

    Set-Variable DirectInput -Option Constant -Value $([Vortice.DirectInput.DInput]::DirectInput8Create())

    Set-Variable GamepadDeviceType -Option Constant -Value $([Vortice.DirectInput.DeviceType]::Gamepad)
    Set-Variable KeyboardDeviceType -Option Constant -Value $([Vortice.DirectInput.DeviceType]::Keyboard)
    Set-Variable GenericGamepadUsageId -Option Constant -Value $([Vortice.Multimedia.UsageId]::GenericGamepad)
} else {
    Add-Type -LiteralPath "$PSScriptRoot\SharpDX.dll"
    Add-Type -LiteralPath "$PSScriptRoot\SharpDX.DirectInput.dll"

    Set-Variable DirectInput -Option Constant -Value $(New-Object -TypeName SharpDX.DirectInput.directinput)

    Set-Variable GamepadDeviceType -Option Constant -Value $([SharpDX.DirectInput.DeviceType]::Gamepad)
    Set-Variable KeyboardDeviceType -Option Constant -Value $([SharpDX.DirectInput.DeviceType]::Keyboard)
    Set-Variable GenericGamepadUsageId -Option Constant -Value $([SharpDX.Multimedia.UsageId]::GenericGamepad)
}

<#
.SYNOPSIS

Get-GamepadDeviceList returns a list of DirectInput devices of type Gamepad.
#>
function Get-GamepadDeviceList {
    $DirectInput.GetDevices() | Where-Object { ($_.Type -eq @($GamepadDeviceType) -or ($_.Usage -eq $GenericGamepadUsageId)) }
}

<#
.SYNOPSIS

Get-KeyboardDevice returns the first DirectInput devices of type Keyboard.
#>
function Get-KeyboardDevice {
    $DirectInput.GetDevices() | Where-Object { $_.Type -eq $KeyboardDeviceType } | Select-Object -first 1
}

<#
.SYNOPSIS

Get-VJoyDevice returns the first vJoy DirectInput device.
#>
function Get-VJoyDevice {
    $DirectInput.GetDevices() | Where-Object { $_.ProductGuid -eq $VjoyProductGuid } | Select-Object -first 1
}

Export-ModuleMember -Function Get-GamepadDeviceList, Get-KeyboardDevice, Get-VJoyDevice
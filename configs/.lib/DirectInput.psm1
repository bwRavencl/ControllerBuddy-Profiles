Set-Variable VjoyProductGuid -Option Constant -Value 'bead1234-0000-0000-0000-504944564944'

Unblock-File "$PSScriptRoot\*"

Add-Type -LiteralPath "$PSScriptRoot\SharpDX.dll"
Add-Type -LiteralPath "$PSScriptRoot\SharpDX.DirectInput.dll"

$directInput = New-Object -TypeName SharpDX.DirectInput.directinput

<#
.SYNOPSIS

Get-GamepadDeviceList returns a list of DirectInput devices of type Gamepad.
#>
function Get-GamepadDeviceList {
    $directInput.GetDevices() | Where-Object { ($_.Type -eq @([SharpDX.DirectInput.DeviceType]::Gamepad) -or ($_.Usage -eq [SharpDX.Multimedia.UsageId]::GenericGamepad )) }
}

<#
.SYNOPSIS

Get-KeyboardDevice returns the first DirectInput devices of type Keyboard.
#>
function Get-KeyboardDevice {
    $directInput.GetDevices() | Where-Object { $_.Type -eq [SharpDX.DirectInput.DeviceType]::Keyboard } | Select-Object -first 1
}

<#
.SYNOPSIS

Get-VJoyDevice returns the first vJoy DirectInput device.
#>
function Get-VJoyDevice {
    $directInput.GetDevices() | Where-Object { $_.ProductGuid -eq $VjoyProductGuid } | Select-Object -first 1
}

Export-ModuleMember -Function Get-GamepadDeviceList, Get-KeyboardDevice, Get-VJoyDevice
Set-Variable VjoyProductGuid -Option Constant -Value 'bead1234-0000-0000-0000-504944564944'

[void][system.reflection.assembly]::LoadFile("$PSScriptRoot\SharpDX.dll");
[void][system.reflection.assembly]::LoadFile("$PSScriptRoot\SharpDX.DirectInput.dll");

$directInput = New-Object -TypeName SharpDX.DirectInput.directinput;

function Get-GamepadDevices {
    $directInput.GetDevices() | Where-Object { $_.Type -eq [SharpDX.DirectInput.DeviceType]::Gamepad }
}

function Get-KeyboardDevice {
    $directInput.GetDevices() | Where-Object { $_.Type -eq [SharpDX.DirectInput.DeviceType]::Keyboard } | Select-Object -first 1
}

function Get-VJoyDevice {
    $directInput.GetDevices() | Where-Object { $_.ProductGuid -eq $VjoyProductGuid } | Select-Object -first 1
}

Export-ModuleMember -Function Get-GamepadDevices, Get-KeyboardDevice, Get-VJoyDevice
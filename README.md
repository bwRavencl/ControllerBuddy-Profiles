# ControllerBuddy-Profiles

## 📖 Description

This repository contains a collection of profiles for the gamepad mapping software [ControllerBuddy](https://controllerbuddy.org).

All profiles have been created by the author of ControllerBuddy and target a variety of flight simulators.  
Please note that these profiles are constantly being updated and may change significantly over time.

## 🗣️ Instructions

- The `.json` files are ControllerBuddy profile files and can be loaded with the above mentioned application.
- The `configs` subdirectory contains game configuration files for use with the above profiles.
- For some applications, the `configs` subdirectory contains a PowerShell script called `Configure.ps1` that will automatically modify the application's settings to work with the corresponding ControllerBuddy profile.


  **Warning:** Use these scripts at your own risk!  
  They will change the input settings of the application. Backup your settings if necessary.

  **Notes:**
  - Make sure that your gamepad is connected before running the scripts!
  - The scripts are compatible with both Windows PowerShell 5.1 and [PowerShell 7+](https://github.com/PowerShell/PowerShell).

  **Usage with Wine on Linux:**
  - A working installation of PowerShell within the corresponding Wine prefix is required.
  - To start a script, run: `WINEDEBUG='-all' wine pwsh Configure.ps1`
  - Since the uinput devices created by ControllerBuddy are not persistent, it is necessary to start Local or Client mode before running a script.
- If there is no `Configure.ps1` script for the application, you will have to make the necessary settings changes manually.
- If you are using a controller that is not a DualShock 4 or Dual Sense, you will also need to manually configure the application to ignore all input from your physical controller to prevent possible interference with the input coming from ControllerBuddy and vJoy.

## 🙏 Attribution

ControllerBuddy-Profiles makes use of these awesome software technologies and libraries:

- [PowerShell](https://microsoft.com/PowerShell)
- [SharpDX](https://github.com/sharpdx/SharpDX)
- [SharpGenTools](https://github.com/SharpGenTools/SharpGenTools)
- [Vortice.Windows](https://github.com/amerkoleci/Vortice.Windows)

## ⚖️ License

[CC0 1.0 Universal](LICENSE)

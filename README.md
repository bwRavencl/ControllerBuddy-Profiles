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
  - To start a script, run:
    ```sh
    WINEDEBUG='-all' wine pwsh Configure.ps1
    ```
  - Since the uinput devices created by ControllerBuddy are not persistent, it is necessary to start Local or Client mode before running a script.
- If there is **no** `Configure.ps1` script for the application, you will need to apply the required configuration changes manually.  
Typically, this involves editing the application's configuration files based on the provided reference files.
- For applications running inside **DOSBox**, configure the `[joystick]` section of your `dosbox.conf` follows:
  ```
  [joystick]

  joysticktype                = 4axis_2
  timed                       = false
  autofire                    = false
  swap34                      = false
  buttonwrap                  = false

  # For DOSBox Staging additionally set:
  circularinput               = false
  deadzone                    = 0
  use_joy_calibration_hotkeys = false
  joy_x_calibration           = auto
  joy_y_calibration           = auto
  ```

  **On Linux**:
    - Set `joysticktype = 4axis` instead.
    - Use the `SDL_JOYSTICK_DEVICE` environment variable to ensure DOSBox picks up the correct joystick device.

      For example, if the 'ControllerBuddy Joystick' device appears as `/dev/input/js1`, launch DOSBox like this:
      ```sh
      SDL_JOYSTICK_DEVICE=/dev/input/js1 dosbox
      ```

## 🙏 Attribution

ControllerBuddy-Profiles makes use of these awesome software technologies and libraries:

- [PowerShell](https://microsoft.com/PowerShell)
- [SharpDX](https://github.com/sharpdx/SharpDX)
- [SharpGenTools](https://github.com/SharpGenTools/SharpGenTools)
- [Vortice.Windows](https://github.com/amerkoleci/Vortice.Windows)

## ⚖️ License

[CC0 1.0 Universal](LICENSE)

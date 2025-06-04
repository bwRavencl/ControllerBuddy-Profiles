# ControllerBuddy-Profiles

## 📖 Description

This repository contains a collection of profiles for the gamepad mapping software [ControllerBuddy](https://controllerbuddy.org).

All profiles have been created by the author of ControllerBuddy and target a variety of flight simulators.  
Please note that these profiles are constantly being updated and may change significantly over time.

## 🗣️ Instructions

The `.json` files in this repository represent profiles that ControllerBuddy can load directly.

Before a profile can be used, it is necessary to configure the application's input settings to ensure compatibility with the profile.

### ⚙️ Configuring Applications

Each supported application has its own subdirectory within the `configs` directory. Inside each subdirectory, you will find the necessary files to configure the application for use with ControllerBuddy.

Each subdirectory can contain one of the following:
- A PowerShell script (`Configure.ps1`)
- Configuration files (e.g., `.ini`, `.cfg`, etc.)
- Screenshots

#### 📜 PowerShell Script

A `Configure.ps1` file is a PowerShell script that automatically configures the application settings for usage with the corresponding ControllerBuddy profile.

**Warning:** Use these scripts at your own risk!  
These scripts modify the application's input settings. Please back up your settings before executing them.

**Notes:**
- The scripts are not self-contained and must be run from the original directory where they reside.
- Make sure that your gamepad is connected before running a script.
- The scripts are compatible with both Windows PowerShell 5.1 and [PowerShell 7+](https://github.com/PowerShell/PowerShell).

**Usage on Linux with Wine:**
- A working installation of PowerShell 7+ within the corresponding Wine prefix is required.
- Since the uinput devices created by ControllerBuddy are non-persistent, Local or Client mode must be started before executing a script.
- To execute a script, run:
  ```sh
  WINEDEBUG='-all' wine pwsh Configure.ps1
  ```

#### 📄 Configuration Files

The provided configuration files typically contain only part(s) of the application's entire configuration, such as the input settings. These parts need to be manually added to the application's actual configuration file(s).

#### 🖼️ Screenshots

The screenshots illustrate the necessary steps for manually configuring the application, such as where to find and modify the input settings. They should be self-explanatory.

### 📺 Usage with DOSBox

For legacy applications running inside **DOSBox**, configure the `[joystick]` section of your `dosbox.conf` as follows:
```
[joystick]

joysticktype                = 4axis_2
timed                       = false
autofire                    = false
swap34                      = false
buttonwrap                  = false

# The following settings apply only for DOSBox Staging
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

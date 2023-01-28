## ControllerBuddy-Profiles

#### Description:
This repository contains a collection of profiles for the [ControllerBuddy](https://controllerbuddy.org) gamepad mapping software.

All profiles were created by the author of ControllerBuddy and target a variety of flight simulators.  
Please note that these profiles are constantly updated and may change significantly over time.

#### Instructions:
- The `.json` files are ControllerBuddy profile files and can be loaded with said application.
- Inside the `configs` subfolder are game configuration files for use with the aforementioned profiles.
- For some applications inside the `configs` subfolder you will find a PowerShell script named `Configure.ps1`, which will automatically modify the settings of said application in order to work with the corresponding ControllerBuddy profile.  
**Warning:** Use these scripts at your own risk! They will modify the application's input settings. Backup your settings if required.
- If there is no `Configure.ps1` script for the application, you will have to apply the necessary settings changes manually.
- If you are using a controller that is not a DualShock 4 or Dual Sense you will also need to manually configure the application to ignore all inputs from your physical controller to prevent potential interferences with the input coming via ControllerBuddy and vJoy.

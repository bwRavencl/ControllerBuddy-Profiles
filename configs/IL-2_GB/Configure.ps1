Write-Output "Configuring IL-2 Sturmovik Great Battles for use with ControllerBuddy-Profiles...`n"

Set-Variable CurrentResponsesFileContent -Option Constant -Value 'type4Devices=actionId%2ChighValuesDeadZone%2ClowValuesDeadZone&type2Devices=actionId%2ChighValuesDeadZone%2ClowValuesDeadZone%7C%0D%0Arpc_all_engines_throttles%2C0%2C0&type3Devices=actionId%2CcenterDeadZone%2CpitchShift%2CsensitivityBallance%2CsideDeadZone%7C%0D%0Arpc_pitch%2C0.05%2C0%2C0.5%2C0&type1Devices=actionId%2CcenterDeadZone%2CsensitivityBallance%2CsideDeadZone%7C%0D%0Arpc_yaw%2C0.06%2C0.45%2C0%7C%0D%0Arpc_pitch%2C0.03%2C0.3%2C0%7C%0D%0Arpc_roll%2C0.05%2C0.3%2C0%7C%0D%0Abc_head_pitch%2C0%2C0%2C0%7C%0D%0Acam_rotate_pitch%2C0%2C0%2C0%7C%0D%0Acam_rotate_yaw%2C0%2C0%2C0a'

Set-Variable GlobalActionsFileContent -Option Constant -Value @'
// Input map preset.
// It is not recommended to change anything here,
// but it is still possible on your own risk.
 
&actions=action,command,invert|
screenshot,                                       key_sysrq,                                        0| // Make a screenshot
timepause,                                        key_p,                                            0| // Game pause on/off
timefaster,                                       key_rbracket,                                     0| // Accelerate time in mission
timeslower,                                       key_lbracket,                                     0| // Decelerate time in mission
record,                                           key_lcontrol+key_r,                               0| // Enables/disables flight recording
fps_counter,                                      key_back,                                         0| // FPS counter toggle
escape,                                           key_escape,                                       0| // Show/hide ESC menu
lobby,                                            key_tab,                                          0| // Lobby
missionbriefing,                                  key_o,                                            0| // Show/hide mission briefing
switchmap,                                        key_m,                                            0| // Change ingame map mode
switchgauges,                                     key_i,                                            0| // Show/hide instrument panel, navigation and map markers
aiminghelp,                                       key_rcontrol+key_i,                               0| // Aiming help
chattoall,                                        key_return,                                       0| // Send chat messages to all
chattofriendly,                                   key_rcontrol+key_return,                          0| // Send chat messages to friendly
hidehud,                                          key_h,                                            0| // Show/hide entire HUD
commandmenu,                                      key_grave,                                        0| // Command menu
ipdinc,                                           key_lshift+key_add,                               0| // +IPD correction for fixed IPD HMDs (directly shifts the VR image)
ipddec,                                           key_lshift+key_numpadenter,                       0| // -IPD correction for fixed IPD HMDs (directly shifts the VR image)
cam_reset,                                        key_numpad5,                                      0| // Reset camera
cam_ext_free_reset,                               key_c,                                            0| // Reset external free camera
cam_free_slow_mode,                               key_numpad0,                                      0| // Free camera - slow mode
cam_zoom,                                         key_add/key_subtract,                             0| // Camera zoom
cam_zoom,                                         mouse_axis_z,                                     0|
cam_rotate_pitch,                                 key_numpad2/key_numpad8,                          0| // Rotate camera up/down
cam_rotate_pitch,                                 mouse_axis_y,                                     0|
cam_rotate_pitch,                                 joy0_axis_s,                                      0|
cam_rotate_yaw,                                   key_numpad6/key_numpad4,                          0| // Rotate camera left/right
cam_rotate_yaw,                                   mouse_axis_x,                                     0|
cam_rotate_yaw,                                   joy0_axis_w,                                      0|
cam_rotate_ext_pitch,                             key_lshift+mouse_axis_y,                          0| // Camera local rotation up/down
cam_rotate_ext_yaw,                               key_lshift+mouse_axis_x,                          0| // Camera local rotation left/right
cam_trans_fb,                                     key_w/key_s,                                      0| // Move free camera forward/backward
cam_trans_fb,                                     mouse_b1+mouse_axis_y,                            0|
cam_trans_lr,                                     key_d/key_a,                                      0| // Move free camera left/right
cam_trans_lr,                                     mouse_b1+mouse_axis_x,                            0|
cam_trans_ud,                                     key_r/key_f,                                      0| // Move free camera up/down
cam_trans_ud,                                     mouse_b1+mouse_axis_z,                            0|
cam_switch_cockpitview_self,                      key_f1,                                           0| // Camera: player cockpit
cam_switch_default_opposite,                      key_lcontrol+key_f12,                             0| // Camera operator: enemy
cam_switch_default_order,                         key_f12,                                          0| // Camera operator: friendly
cam_switch_ext_chase_allied_air,                  key_rshift+key_f8,                                0| // Camera padlock: friendly aircraft
cam_switch_ext_chase_enemy_air,                   key_f8,                                           0| // Camera padlock: enemy aircraft
cam_switch_ext_chase_enemy_air_danger,            key_rcontrol+key_f8,                              0| // Camera padlock: close aircraft
cam_switch_ext_chase_allied_land,                 key_rshift+key_f7,                                0| // Camera padlock: friendly ground units
cam_switch_ext_chase_enemy_land,                  key_rcontrol+key_f7,                              0| // Camera padlock: enemy ground units
cam_switch_sight_target,                          key_lcontrol+key_f4,                              0| // Camera: combat camera
cam_switch_sight_target,                          key_f4,                                           0|
cam_switch_ext_free_self,                         key_f2,                                           0| // External free camera at player plane
cam_switch_ext_free_allied,                       key_lshift+key_f2,                                0| // External free camera at friendly aircraft
cam_switch_ext_free_enemy,                        key_lcontrol+key_f2,                              0| // External free camera at enemy aircraft
cam_switch_ext_free_land_all,                     key_f5,                                           0| // External free camera at ground units
cam_switch_ext_free_land_allied,                  key_lshift+key_f5,                                0| // External free camera at friendly ground units
cam_switch_ext_free_land_enemy,                   key_lcontrol+key_f5,                              0| // External free camera at enemy ground units
cam_switch_ext_free_bomb_all,                     key_f6,                                           0| // External free camera at bombs
cam_switch_ext_free_bomb_allied,                  key_lshift+key_f6,                                0| // External free camera at friendly bombs
cam_switch_ext_free_bomb_enemy,                   key_lcontrol+key_f6,                              0| // External free camera at enemy bombs
cam_switch_flyby_target,                          key_f3,                                           0| // Camera: flyby
cam_switch_free,                                  key_f11,                                          0| // Camera: free
cam_switch_gopro,                                 key_lmenu+key_f2,                                 0| // Switch to attached cameras
cam_switch_track,                                 key_lcontrol+key_f1,                              0| // Camera: track
cam_switch_head_free,                             key_lmenu+key_f1,                                 0| // Camera: head-unlinked cockpit
freelook,                                         mouse_b1,                                         0| // FreeLook
bc_head_zoom,                                     key_lshift+mouse_axis_z,                          0| // Pilot head: zoom
bc_head_zoom,                                     mouse_axis_z,                                     0|
bc_head_cfovi,                                    key_add,                                          0| // Pilot head: zoom in
bc_head_cfovo,                                    key_subtract,                                     0| // Pilot head: zoom out
bc_head_cfovr,                                    key_multiply,                                     0| // Pilot head: reset zoom
bc_head_fov0,                                     key_rcontrol+key_decimal,                         0| // Quick zoom: minimum
bc_head_fov1,                                     key_rcontrol+key_numpad1,                         0| // Quick zoom: level 1
bc_head_fov2,                                     key_rcontrol+key_numpad2,                         0| // Quick zoom: level 2
bc_head_fov3,                                     key_rcontrol+key_numpad3,                         0| // Quick zoom: level 3
bc_head_fov4,                                     key_rcontrol+key_numpad0,                         0| // Quick zoom: maximum
rb_zoom,                                          key_lshift+mouse_axis_z,                          0| // Change veh turret zoom
rb_zoom,                                          mouse_axis_z,                                     0|
mc_zoom,                                          key_lshift+mouse_axis_z,                          0| // Change veh zoom
mc_zoom,                                          key_rmenu+mouse_axis_z,                           0|
bc_head_pitch,                                    mouse_axis_y,                                     0| // Bow pilot head vertically
bc_head_pitch,                                    joy0_axis_s,                                      0|
bc_head_pitch,                                    mouse_axis_y+mouse_b1,                            0|
bc_head_yaw,                                      mouse_axis_x,                                     0| // Turn pilot head horizontally
bc_head_yaw,                                      joy0_axis_w,                                      0|
bc_head_yaw,                                      mouse_axis_x+mouse_b1,                            0|
bc_head_yaw_wrapped,                              mouse_axis_x,                                     0| // Turn gunner's head horizontally
resethmd,                                         ,                                                 0| // Default VR view
bc_head_cvmodes,                                  key_f9,                                           0| // Change pilot head control method: centered snap - fixed snap - additive snap - pan view
bc_head_cvss,                                     key_f10,                                          0| // Save current corrections in head snap position
bc_head_cvc,                                      key_numpad5,                                      0| // Pilot head snap position: center
bc_head_cvu,                                      key_numpad0,                                      0| // Pilot head snap position modifier: upper
bc_head_cvd,                                      key_numpadenter,                                  0| // Pilot head snap position modifier: lower
bc_head_cva,                                      key_decimal,                                      0| // Pilot head snap position modifier: custom
bc_head_cv0,                                      key_numpad8,                                      0| // Pilot head snap position: forward
bc_head_cv45,                                     key_numpad9,                                      0| // Pilot head snap position: forward-right
bc_head_cv90,                                     key_numpad6,                                      0| // Pilot head snap position: right
bc_head_cv135,                                    key_numpad3,                                      0| // Pilot head snap position: backward-right
bc_head_cv180,                                    key_numpad2,                                      0| // Pilot head snap position: backward
bc_head_cv225,                                    key_numpad1,                                      0| // Pilot head snap position: backward-left
bc_head_cv270,                                    key_numpad4,                                      0| // Pilot head snap position: left
bc_head_cv315,                                    key_numpad7,                                      0| // Pilot head snap position: forward-left
bc_head_pos,                                      key_lcontrol+mouse_axis_z,                        0| // Switch veh turret sight position
bc_head_cvmf,                                     key_insert,                                       0| // Move pilot head forward
bc_head_cvmb,                                     key_home,                                         0| // Move pilot head backward
bc_head_cvml,                                     key_delete,                                       0| // Move pilot head left
bc_head_cvmr,                                     key_end,                                          0| // Move pilot head right
bc_head_cvmu,                                     key_prior,                                        0| // Move pilot head up
bc_head_cvmd,                                     key_next,                                         0| // Move pilot head down
cam_turret_pitch_center,                          key_numpad5,                                      0| // Turret, gunsight view: reset vertical view to gunsight
cam_turret_pitch,                                 ,                                                 0| // Turret, gunsight view: view vertical
cam_turret_yaw_center,                            key_numpad5,                                      0| // Turret, gunsight view: reset horizontal view to gunsight
cam_turret_yaw,                                   ,                                                 0| // Turret, gunsight view: view horizontal
cam_rotate_hf_yaw,                                mouse_axis_x,                                     0| // Head independent view left/right
cam_rotate_hf_pitch,                              mouse_axis_y,                                     0| // Head independent view up/down
cam_rotate_hf_yaw_center,                         key_numpad5,                                      0| // Center head independent view horizontally
cam_rotate_hf_pitch_center,                       key_numpad5,                                      0| // Center head independent view vertically
autopilot,                                        key_a,                                            0| // AI-autopilot on/off
autolevelflight,                                  key_lshift+key_a,                                 0| // AI-autopilot for level flight: on/off
autolevelflight,                                  joy0_b9,                                          0|
autolevelflight_to_left,                          key_lshift+key_z,                                 0| // Level flight AI-autopilot: left turn
autolevelflight_to_right,                         key_lshift+key_x,                                 0| // Level flight AI-autopilot: right turn
rpc_pitch,                                        key_down/key_up,                                  0| // Plane control: pitch
rpc_pitch,                                        key_rshift+mouse_axis_y,                          0|
rpc_pitch,                                        joy0_axis_y,                                      0|
rpc_roll,                                         key_right/key_left,                               0| // Plane control: roll
rpc_roll,                                         key_rshift+mouse_axis_x,                          0|
rpc_roll,                                         joy0_axis_x,                                      0|
rpc_yaw,                                          key_x/key_z,                                      0| // Plane control: yaw
rpc_yaw,                                          joy0_axis_t,                                      0|
yaw_reset,                                        key_d,                                            0| // Plane control: yaw reset
rpc_yaw_trim,                                     key_lcontrol+key_x/key_lcontrol+key_z,            0| // Rudder trim axis
rpc_yaw_trim,                                     joy0_b30/joy0_b29,                                0|
yaw_trim_switch_left,                             key_lcontrol+key_z,                               0| // Rudder trim switch: left
yaw_trim_switch_left,                             joy0_b29,                                         0|
yaw_trim_switch_right,                            key_lcontrol+key_x,                               0| // Rudder trim switch: right
yaw_trim_switch_right,                            joy0_b30,                                         0|
rpc_pitch_trim,                                   key_rcontrol+key_down/key_rcontrol+key_up,        0| // Elevator trim axis
rpc_pitch_trim,                                   joy0_b26/joy0_b25,                                0|
pitch_trim_switch_up,                             key_rcontrol+key_down,                            0| // Elevator trim switch: up
pitch_trim_switch_up,                             joy0_b26,                                         0|
pitch_trim_switch_dn,                             key_rcontrol+key_up,                              0| // Elevator trim switch: down
pitch_trim_switch_dn,                             joy0_b25,                                         0|
rpc_roll_trim,                                    key_rcontrol+key_right/key_rcontrol+key_left,     0| // Aileron trim axis
rpc_roll_trim,                                    joy0_b28/joy0_b27,                                0|
roll_trim_switch_left,                            key_rcontrol+key_left,                            0| // Aileron trim switch: left
roll_trim_switch_left,                            joy0_b27,                                         0|
roll_trim_switch_right,                           key_rcontrol+key_right,                           0| // Aileron trim switch: right
roll_trim_switch_right,                           joy0_b28,                                         0|
trims_reset,                                      key_lcontrol+key_t,                               0| // Reset trimmers
trims_reset,                                      joy0_b31,                                         0|
rpc_adjustable_stabilizer,                        key_rshift+key_down/key_rshift+key_up,            0| // Adjustable stabilizer axis
rpc_adjustable_stabilizer,                        joy0_b26/joy0_b25,                                0|
adjustable_stabilizer_up,                         key_rshift+key_down,                              0| // Adjustable stabilizer switch: pitch up
adjustable_stabilizer_up,                         joy0_b26,                                         0|
adjustable_stabilizer_dn,                         key_rshift+key_up,                                0| // Adjustable stabilizer switch: pitch down
adjustable_stabilizer_dn,                         joy0_b25,                                         0|
flaps_up,                                         key_lshift+key_f,                                 0| // Flaps up
flaps_up,                                         joy0_b14,                                         0|
flaps_dn,                                         key_f,                                            0| // Flaps down
airbrakes,                                        key_rmenu+key_b,                                  0| // AirBrakes on/off
airbrakes,                                        joy0_b5,                                          0|
airbrakes_on,                                     ,                                                 0| // AirBrakes on
airbrakes_off,                                    ,                                                 0| // AirBrakes off
attacksiren,                                      key_lmenu+key_s,                                  0| // Attack Siren on/off
attacksiren_on,                                   ,                                                 0| // Attack Siren on
attacksiren_off,                                  ,                                                 0| // Attack Siren off
windscreenwipers,                                 key_lmenu+key_w,                                  0| // Windscreen Wipers on/off
divesystem,                                       key_lcontrol+key_d,                               0| // Dive recovery system: on/off
gear,                                             key_g,                                            0| // Gear up/down
gear_up,                                          key_lmenu+key_g,                                  0| // Gear up
gear_dn,                                          key_lcontrol+key_g,                               0| // Gear down
tailwheel_lock,                                   key_lshift+key_g,                                 0| // Tail wheel lock/unlock
tailwheel_lock,                                   joy0_b4,                                          0|
tailwheel_lock_on,                                ,                                                 0| // Tail wheel lock
tailwheel_lock_off,                               ,                                                 0| // Tail wheel unlock
rpc_wheel_brakes,                                 key_slash,                                        0| // Wheel brakes
rpc_wheel_brakes_left,                            key_comma,                                        0| // Left wheel brakes
rpc_wheel_brakes_right,                           key_period,                                       0| // Right wheel brakes
rpc_wheel_brakes_central,                         key_rwin+key_slash,                               0| // Nose/tail wheel brakes
parking_brakes,                                   key_lshift+key_slash,                             0| // Wheels parking brakes on/off
parking_brakes,                                   joy0_b16,                                         0|
parking_brakes_on,                                ,                                                 0| // Wheels parking brakes on
parking_brakes_off,                               ,                                                 0| // Wheels parking brakes off
drogue_chute,                                     key_lmenu+key_d,                                  0| // Drogue chute: release/drop
canopy_open_close,                                key_rmenu+key_c,                                  0| // Canopy open/close
canopy_open_close,                                joy0_b15,                                         0|
canopy_open,                                      ,                                                 0| // Canopy open
canopy_close,                                     ,                                                 0| // Canopy close
window_open_close,                                key_lwin+key_c,                                   0| // Window open/close (Ar 234 B-2: mirrors fold/unfold)
landing_lights,                                   key_rshift+key_l,                                 0| // Landing lights on/off
navigation_lights,                                key_rcontrol+key_l,                               0| // Navigation lights on/off
cockpit_lights,                                   key_l,                                            0| // Cockpit light on/off
formation_lights,                                 key_rmenu+key_l,                                  0| // Formation lights on/off
autopilot_device,                                 key_rmenu+key_a,                                  0| // Autopilot on/off
autopilot_yaw,                                    key_rmenu+key_y,                                  0| // Autopilot yaw channel on/off
autopilot_pitch,                                  key_rmenu+key_p,                                  0| // Autopilot pitch channel on/off
autopilot_roll,                                   key_rmenu+key_r,                                  0| // Autopilot roll channel on/off
autopilot_yaw_trim_switch_left,                   key_rmenu+key_left,                               0| // Autopilot yaw channel trim: left
autopilot_yaw_trim_switch_right,                  key_rmenu+key_right,                              0| // Autopilot yaw channel trim: right
rpc_autopilot_pitch_trim,                         key_rmenu+key_down/key_rmenu+key_up,              0| // Autopilot pitch channel trim axis
autopilot_pitch_trim_switch_up,                   key_rmenu+key_up,                                 0| // Autopilot pitch channel trim switch: up
autopilot_pitch_trim_switch_dn,                   key_rmenu+key_down,                               0| // Autopilot pitch channel trim switch: down
rpc_autopilot_roll_trim,                          key_rshift+key_right/key_rshift+key_left,         0| // Autopilot roll channel trim axis
autopilot_roll_trim_switch_left,                  key_rshift+key_left,                              0| // Autopilot roll channel trim switch: left
autopilot_roll_trim_switch_right,                 key_rshift+key_right,                             0| // Autopilot roll channel trim switch: right
autopilot_trims_reset,                            key_rshift+key_a,                                 0| // Autopilot trim reset
set_altimeter_reference_pressure,                 key_lmenu+key_a,                                  0| // Altimeter: reference pressure toggle
contact_altimeter_target_altitude_increase,       key_rshift+key_k,                                 0| // Contact altimeter: target altitude increase
contact_altimeter_target_altitude_decrease,       key_rcontrol+key_k,                               0| // Contact altimeter: target altitude decrease
radio_volume_decrease,                            key_lmenu+key_subtract,                           0| // Radio receiver volume: decrease
radio_volume_increase,                            key_lmenu+key_add,                                0| // Radio receiver volume: increase
switch_radio_channel,                             ,                                                 0| // Switch radio channel (allies/enemies)
bc_eject,                                         key_lcontrol+key_e,                               0| // Eject
bc_eject,                                         joy0_b3,                                          0|
autoaltitudinalcorrection,                        key_lshift+key_m,                                 0| // Automatic mixtures and superchargers control
autoradiators,                                    key_lshift+key_r,                                 0| // Automatic radiators control
autorpmlimiter,                                   key_lshift+key_n,                                 0| // Automatic RPM limiter
all_engines_switch,                               key_e,                                            0| // Engage engines start procedure / Stop engine
all_engines_ignition,                             key_rshift+key_e,                                 0| // Engines ignition (Me 262)
engine_blip_switch,                               key_lshift+key_e,                                 0| // Engine blip switch (ignition interruption)
engine_blip_switch,                               joy0_b7,                                          0|
rpc_all_engines_throttles,                        key_equals/key_minus,                             0| // Engines throttle control
rpc_all_engines_throttles,                        joy0_axis_z,                                      1|
rpc_all_engines_mixtures,                         key_rmenu+key_equals/key_rmenu+key_minus,         0| // Engines mixture control
rpc_all_engines_mixtures,                         joy0_axis_q,                                      1|
all_engines_superchargers,                        key_lshift+key_s,                                 0| // Engine superchargers mode switch
all_engines_superchargers,                        joy0_b18,                                         0|
all_engines_superchargers_higher,                 ,                                                 0| // Engine superchargers higher gear switch
all_engines_superchargers_lower,                  ,                                                 0| // Engine superchargers lower gear switch
rpc_all_engines_turbosuperchargers,               key_t+key_equals/key_t+key_minus,                 0| // Engines turbosupercharger control
rpc_all_engines_turbosuperchargers,               joy0_b33/joy0_b34,                                0|
all_engines_boost,                                key_lshift+key_b,                                 0| // Switch engines boost: on/off
all_engines_boost,                                joy0_b17,                                         0|
all_engines_boost_on,                             ,                                                 0| // Switch engines boost: on
all_engines_boost_off,                            ,                                                 0| // Switch engines boost: off
rpc_all_engines_props_pitch,                      key_rshift+key_equals/key_rshift+key_minus,       0| // Propeller RPM control
rpc_all_engines_props_pitch,                      joy0_axis_p,                                      1|
rpc_all_engines_props_pitch,                      joy0_b23/joy0_b24,                                0|
all_engines_props_pitch_control_mode,             key_rshift+key_p,                                 0| // Switch propellers pitch control mode: manual/auto
all_engines_props_pitch_control_mode,             joy0_b2,                                          0|
all_engines_props_pitch_increase,                 key_rshift+key_equals,                            0| // Propellers: high pitch
all_engines_props_pitch_increase,                 joy0_b24,                                         0|
all_engines_props_pitch_decrease,                 key_rshift+key_minus,                             0| // Propellers: low pitch
all_engines_props_pitch_decrease,                 joy0_b23,                                         0|
all_engines_props_feathering,                     key_lcontrol+key_f,                               0| // Propellers feathering: on/off
all_engines_props_feathering_on,                  ,                                                 0| // Propellers feathering: on
all_engines_props_feathering_off,                 ,                                                 0| // Propellers feathering: off
rpc_all_engines_oil_radiators_shutters,           key_lwin+key_equals/key_lwin+key_minus,           0| // Oil radiators shutters control axis
rpc_all_engines_oil_radiators_shutters,           joy0_b13/joy0_b12,                                0|
all_engines_oil_radiators_control_mode,           key_rwin+key_r,                                   0| // Switch oil radiators control mode: manual/auto
all_engines_oil_radiators_open,                   key_lwin+key_equals,                              0| // He-111, Bf-110 oil radiators: open one step
all_engines_oil_radiators_open,                   joy0_b13,                                         0|
all_engines_oil_radiators_close,                  key_lwin+key_minus,                               0| // He-111, Bf-110 oil radiators: close one step
all_engines_oil_radiators_close,                  joy0_b12,                                         0|
rpc_all_engines_water_radiators_shutters,         key_rcontrol+key_equals/key_rcontrol+key_minus,   0| // Water radiators shutters control axis
rpc_all_engines_water_radiators_shutters,         joy0_b11/joy0_b10,                                0|
all_engines_water_radiators_control_mode,         key_rshift+key_r,                                 0| // Switch water radiators control mode: manual/auto
all_engines_water_radiators_control_mode,         joy0_b6,                                          0|
all_engines_water_radiators_open,                 key_rcontrol+key_equals,                          0| // Bf-109/110 and British aircraft water radiator: open
all_engines_water_radiators_open,                 joy0_b11,                                         0|
all_engines_water_radiators_close,                key_rcontrol+key_minus,                           0| // Bf-109/110 and British aircraft water radiator: close
all_engines_water_radiators_close,                joy0_b10,                                         0|
rpc_all_engines_in_cowls_shutters,                key_lcontrol+key_equals/key_lcontrol+key_minus,   0| // Engines inlet cowl shutters control (I-16, La-5, Ju 52), Engines upper cowl flaps (A-20), Engines intercooler shutter (P-47)
rpc_all_engines_in_cowls_shutters,                joy0_b22/joy0_b21,                                0|
rpc_all_engines_out_cowls_shutters,               key_lmenu+key_equals/key_lmenu+key_minus,         0| // Engines outlet cowl shutters control (A-20, Fw 190 A-5, A-6, A-8, La-5, Ju 88, P-40, P-47, C-47, IAR80)
rpc_all_engines_out_cowls_shutters,               joy0_b20/joy0_b19,                                0|
all_engines_out_cowl_shutters_control_mode,       key_lmenu+key_o,                                  0| // Switch outlet cowl shutters control mode: manual/auto
select_all_engines,                               key_0,                                            0| // Switch common control of engines on/off
select_engine_1,                                  key_1,                                            0| // Switch engine 1 control on/off
select_engine_2,                                  key_2,                                            0| // Switch engine 2 control on/off
select_engine_3,                                  key_3,                                            0| // Switch engine 3 control on/off
engine_1_switch,                                  key_rcontrol+key_1,                               0| // Engage engine 1 start procedure / Stop engine
engine_1_ignition,                                key_rshift+key_numpad1,                           0| // Engine 1 ignition (Me 262)
engine_1_prop_feathering,                         ,                                                 0| // Engine 1 propeller: feathering: on/off
engine_1_prop_feathering_on,                      ,                                                 0| // Engine 1 propeller: feathering: on
engine_1_prop_feathering_off,                     ,                                                 0| // Engine 1 propeller: feathering: off
rpc_engine_1_throttle,                            ,                                                 0| // Engine 1 throttle control
rpc_engine_1_altitude_throttle,                   ,                                                 0| // Fokker D.VIIF engine: altitude throttle control
rpc_engine_1_mixture,                             ,                                                 0| // Engine 1 mixture control
engine_1_supercharger,                            ,                                                 0| // Engine 1 supercharger mode switch
rpc_engine_1_turbosupercharger,                   ,                                                 0| // Engine 1 turbosupercharger control
engine_1_boost,                                   ,                                                 0| // Engine 1 boost switch: on/off
engine_1_boost_on,                                ,                                                 0| // Engine 1 boost switch: on
engine_1_boost_off,                               ,                                                 0| // Engine 1 boost switch: off
rpc_engine_1_prop_pitch,                          ,                                                 0| // Engine 1 propeller RPM control
engine_1_prop_pitch_control_mode,                 ,                                                 0| // Engine 1 propeller pitch control mode switch: manual/auto
engine_1_prop_pitch_increase,                     ,                                                 0| // Engine 1 propeller: manual high pitch
engine_1_prop_pitch_decrease,                     ,                                                 0| // Engine 1 propeller: manual low pitch
rpc_engine_1_oil_radiator_shutter,                ,                                                 0| // Engine 1 oil radiator shutters control
rpc_engine_1_water_radiator_shutter,              ,                                                 0| // Engine 1 water radiator shutters control
rpc_engine_1_in_cowl_shutter,                     ,                                                 0| // Engine 1 inlet cowl shutters control
rpc_engine_1_out_cowl_shutter,                    ,                                                 0| // Engine 1 outlet cowl shutters control
engine_2_switch,                                  key_rcontrol+key_2,                               0| // Engage engine 2 start procedure / Stop engine
engine_2_ignition,                                key_rshift+key_numpad2,                           0| // Engine 2 ignition (Me 262)
engine_2_prop_feathering,                         ,                                                 0| // Engine 2 propeller: feathering: on/off
engine_2_prop_feathering_on,                      ,                                                 0| // Engine 2 propeller: feathering: on
engine_2_prop_feathering_off,                     ,                                                 0| // Engine 2 propeller: feathering: off
rpc_engine_2_throttle,                            ,                                                 0| // Engine 2 throttle control
rpc_engine_2_mixture,                             ,                                                 0| // Engine 2 mixture control
engine_2_supercharger,                            ,                                                 0| // Engine 2 supercharger mode switch
rpc_engine_2_turbosupercharger,                   ,                                                 0| // Engine 2 turbosupercharger control
engine_2_boost,                                   ,                                                 0| // Engine 2 boost switch: on/off
engine_2_boost_on,                                ,                                                 0| // Engine 2 boost switch: on
engine_2_boost_off,                               ,                                                 0| // Engine 2 boost switch: off
rpc_engine_2_prop_pitch,                          ,                                                 0| // Engine 2 propeller RPM control
engine_2_prop_pitch_control_mode,                 ,                                                 0| // Engine 2 propeller pitch control mode switch: manual/auto
engine_2_prop_pitch_increase,                     ,                                                 0| // Engine 2 propeller: manual high pitch
engine_2_prop_pitch_decrease,                     ,                                                 0| // Engine 2 propeller: manual low pitch
rpc_engine_2_oil_radiator_shutter,                ,                                                 0| // Engine 2 oil radiator shutters control
rpc_engine_2_water_radiator_shutter,              ,                                                 0| // Engine 2 water radiator shutters control
rpc_engine_2_in_cowl_shutter,                     ,                                                 0| // Engine 2 inlet cowl shutters control
rpc_engine_2_out_cowl_shutter,                    ,                                                 0| // Engine 2 outlet cowl shutters control
engine_3_switch,                                  key_rcontrol+key_3,                               0| // Engage engine 3 start procedure / Stop engine
rpc_engine_3_throttle,                            ,                                                 0| // Engine 3 throttle control
rpc_engine_3_mixture,                             ,                                                 0| // Engine 3 mixture control
rpc_engine_3_oil_radiator_shutter,                ,                                                 0| // Engine 3 oil radiator shutters control
rpc_engine_3_in_cowl_shutter,                     ,                                                 0| // Engine 3 inlet cowl shutters control
engine_interconnect_prop,                         key_lshift+key_i,                                 0| // Interconnect throttle and prop controls on/off
engine_interconnect_turbo,                        key_lmenu+key_i,                                  0| // Interconnect throttle and turbo controls on/off
jet_boosters,                                     key_r,                                            0| // Jet boosters
jettison_jet_boosters,                            key_lshift+key_d,                                 0| // Jettison jet boosters
select_fuel_selector,                             key_rshift+key_s,                                 0| // Switch to the next fuel selector
turn_fuel_selector,                               key_lcontrol+key_s,                               0| // Turn chosen fuel selector
select_fuel_pump,                                 key_lshift+key_p,                                 0| // Switch to the next fuel pump
switch_fuel_pump,                                 key_lcontrol+key_p,                               0| // Switch chosen fuel pump
fuel_dumping,                                     key_rshift+key_d,                                 0| // Fuel dumping
jettison_fueltank,                                key_rshift+key_f,                                 0| // Auxiliary fuel tank jettison
switch_fuel_indicator,                            key_rshift+key_i,                                 0| // Switch fuel indicator
toggle_refuel,                                    key_rcontrol+key_f,                               0| // Start/stop the refueling process (inside the service area)
all_guns_fire,                                    key_space,                                        0| // Fire all guns
weapon_group_1_fire,                              key_rmenu+key_space,                              0| // Fire weapon group 1
weapon_group_1_fire,                              key_rmenu+mouse_b0,                               0|
weapon_group_1_fire,                              joy0_b0,                                          0|
weapon_group_2_fire,                              key_lmenu+key_space,                              0| // Fire weapon group 2
weapon_group_2_fire,                              key_lmenu+mouse_b0,                               0|
weapon_group_2_fire,                              joy0_b1,                                          0|
weapon_group_3_fire,                              key_rcontrol+key_space,                           0| // Fire weapon group 3
weapon_group_3_fire,                              key_rcontrol+mouse_b0,                            0|
weapon_group_3_fire,                              joy0_b7,                                          0|
cam_switch_bombaim,                               key_v,                                            0| // Bomb sight
cam_switch_visor,                                 key_lshift+key_v,                                 0| // Nestle to the visor / Dive bomb sight
throw_bombs_mode,                                 key_lwin+key_b,                                   0| // Drop bombs mode toggle
throw_bombs_delay,                                key_lcontrol+key_b,                               0| // Drop bombs delay toggle
throw_bombs_command,                              key_b,                                            0| // Drop bombs, containers, paratroopers, emit smoke
launch_rockets_mode,                              key_lwin+key_r,                                   0| // Launch rockets mode toggle
launch_rockets_command,                           key_r,                                            0| // Launch rockets
jettison_stores_command,                          key_lshift+key_d,                                 0| // Jettison stores (CG-4A hook/unhook tow rope, C-47 unhook tow rope)
bombdoors_toggle,                                 key_n,                                            0| // Bomb bay doors toggle (IAR80 bomb release system switch, Li-2 side door)
bombdoors_open,                                   ,                                                 0| // Open bomb bay doors
bombdoors_close,                                  ,                                                 0| // Close bomb bay doors
bombsafety_toggle,                                key_lwin+key_s,                                   0| // Bombs safety switch
bombsafety_on,                                    ,                                                 0| // Bombs safety on
bombsafety_off,                                   ,                                                 0| // Bombs safety off
all_guns_reload,                                  key_lmenu+key_r,                                  0| // Reload all guns
all_guns_reload,                                  mouse_b2,                                         0|
all_guns_reload,                                  joy0_b8,                                          0|
bc_gun0,                                          key_lcontrol+key_grave,                           0| // Remove personal weapon / flare pistol
bc_gun1,                                          key_lcontrol+key_1,                               0| // Red flare
bc_gun2,                                          key_lcontrol+key_2,                               0| // Green flare
bc_gun3,                                          key_lcontrol+key_3,                               0| // White flare
bc_gun4,                                          key_lcontrol+key_4,                               0| // Personal gun
bc_gun5,                                          key_lcontrol+key_5,                               0| // Binoculars
bc_gunfire,                                       key_lcontrol+key_space,                           0| // Shoot personal weapon / flare pistol
bc_gunfire,                                       mouse_b0,                                         0|
switchpilot,                                      key_lcontrol+key_c,                               0| // Switch to a next free combat post
switchpilot,                                      joy0_b32,                                         0|
tc_guard,                                         key_lshift+key_c,                                 0| // Change firing position
switchgunpos0,                                    key_rshift+key_0,                                 0| // Switch to default position
switchgunpos1,                                    key_rshift+key_1,                                 0| // Switch to 1st firing point
switchgunpos2,                                    key_rshift+key_2,                                 0| // Switch to 2nd firing point
switchgunpos3,                                    key_rshift+key_3,                                 0| // Switch to 3rd firing point
switchgunpos4,                                    key_rshift+key_4,                                 0| // Switch to 4th firing point
switchgunpos5,                                    key_rshift+key_5,                                 0| // Switch to 5th firing point
switchgunpos6,                                    key_rshift+key_6,                                 0| // Switch to 6th firing point
switchgunpos7,                                    key_rshift+key_7,                                 0| // Switch to 7th firing point
switchgunpos8,                                    key_rshift+key_8,                                 0| // Switch to 8th firing point
switchgunpos9,                                    key_rshift+key_9,                                 0| // Switch to 9th firing point
tc_aiming,                                        key_t,                                            0| // Turret: take/leave control
cam_switch_turret,                                key_lshift+key_t,                                 0| // Turret: nestle to the gunsight
tc_fire,                                          mouse_b0,                                         0| // Fire primary turret guns
tc_fire_secondary,                                mouse_b1,                                         0| // Fire secondary turret guns
tc_reload,                                        key_lmenu+key_r,                                  0| // Reload turret guns
tc_reload,                                        mouse_b2,                                         0|
gunsight_filter,                                  key_lmenu+key_f,                                  0| // Gunsight filter toggle
gunsight_adjustment,                              key_rmenu+key_f,                                  0| // Gunsight position toggle
gunsight_mode,                                    key_lmenu+key_m,                                  0| // Gunsight mode toggle
gs_distance,                                      key_rmenu+key_period/key_rmenu+key_semicolon,     0| // Gunsight range adjustment / Bombsight: wind speed
gs_yaw,                                           key_rmenu+key_slash/key_rmenu+key_comma,          0| // Gunsight target size adjustment
gs_reset,                                         key_rmenu+key_apostrophe,                         0| // Gunsight reset
bs_wind_direction_left,                           key_rmenu+key_comma,                              0| // Bombsight: wind direction - left
bs_wind_direction_right,                          key_rmenu+key_slash,                              0| // Bombsight: wind direction - right
tc_visor_pitch,                                   key_rshift+key_period/key_rshift+key_semicolon,   0| // Gunsight vertical adjustment / Bombsight: target height
tc_visor_yaw,                                     key_rshift+key_slash/key_rshift+key_comma,        0| // Gunsight horizontal adjustment / Bombsight: plane true air speed
tc_visor_reset,                                   key_rshift+key_apostrophe,                        0| // Gunsight twist reset
tc_switchgun,                                     key_rmenu+key_g,                                  0| // Select ammunition
ai_turret_act_by_yourself,                        key_rmenu+key_1,                                  0| // Gunners: Fire at will
ai_turret_back_fire,                              key_rmenu+key_2,                                  0| // Gunners: Return fire
ai_turret_cease_fire,                             key_rmenu+key_3,                                  0| // Gunners: Cease fire
ai_turret_cease_heavy_fire,                       key_rmenu+key_4,                                  0| // Gunners: Cease heavy weapons fire
ai_turret_attack_balloons,                        key_rmenu+key_5,                                  0| // Gunners: Attack balloons
ai_turret_attack_ground,                          key_rmenu+key_6,                                  0| // Gunners: Attack ground targets
ai_turret_short_distance,                         key_rmenu+key_7,                                  0| // Gunners: Close engage distance
ai_turret_normal_distance,                        key_rmenu+key_8,                                  0| // Gunners: Normal engage distance
ai_turret_medium_distance,                        key_rmenu+key_9,                                  0| // Gunners: Far engage distance
toggle_rearm,                                     key_rcontrol+key_a,                               0| // Start/stop the rearming process (inside the service area)
bc_signal_stay_here,                              key_lcontrol+key_0,                               0| // Hold this position and wait
bc_signal_attack_nearest_air_target,              key_lmenu+key_1,                                  0| // Attack nearest air target
bc_signal_attack_nearest_ground_target,           key_lmenu+key_2,                                  0| // Attack nearest ground target
bc_signal_back_to_mission,                        key_lmenu+key_3,                                  0| // Return to our mission
bc_signal_do_like_me,                             key_lmenu+key_4,                                  0| // Do like me (copy my actions)
bc_signal_formation_column,                       key_lcontrol+key_6,                               0| // Formation column
bc_signal_formation_left_arrow,                   key_lcontrol+key_7,                               0| // Formation left edge
bc_signal_formation_right_arrow,                  key_lcontrol+key_8,                               0| // Formation right edge
bc_signal_formation_v,                            key_lcontrol+key_9,                               0| // Formation V
bc_signal_hold_formation,                         key_lmenu+key_5,                                  0| // Cover me
bc_signal_patrol,                                 key_lmenu+key_6,                                  0| // Patrol the area
bc_signal_patrol_air,                             key_lmenu+key_7,                                  0| // Patrol for air enemies
bc_signal_patrol_ground,                          key_lmenu+key_8,                                  0| // Patrol for ground enemies
bc_signal_return_to_base,                         key_lmenu+key_0,                                  0| // Return to base
bc_signal_attack,                                 key_lshift+key_1,                                 0| // Pilot gesture: Look ahead!
bc_signal_denote_enemy,                           key_lshift+key_2,                                 0| // Pilot gesture: Ok!
bc_signal_flap_to_head,                           key_lshift+key_3,                                 0| // Pilot gesture: Destroy!
vc_gas,                                           key_up/key_down,                                  0| // Vehicle Acceleration / Brake
vc_turn,                                          key_right/key_left,                               0| // Vehicle Turn left / Turn right
vc_gearup,                                        key_x,                                            0| // Gear limiter switch up
vc_geardown,                                      key_z,                                            0| // Gear limiter switch down
gunsight_power,                                   key_lmenu+key_l,                                  0| // Gunsight power toggle
tc_aim_x,                                         joy0_axis_x,                                      0| // Turret control: horizontal (direct mode)
tc_aim_x,                                         key_d/key_a,                                      0|
tc_aim_y,                                         joy0_axis_y,                                      0| // Turret control: vertical (direct mode)
tc_aim_y,                                         key_w/key_s,                                      0|
rb_pitch,                                         mouse_axis_y,                                     0| // inprb_pitch
rb_yaw,                                           mouse_axis_x,                                     0| // inprb_yaw
mc_pitch,                                         mouse_axis_y,                                     0| // inpmc_pitch
mc_yaw,                                           mouse_axis_x,                                     0| // inpmc_yaw
mc_pitch_free,                                    mouse_axis_y+mouse_b1,                            0| // inpmc_pitch_free
mc_yaw_free,                                      mouse_axis_x+mouse_b1,                            0| // inpmc_yaw_free
vc_engine_switch,                                 key_e,                                            0| // Engage engines start procedure / Stop engine
vc_brake,                                         key_space,                                        0| // inpvc_brake
cam_switch_mc_far,                                key_f4,                                           0| // inpcam_switch_mc_far
cam_switch_mc_close,                              key_f1,                                           0| // inpcam_switch_mc_close
ext_action1,                                      key_lwin+key_1,                                   0| // inpext_action1
ext_action1,                                      key_rwin+key_1,                                   0|
ext_action2,                                      key_lwin+key_2,                                   0| // inpext_action2
ext_action2,                                      key_rwin+key_2,                                   0|
ext_action3,                                      key_lwin+key_3,                                   0| // inpext_action3
ext_action3,                                      key_rwin+key_3,                                   0|
ext_action4,                                      key_lwin+key_4,                                   0| // inpext_action4
ext_action4,                                      key_rwin+key_4,                                   0|
ext_action5,                                      key_lwin+key_5,                                   0| // inpext_action5
ext_action5,                                      key_rwin+key_5,                                   0|
ext_action6,                                      key_lwin+key_6,                                   0| // inpext_action6
ext_action6,                                      key_rwin+key_6,                                   0|
ext_action7,                                      key_lwin+key_7,                                   0| // inpext_action7
ext_action7,                                      key_rwin+key_7,                                   0|
ext_action8,                                      key_lwin+key_8,                                   0| // inpext_action8
ext_action8,                                      key_rwin+key_8,                                   0|
ext_action9,                                      key_lwin+key_9,                                   0| // inpext_action9
ext_action9,                                      key_rwin+key_9,                                   0|
ext_action0,                                      key_lwin+key_0,                                   0| // inpext_action0
ext_action0,                                      key_rwin+key_0,                                   0|
cam_rotate_gopro_yaw,                             mouse_axis_x,                                     0| // inpcam_rotate_gopro_yaw
cam_rotate_gopro_yaw_center,                      key_numpad5,                                      0| // inpcam_rotate_gopro_yaw_center
gui_mouse_x,                                      mouse_axis_x,                                     0| // GUI action: mouse X axis
gui_mouse_y,                                      mouse_axis_y,                                     0| // GUI action: mouse Y axis
gui_mouse_z,                                      mouse_axis_z,                                     0| // GUI action: mouse scroll
gui_mouse_lb,                                     mouse_b0,                                         0| // GUI action mouse left button
gui_mouse_rb,                                     mouse_b1,                                         0| // GUI action mouse right button
gui_mouse_mb,                                     mouse_b2,                                         0| // GUI action mouse middle button
'@

Set-Variable GlobalPitchFileContent -Option Constant -Value 'type3Devices=actionId%2CcenterDeadZone%2CpitchShift%2CsensitivityBallance%2CsideDeadZone%7C%0D%0Arpc_pitch%2C0.05%2C0%2C0.5%2C0'

Set-Variable SnapsCfgFileContent -Option Constant -Value @'
DefaultSnapMode = "PV"
LineSpeed = 1.099
RotateSpeed = 6.034
FOVSpeed = 2.575
LineInert = 1.000
RotateInert = 1.000
FOVInert = 1.000
PANLineSpeed = 1.099
PANRotateSpeed = 6.034
PANFOVSpeed = 2.575
PANLineInert = 1.000
PANRotateInert = 1.000
PANFOVInert = 1.000

'@

Set-Variable UninstallRegistryKey -Option Constant -Value "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{66F649A9-0FA2-487E-BC0D-894BD7E89D5E}_is1"
Set-Variable InstallLocationRegistryValue -Option Constant -Value InstallLocation

$il2Dir = (Get-ItemPropertyValue -Path $UninstallRegistryKey -Name $InstallLocationRegistryValue -ErrorAction Ignore)

if ($null -eq $il2Dir) {
    Write-Output "Error: IL-2 Sturmovik Great Battles registry value '$UninstallRegistryKey\$InstallLocationRegistryValue' does not exist"
    Exit 1
} else {
    $il2Dir = $il2Dir.TrimEnd('\')
}

$il2DataDir = "$il2Dir\data"
$il2InputDir = "$il2DataDir\input"

if (-not (Test-Path $il2InputDir -PathType Container)) {
    Write-Output "Error: IL-2 Sturmovik Great Battles input directory '$il2InputDir' does not exist"
    Exit 1
}

Import-Module -Name "$PSScriptRoot\..\.lib\DirectInput"

$vJoyDevice = Get-VJoyDevice

if ($null -eq $vJoyDevice) {
    Write-Output 'Error: Could not find vJoy device'
    Exit 1
}

$guidParts = ($vJoyDevice.InstanceGuid.ToString().ToLower() -split '-', 4)
$lastPart = $guidParts[3] -replace '-' -split '(..)' -ne ''
[array]::Reverse($lastPart)
$guidParts[3] = -join $lastPart
$modifiedGuid = $guidParts -join '-'

$devicesTxtContent = "configId,guid,model|`r`r`n0," + $([uri]::EscapeUriString("`"$modifiedGuid`",$($vJoyDevice.InstanceName.ToString())"))

try {
    Get-ChildItem -Path $il2InputDir -File -Depth 0 | Remove-Item
    Write-Output "Cleared IL-2 Sturmovik Great Battles input directory '$il2InputDir'"
} catch {
    Write-Output "Error: Could not clear IL-2 Sturmovik Great Battles input directory '$il2InputDir'"
    Exit 1
}

Write-Output ''

function Write-ConfigFile {
    param (
        [Parameter(Mandatory)]
        [string]$Path,
        [Parameter(Mandatory)]
        [string]$Content
    )

    try {
        Set-Content -Path $Path -Value $Content -NoNewline
        Write-Output "Wrote file: $Path"
    } catch {
        Write-Output "Error: Could not write file: $Path"
        Exit 1
    }
}

Write-ConfigFile "$il2InputDir\current.responses" $CurrentResponsesFileContent
Write-ConfigFile "$il2InputDir\devices.txt" $devicesTxtContent
Write-ConfigFile "$il2InputDir\global.actions" $GlobalActionsFileContent
Write-ConfigFile "$il2InputDir\global.pitch" $GlobalPitchFileContent
Write-ConfigFile "$il2DataDir\LuaScripts\snapviews\snaps.cfg" $SnapsCfgFileContent

Write-Output ''

$startupCfg = "$il2DataDir\startup.cfg"

if (-not (Test-Path $startupCfg -PathType Leaf)) {
    Write-Output "Error: file '$startupCfg' does not exist"
    Exit 1
}

try {
    New-Item $startupCfg -Value ((Get-Content -Raw $startupCfg) -replace 'fullscreen\s*=\s*1', 'fullscreen = 0') -Force | Out-Null
    Write-Output "Updated file: $startupCfg"
} catch {
    Write-Output "Error: Could not update file: $startupCfg"
    Exit 1
}

Write-Output "`nIL-2 Sturmovik Great Battles is now fully configured!"
Exit 0
Write-Output "Configuring Korea. IL-2 Series for use with ControllerBuddy-Profiles...`n"

Set-Variable SharedResponsesFileContent -Option Constant -Value @'
{
  "curves": {
    "rpc_roll": {
      "deadZone0": 3,
      "deadZone1": 0,
      "sensitivity": 50,
      "harmonization": 0,
      "normalized": 1
    },
    "rpc_yaw": {
      "deadZone0": 6,
      "deadZone1": 0,
      "sensitivity": 50,
      "harmonization": 0,
      "normalized": 1
    }
  }
}
'@

Set-Variable GeneralActionsFileContent -Option Constant -Value @'
{
  "devices": [
    {
      "deviceId": 0,
      "model": "ControllerBuddy Joystick",
      "ident": "1234_5678",
      "name": ""
    }
  ],
  "modifiers": [
    "key_lcontrol",
    "key_lmenu",
    "key_lshift",
    "key_lwin",
    "key_rcontrol",
    "key_rmenu",
    "key_rshift",
    "key_rwin"
  ],
  "actions": {
    "escape": [
      "key_escape"
    ],
    "quickmenu": [
      "key_back"
    ],
    "commandmenu": [
      "key_tab"
    ],
    "statuspanel": [
      "key_backslash"
    ],
    "missionbriefing": [
      "key_n"
    ],
    "lobby": [
      "key_q"
    ],
    "chattoall": [
      "key_return"
    ],
    "gui_cursor_right": [
      "key_right"
    ],
    "gui_cursor_left": [
      "key_left"
    ],
    "gui_cursor_down": [
      "key_down"
    ],
    "gui_cursor_up": [
      "key_up"
    ],
    "gui_accept": [
      "key_space",
      "key_return"
    ],
    "gui_cancel": [
      "key_escape",
      "key_back"
    ],
    "gui_context1": [
      "key_f1"
    ],
    "gui_context2": [
      "key_f2"
    ],
    "gui_next": [
      "key_tab"
    ],
    "gui_prev": [
      "key_lshift+key_tab"
    ],
    "hidehud": [
      "key_h"
    ],
    "aiminghelp": [
      "key_rcontrol+key_h"
    ],
    "switchgauges": [
      "key_rmenu+key_h"
    ],
    "switchmap": [
      "key_m"
    ],
    "switchmapback": [
      "key_rmenu+key_m"
    ],
    "toggle_rearm": [
      "key_rshift+key_r"
    ],
    "gunsight_power": [
      "key_rcontrol+key_apostrophe"
    ],
    "all_guns_fire": [
      "key_space",
      "mouse_b0"
    ],
    "weapon_group_1_fire": [
      "key_rmenu+key_space",
      "dev0_b0"
    ],
    "weapon_group_2_fire": [
      "key_lmenu+key_space",
      "dev0_b1"
    ],
    "weapon_group_3_fire": [
      "key_lwin+key_space",
      "key_rwin+key_space",
      "dev0_b2"
    ],
    "all_guns_reload": [
      "key_r",
      "mouse_b2"
    ],
    "throw_bombs_command": [
      "key_lshift+key_space",
      "dev0_b4"
    ],
    "launch_rockets_command": [
      "key_lcontrol+key_space",
      "dev0_b3"
    ],
    "jettison_stores_command": [
      "key_rmenu+key_j",
      "dev0_b12"
    ],
    "throw_bombs_mode": [
      "key_lmenu+key_b"
    ],
    "launch_rockets_mode": [
      "key_lmenu+key_r"
    ],
    "bombdoors_toggle": [
      "key_rmenu+key_b",
      "dev0_b13"
    ],
    "bombfuse_toggle": [
      "key_rcontrol+key_b"
    ],
    "gunsight_mode": [
      "key_rcontrol+key_period",
      "dev0_b9"
    ],
    "gunsight_adjustment": [
      "key_rcontrol+key_semicolon"
    ],
    "gunsight_filter": [
      "key_rmenu+key_apostrophe"
    ],
    "gs_brightness": [
      "key_rshift+key_semicolon/key_rshift+key_period"
    ],
    "tc_visor_reset": [
      "key_rshift+key_apostrophe",
      "dev0_b8"
    ],
    "gs_reset": [
      "key_apostrophe"
    ],
    "gs_distance": [
      "key_semicolon/key_period"
    ],
    "gs_yaw": [
      "key_slash/key_comma"
    ],
    "tc_visor_yaw": [
      "key_rmenu+key_slash/key_rmenu+key_comma"
    ],
    "tc_visor_pitch": [
      "key_rmenu+key_semicolon/key_rmenu+key_period",
      "dev0_b23/dev0_b24"
    ],
    "rc_distance": [
      "key_rwin+key_slash/key_rwin+key_comma",
      "key_lwin+key_slash/key_lwin+key_comma"
    ],
    "rc_reset": [
      "key_rwin+key_apostrophe",
      "key_lwin+key_apostrophe"
    ],
    "rc_power": [
      "key_rwin+key_apostrophe",
      "key_lwin+key_apostrophe"
    ],
    "switchpilot": [
      "key_lshift+key_c",
      "dev0_b22"
    ],
    "tc_aiming": [
      "key_t"
    ],
    "cam_switch_turret": [
      "key_lshift+key_t"
    ],
    "tc_fire": [
      "mouse_b0"
    ],
    "tc_reload": [
      "key_r",
      "mouse_b2"
    ],
    "ai_turret_short_distance": [
      "key_rmenu+key_1"
    ],
    "ai_turret_normal_distance": [
      "key_rmenu+key_2"
    ],
    "ai_turret_medium_distance": [
      "key_rmenu+key_3"
    ],
    "ai_turret_act_by_yourself": [
      "key_rmenu+key_4"
    ],
    "ai_turret_back_fire": [
      "key_rmenu+key_5"
    ],
    "ai_turret_attack_ground": [
      "key_rmenu+key_6"
    ],
    "ai_turret_cease_fire": [
      "key_rmenu+key_9"
    ],
    "ai_turret_leave": [
      "key_rmenu+key_0"
    ],
    "bc_gun1": [
      "key_lcontrol+key_1"
    ],
    "bc_gun2": [
      "key_lcontrol+key_2"
    ],
    "bc_gun3": [
      "key_lcontrol+key_3"
    ],
    "bc_gun4": [
      "key_lcontrol+key_4"
    ],
    "bc_gunfire": [
      "key_rcontrol+key_space",
      "mouse_b0"
    ],
    "bc_gun0": [
      "key_lcontrol+key_grave"
    ],
    "jettison_tanks_command": [
      "key_lwin+key_f",
      "key_rwin+key_f",
      "dev0_b26"
    ],
    "screenshot": [
      "key_sysrq"
    ],
    "timepause": [
      "key_p"
    ],
    "timefaster": [
      "key_rbracket"
    ],
    "timeslower": [
      "key_lbracket"
    ],
    "skipallmedia": [
      "key_return"
    ],
    "record": [
      "key_lcontrol+key_r"
    ],
    "fps_counter": [
      "key_rcontrol+key_back"
    ],
    "ipdinc": [
      "key_rshift+key_add"
    ],
    "ipddec": [
      "key_rshift+key_subtract"
    ],
    "cam_reset": [
      "key_numpad5"
    ],
    "cam_switch_cockpitview_self": [
      "key_f1"
    ],
    "cam_switch_ext_free_self": [
      "key_f2"
    ],
    "cam_switch_ext_free_allied": [
      "key_lshift+key_f2"
    ],
    "cam_switch_ext_free_enemy": [
      "key_lcontrol+key_f2"
    ],
    "cam_switch_ext_free_nearest": [
      "key_lmenu+key_f2"
    ],
    "cam_switch_ext_free_land_all": [
      "key_f5"
    ],
    "cam_switch_ext_free_land_allied": [
      "key_lshift+key_f5"
    ],
    "cam_switch_ext_free_land_enemy": [
      "key_lcontrol+key_f5"
    ],
    "cam_switch_ext_free_land_nearest": [
      "key_lmenu+key_f5"
    ],
    "cam_switch_ext_free_bomb_all": [
      "key_f6"
    ],
    "cam_switch_ext_free_bomb_allied": [
      "key_lshift+key_f6"
    ],
    "cam_switch_ext_free_bomb_enemy": [
      "key_lcontrol+key_f6"
    ],
    "cam_switch_ext_free_bomb_nearest": [
      "key_lmenu+key_f6"
    ],
    "cam_switch_free": [
      "key_f11"
    ],
    "cam_switch_default_order": [
      "key_f12"
    ],
    "cam_switch_default_opposite": [
      "key_rcontrol+key_f12"
    ],
    "cam_switch_cycle": [
      "key_rshift+key_f12"
    ],
    "cam_switch_cycle_short": [
      "key_rmenu+key_f12"
    ],
    "cam_switch_ext_chase_allied_air": [
      "key_rshift+key_f8"
    ],
    "cam_switch_ext_chase_enemy_air": [
      "key_f8"
    ],
    "cam_switch_ext_chase_enemy_air_danger": [
      "key_rcontrol+key_f8"
    ],
    "cam_switch_ext_chase_allied_land": [
      "key_rshift+key_f7"
    ],
    "cam_switch_ext_chase_enemy_land": [
      "key_f7"
    ],
    "cam_switch_ext_free_physical_target": [
      "key_f3"
    ],
    "cam_switch_sight_target": [
      "key_lmenu+key_f3"
    ],
    "cam_switch_passby_target": [
      "key_lshift+key_f3"
    ],
    "cam_switch_flyby_target": [
      "key_lcontrol+key_f3"
    ],
    "cam_switch_gopro": [
      "key_f4"
    ],
    "ai_track_mode": [
      "key_lshift+key_f1"
    ],
    "cam_switch_track": [
      "key_lcontrol+key_f1"
    ],
    "cam_switch_head_free": [
      "key_lmenu+key_f1"
    ],
    "cam_rotate_pitch": [
      "key_numpad2/key_numpad8",
      "mouse_axis_y",
      "key_lshift+key_lmenu+mouse_axis_y",
      "dev0_axis_s"
    ],
    "cam_rotate_yaw": [
      "key_numpad6/key_numpad4",
      "mouse_axis_x",
      "key_lshift+key_lmenu+mouse_axis_x",
      "dev0_axis_w"
    ],
    "cam_rotate_roll": [
      "key_lcontrol+key_numpad6/key_lcontrol+key_numpad4",
      "key_rcontrol+key_numpad6/key_rcontrol+key_numpad4",
      "key_lcontrol+mouse_axis_x",
      "key_rcontrol+mouse_axis_x"
    ],
    "cam_zoom": [
      "key_add/key_subtract",
      "mouse_axis_z",
      "key_lshift+key_lmenu+mouse_axis_z"
    ],
    "cam_rotate_ext_pitch": [
      "key_lshift+mouse_axis_y",
      "key_rshift+mouse_axis_y",
      "key_lshift+key_numpad2/key_lshift+key_numpad8",
      "key_rshift+key_numpad2/key_rshift+key_numpad8"
    ],
    "cam_rotate_ext_yaw": [
      "key_lshift+mouse_axis_x",
      "key_rshift+mouse_axis_x",
      "key_lshift+key_numpad6/key_lshift+key_numpad4",
      "key_rshift+key_numpad6/key_rshift+key_numpad4"
    ],
    "cam_trans_fb": [
      "key_home/key_end",
      "mouse_b1+mouse_axis_y",
      "key_lshift+key_lmenu+key_w/key_lshift+key_lmenu+key_s"
    ],
    "cam_trans_lr": [
      "key_next/key_delete",
      "mouse_b1+mouse_axis_x",
      "key_lshift+key_lmenu+key_d/key_lshift+key_lmenu+key_a"
    ],
    "cam_trans_ud": [
      "key_prior/key_insert",
      "mouse_b1+mouse_axis_z",
      "key_lshift+key_lmenu+key_r/key_lshift+key_lmenu+key_f"
    ],
    "cam_free_slow_mode": [
      "key_capital"
    ],
    "cam_rotate_hf_yaw": [
      "mouse_axis_x"
    ],
    "cam_rotate_hf_pitch": [
      "mouse_axis_y"
    ],
    "bc_head_cvmodes": [
      "key_f9"
    ],
    "bc_head_cvss": [
      "key_f10"
    ],
    "bc_head_zoom": [
      "mouse_axis_z"
    ],
    "bc_head_cfovi": [
      "key_add"
    ],
    "bc_head_cfovo": [
      "key_subtract"
    ],
    "bc_head_cfovr": [
      "key_multiply"
    ],
    "bc_head_fov0": [
      "key_rcontrol+key_decimal"
    ],
    "bc_head_fov1": [
      "key_rcontrol+key_numpad1"
    ],
    "bc_head_fov2": [
      "key_rcontrol+key_numpad2"
    ],
    "bc_head_fov3": [
      "key_rcontrol+key_numpad3"
    ],
    "bc_head_fov4": [
      "key_rcontrol+key_numpad0"
    ],
    "bc_head_cv0": [
      "key_numpad8"
    ],
    "bc_head_cv45": [
      "key_numpad9"
    ],
    "bc_head_cv90": [
      "key_numpad6"
    ],
    "bc_head_cv135": [
      "key_numpad3"
    ],
    "bc_head_cv180": [
      "key_numpad2"
    ],
    "bc_head_cv225": [
      "key_numpad1"
    ],
    "bc_head_cv270": [
      "key_numpad4"
    ],
    "bc_head_cv315": [
      "key_numpad7"
    ],
    "bc_head_cvu": [
      "key_numpad0"
    ],
    "bc_head_cvd": [
      "key_numpadenter"
    ],
    "bc_head_cva": [
      "key_decimal"
    ],
    "bc_head_pitch": [
      "mouse_axis_y",
      "dev0_axis_s"
    ],
    "bc_head_yaw": [
      "mouse_axis_x",
      "dev0_axis_w"
    ],
    "bc_head_roll": [
      "-key_lcontrol+mouse_axis_x",
      "-key_rcontrol+mouse_axis_x"
    ],
    "bc_head_yaw_wrapped": [
      "mouse_axis_x"
    ],
    "bc_head_cvmr": [
      "key_next"
    ],
    "bc_head_cvml": [
      "key_delete"
    ],
    "bc_head_cvmf": [
      "key_home"
    ],
    "bc_head_cvmb": [
      "key_end"
    ],
    "bc_head_cvmu": [
      "key_prior"
    ],
    "bc_head_cvmd": [
      "key_insert"
    ],
    "cam_turret_pitch": [
      "key_lshift+mouse_axis_y",
      "key_rshift+mouse_axis_y"
    ],
    "cam_turret_yaw": [
      "key_lshift+mouse_axis_x",
      "key_rshift+mouse_axis_x"
    ],
    "autopilot": [
      "key_lmenu+key_a"
    ],
    "autolevelflight": [
      "key_lshift+key_a",
      "dev0_b25"
    ],
    "autoclimbflight": [
      "key_lcontrol+key_a"
    ],
    "autolevelflight_hard_to_right": [
      "key_lmenu+key_x"
    ],
    "autolevelflight_hard_to_left": [
      "key_lmenu+key_z"
    ],
    "autolevelflight_to_right": [
      "key_lshift+key_x"
    ],
    "autolevelflight_to_left": [
      "key_lshift+key_z"
    ],
    "rpc_pitch": [
      "key_down/key_up",
      "key_lmenu+mouse_axis_y",
      "key_rmenu+mouse_axis_y",
      "dev0_axis_y"
    ],
    "rpc_roll": [
      "key_right/key_left",
      "key_lmenu+mouse_axis_x",
      "key_rmenu+mouse_axis_x",
      "dev0_axis_x"
    ],
    "rpc_yaw": [
      "key_x/key_z",
      "key_lwin+mouse_axis_x",
      "key_rwin+mouse_axis_x",
      "dev0_axis_t"
    ],
    "yaw_reset": [
      "key_lwin+key_z",
      "key_rwin+key_z",
      "key_lwin+key_x",
      "key_rwin+key_x"
    ],
    "trims_reset": [
      "key_lcontrol+key_t",
      "dev0_b14"
    ],
    "rpc_pitch_trim": [
      "key_rcontrol+key_down/key_rcontrol+key_up"
    ],
    "rpc_roll_trim": [
      "key_rcontrol+key_right/key_rcontrol+key_left"
    ],
    "rpc_yaw_trim": [
      "key_lcontrol+key_x/key_lcontrol+key_z"
    ],
    "adjustable_stabilizer_up": [
      "key_rcontrol+key_down"
    ],
    "adjustable_stabilizer_dn": [
      "key_rcontrol+key_up"
    ],
    "pitch_trim_switch_up": [
      "key_rcontrol+key_down",
      "dev0_b18"
    ],
    "pitch_trim_switch_dn": [
      "key_rcontrol+key_up",
      "dev0_b17"
    ],
    "roll_trim_switch_right": [
      "key_rcontrol+key_right",
      "dev0_b20"
    ],
    "roll_trim_switch_left": [
      "key_rcontrol+key_left",
      "dev0_b19"
    ],
    "yaw_trim_switch_right": [
      "key_lcontrol+key_x",
      "dev0_b15"
    ],
    "yaw_trim_switch_left": [
      "key_lcontrol+key_z",
      "dev0_b16"
    ],
    "autoaltitudinalcorrection": [
      "key_lwin+key_p",
      "key_rwin+key_p"
    ],
    "autoradiators": [
      "key_lwin+key_c",
      "key_rwin+key_c"
    ],
    "autorpmlimiter": [
      "key_lwin+key_t",
      "key_rwin+key_t"
    ],
    "rpc_all_engines_throttles": [
      "key_equals/key_minus",
      "key_lcontrol+mouse_axis_z",
      "key_rcontrol+mouse_axis_z",
      "-dev0_axis_z"
    ],
    "all_engines_switch": [
      "key_e"
    ],
    "all_engines_boost": [
      "key_lwin+key_b",
      "key_rwin+key_b",
      "dev0_b11"
    ],
    "jet_boosters": [
      "key_j"
    ],
    "jettison_jet_boosters": [
      "key_rshift+key_j"
    ],
    "rpc_all_engines_props_pitch": [
      "key_rshift+key_equals/key_rshift+key_minus",
      "-dev0_axis_p"
    ],
    "all_engines_superchargers": [
      "key_lwin+key_s",
      "key_rwin+key_s",
      "dev0_b10"
    ],
    "rpc_all_engines_mixtures": [
      "key_rcontrol+key_equals/key_rcontrol+key_minus",
      "-dev0_axis_q"
    ],
    "rpc_all_engines_water_radiators_shutters": [
      "key_rmenu+key_equals/key_rmenu+key_minus"
    ],
    "rpc_all_engines_oil_radiators_shutters": [
      "key_rwin+key_equals/key_rwin+key_minus",
      "key_lwin+key_equals/key_lwin+key_minus"
    ],
    "rpc_all_engines_in_cowls_shutters": [
      "key_rmenu+key_equals/key_rmenu+key_minus"
    ],
    "all_engines_out_cowls_shutters_open": [
      "key_lmenu+key_equals"
    ],
    "all_engines_out_cowls_shutters_close": [
      "key_lmenu+key_minus"
    ],
    "all_engines_water_radiators_control_mode": [
      "key_rmenu+key_r"
    ],
    "all_engines_water_radiators_open": [
      "key_rmenu+key_equals"
    ],
    "all_engines_water_radiators_close": [
      "key_rmenu+key_minus"
    ],
    "all_engines_oil_radiators_control_mode": [
      "key_rwin+key_r",
      "key_lwin+key_r"
    ],
    "all_engines_oil_radiators_open": [
      "key_rwin+key_equals",
      "key_lwin+key_equals"
    ],
    "all_engines_oil_radiators_close": [
      "key_rwin+key_minus",
      "key_lwin+key_minus"
    ],
    "gear": [
      "key_g"
    ],
    "gear_dn": [
      "key_lcontrol+key_g"
    ],
    "gear_up": [
      "key_lshift+key_g"
    ],
    "emergency_gear_dn": [
      "key_lmenu+key_g"
    ],
    "flaps": [
      "key_f"
    ],
    "flaps_dn": [
      "key_lcontrol+key_f",
      "dev0_b6"
    ],
    "flaps_up": [
      "key_lshift+key_f",
      "dev0_b5"
    ],
    "airbrakes": [
      "key_b"
    ],
    "airbrakes_on": [
      "key_lcontrol+key_b"
    ],
    "airbrakes_off": [
      "key_lshift+key_b"
    ],
    "tailwheel_lock": [
      "key_w"
    ],
    "rpc_wheel_brakes": [
      "key_s"
    ],
    "rpc_wheel_brakes_right": [
      "key_d"
    ],
    "rpc_wheel_brakes_left": [
      "key_a"
    ],
    "parking_brakes": [
      "key_lshift+key_w",
      "dev0_b7"
    ],
    "toggle_refuel": [
      "key_rshift+key_f"
    ],
    "fuel_dumping": [
      "key_rmenu+key_f"
    ],
    "select_fuel_selector": [
      "key_rcontrol+key_prior"
    ],
    "turn_fuel_selector": [
      "key_rcontrol+key_next"
    ],
    "select_fuel_pump": [
      "key_rcontrol+key_home"
    ],
    "switch_fuel_pump": [
      "key_rcontrol+key_end"
    ],
    "switch_fuel_indicator": [
      "key_rcontrol+key_insert"
    ],
    "canopy_open_close": [
      "key_c"
    ],
    "window_open_close": [
      "key_lmenu+key_c"
    ],
    "cockpit_lights": [
      "key_l"
    ],
    "landing_lights": [
      "key_rshift+key_l"
    ],
    "taxi_lights": [
      "key_rcontrol+key_l"
    ],
    "navigation_lights": [
      "key_rmenu+key_l"
    ],
    "formation_lights": [
      "key_rwin+key_l",
      "key_lwin+key_l"
    ],
    "code_lights": [
      "key_lmenu+key_l"
    ],
    "cockpit_input_command_4": [
      "key_rshift+key_prior"
    ],
    "cockpit_input_command_5": [
      "key_rshift+key_next"
    ],
    "cockpit_input_command_2": [
      "key_rshift+key_home"
    ],
    "cockpit_input_command_3": [
      "key_rshift+key_end"
    ],
    "cockpit_input_command_0": [
      "key_rshift+key_insert"
    ],
    "cockpit_input_command_1": [
      "key_rshift+key_delete"
    ],
    "altimeter_reference_pressure": [
      "key_lwin+key_a",
      "key_rwin+key_a"
    ],
    "radio_volume_increase": [
      "key_rmenu+key_prior"
    ],
    "radio_volume_decrease": [
      "key_rmenu+key_next"
    ],
    "switch_radio_channel": [
      "key_rmenu+key_insert"
    ],
    "beacon_channel_increase": [
      "key_rmenu+key_home"
    ],
    "beacon_channel_decrease": [
      "key_rmenu+key_end"
    ],
    "bc_eject": [
      "key_lcontrol+key_e",
      "dev0_b21"
    ],
    "eject_seat": [
      "key_lshift+key_e"
    ],
    "canopy_remove": [
      "key_lmenu+key_e"
    ],
    "bc_go_forward": [
      "key_up"
    ],
    "bc_go_backward": [
      "key_down"
    ],
    "bc_go_right": [
      "key_right"
    ],
    "bc_go_left": [
      "key_left"
    ],
    "bc_run": [
      "key_space"
    ],
    "bc_lie": [
      "key_c"
    ],
    "bc_signal_attack": [
      "key_lshift+key_1"
    ],
    "bc_signal_denote_enemy": [
      "key_lshift+key_2"
    ],
    "bc_signal_flap_to_head": [
      "key_lshift+key_3"
    ],
    "bc_signal_patrol": [
      "key_lshift+key_4"
    ],
    "bc_signal_back_to_mission": [
      "key_lshift+key_5"
    ],
    "bc_signal_patrol_air": [
      "key_lshift+key_6"
    ],
    "bc_signal_patrol_ground": [
      "key_lshift+key_7"
    ],
    "bc_signal_hold_formation": [
      "key_lshift+key_8"
    ],
    "bc_signal_return_to_base": [
      "key_lshift+key_9"
    ],
    "vc_gas": [
      "key_up/key_down"
    ],
    "vc_brakeaxis": [
      "key_f",
      "-key_v"
    ],
    "vc_clutch": [
      "key_d",
      "-key_c"
    ],
    "vc_turn": [
      "key_right/key_left"
    ],
    "vc_gearup": [
      "key_x"
    ],
    "vc_geardown": [
      "key_z"
    ],
    "tc_guard": [
      "key_rshift+key_c"
    ],
    "switchgunpos0": [
      "key_rshift+key_0"
    ],
    "switchgunpos1": [
      "key_rshift+key_1"
    ],
    "switchgunpos2": [
      "key_rshift+key_2"
    ],
    "switchgunpos3": [
      "key_rshift+key_3"
    ],
    "tc_switchgun": [
      "key_rwin+key_g"
    ],
    "cam_switch_visor": [
      "key_lshift+key_v"
    ],
    "tc_fire_secondary": [
      "mouse_b1"
    ],
    "ai_turret_cease_heavy_fire": [
      "key_rmenu+key_4"
    ],
    "dummyevent": [
      "key_lmenu+key_tab",
      "key_rmenu+key_tab"
    ],
    "rb_pitch": [
      "mouse_axis_y"
    ],
    "rb_yaw": [
      "mouse_axis_x"
    ],
    "mc_pitch": [
      "mouse_axis_y"
    ],
    "mc_yaw": [
      "mouse_axis_x"
    ],
    "mc_pitch_free": [
      "mouse_axis_y+mouse_b1"
    ],
    "mc_yaw_free": [
      "mouse_axis_x+mouse_b1"
    ],
    "mc_zoom": [
      "key_lshift+mouse_axis_z",
      "key_add/key_subtract"
    ],
    "vc_engine_switch": [
      "key_e"
    ],
    "vc_brake": [
      "key_space"
    ],
    "rb_zoom": [
      "key_lshift+mouse_axis_z",
      "key_add/key_subtract"
    ],
    "cam_switch_mc_far": [
      "key_f4"
    ],
    "cam_switch_mc_close": [
      "key_f1"
    ],
    "freelook": [
      "mouse_b1"
    ],
    "ext_action1": [
      "key_lwin+key_1",
      "key_rwin+key_1"
    ],
    "ext_action2": [
      "key_lwin+key_2",
      "key_rwin+key_2"
    ],
    "ext_action3": [
      "key_lwin+key_3",
      "key_rwin+key_3"
    ],
    "ext_action4": [
      "key_lwin+key_4",
      "key_rwin+key_4"
    ],
    "ext_action5": [
      "key_lwin+key_5",
      "key_rwin+key_5"
    ],
    "ext_action6": [
      "key_lwin+key_6",
      "key_rwin+key_6"
    ],
    "ext_action7": [
      "key_lwin+key_7",
      "key_rwin+key_7"
    ],
    "ext_action8": [
      "key_lwin+key_8",
      "key_rwin+key_8"
    ],
    "ext_action9": [
      "key_lwin+key_9",
      "key_rwin+key_9"
    ],
    "ext_action0": [
      "key_lwin+key_0",
      "key_rwin+key_0"
    ],
    "gui_mouse_x": [
      "mouse_axis_x"
    ],
    "gui_mouse_y": [
      "mouse_axis_y"
    ],
    "gui_mouse_z": [
      "mouse_axis_z"
    ],
    "gui_mouse_lb": [
      "mouse_b0"
    ],
    "gui_mouse_rb": [
      "mouse_b1"
    ],
    "gui_mouse_mb": [
      "mouse_b2"
    ],
    "switchgunpos4": [
      "key_rshift+key_4"
    ],
    "switchgunpos5": [
      "key_rshift+key_5"
    ],
    "switchgunpos6": [
      "key_rshift+key_6"
    ],
    "switchgunpos7": [
      "key_rshift+key_7"
    ],
    "switchgunpos8": [
      "key_rshift+key_8"
    ],
    "switchgunpos9": [
      "key_rshift+key_9"
    ],
    "bc_gun5": [
      "key_lcontrol+key_5"
    ],
    "cam_switch_bombaim": [
      "key_v"
    ],
    "rpc_adjustable_stabilizer": [
      "key_rcontrol+key_down/key_rcontrol+key_up"
    ]
  }
}
'@

Set-Variable GeneralPitchFileContent -Option Constant -Value @'
{
  "curves": {
    "rpc_pitch": {
      "deadZone0": 3,
      "deadZone1": 0,
      "sensitivity": 75,
      "offset": 0,
      "harmonization": 0,
      "normalized": 1
    }
  }
}
'@

Set-Variable SnapsCfgFileContent -Option Constant -Value @'
DefaultSnapMode = "PV"
LineSpeed = 0.714
RotateSpeed = 77.680
FOVSpeed = 1.682
LineInert = 1.000
RotateInert = 1.000
FOVInert = 1.000
PANLineSpeed = 0.699
PANRotateSpeed = 77.680
PANFOVSpeed = 1.645
PANLineInert = 1.000
PANRotateInert = 1.000
PANFOVInert = 1.000

'@

Set-Variable StartupCfgSectionPatches -Option Constant -Value @(
    @{
        Section = 'force_feedback'
        Properties = [ordered]@{ enabled = '0' }
    },
    @{
        Section = 'graphics'
        Properties = [ordered]@{ fullscreen = '0' }
    },
    @{
        Section = 'input'
        Properties = [ordered]@{
            cooling_default = '0'
            mixture_default = '0'
            mouse_plane_control = '0'
            plane_control_mode = '0'
            rpm_lim_default = '0'
        }
    }
)

Set-Variable UninstallRegistryKey -Option Constant -Value 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{222bc1b4-be6e-4451-9291-ef5aeb7c64a2}_is1'
Set-Variable InstallLocationRegistryValue -Option Constant -Value InstallLocation

$il2Dir = (Get-ItemPropertyValue -Path $UninstallRegistryKey -Name $InstallLocationRegistryValue -ErrorAction Ignore)

if (-not ($il2Dir -and (Test-Path $il2Dir))) {
    Import-Module -Name (Join-Path $PSScriptRoot ..\.lib\Steam)
    $il2Dir = Get-SteamGamePath 247970
}

if (-not $il2Dir) {
    Write-Output "Error: Korea. IL-2 Series is not installed"
    Exit 1
}

$il2DataDir = Join-Path $il2Dir data
$il2InputDir =  Join-Path $il2DataDir input

if (-not (Test-Path $il2InputDir -PathType Container)) {
    Write-Output "Error: Korea. IL-2 Series input directory '$il2InputDir' does not exist"
    Exit 1
}

Import-Module -Name (Join-Path $PSScriptRoot ..\.lib\DirectInput)

$vJoyDevice = Get-VJoyDevice

if ($null -eq $vJoyDevice) {
    Write-Output 'Error: Could not find vJoy device'
    Exit 1
}

$isWine = Test-Path -Path 'HKCU:\Software\Wine'
$gamepadDevices = Get-GamepadDeviceList

if (-not $isWine) {
    while ($gamepadDevices.Count -lt 1) {
        Add-Type -AssemblyName PresentationCore, PresentationFramework

        if ([System.Windows.MessageBox]::Show("There is currently no controller connected.`nTo retry, please connect your controller now.`n`nRetry?", 'No controller connected', [System.Windows.MessageBoxButton]::YesNo, [System.Windows.MessageBoxImage]::Warning) -ne [System.Windows.MessageBoxResult]::Yes) {
            Write-Output 'Error: No controller connected'
            Exit 1
        }

        $gamepadDevices = Get-GamepadDeviceList
    }
}

$now = Get-Date -Format 'yyyy.MM.dd HH:mm:ss'

$knownDevicesJsonContent = @"
{
  "knownDevices": {
$((@($vJoyDevice) + $gamepadDevices | ForEach-Object {
    $guidParts = ($_.InstanceGuid.ToString().ToLower() -split '-', 4)
    $lastPart = $guidParts[3] -replace '-' -split '(..)' -ne ''
    [array]::Reverse($lastPart)
    $guidParts[3] = -join $lastPart
    $modifiedGuid = $guidParts -join '-'

    $isVJoyDevice = $_.InstanceGuid -eq $vJoyDevice.InstanceGuid
    $productGuid = $_.ProductGuid.ToString()

@"
    `"$modifiedGuid`": {
      `"deviceId`": $(if ($isVJoyDevice) { 0 } else { -1 }),
      `"model`": `"$($_.InstanceName)`",
      `"ident`": `"$(($productGuid.Substring(4, 4) + '_' + $productGuid.Substring(0, 4)).ToLower())`",
      `"isNew`": false,
      `"isGamepad`": $(if ($isVJoyDevice) { 'false' } else { 'true' }),
      `"created`": `"$now`",
      `"updated`": `"$now`",
      `"lastAttachedId`": $(if ($isVJoyDevice) { 0 } else { -1 })
    }
"@
}) -join ",`n")
  }
}
"@

try {
    Get-ChildItem -Path $il2InputDir -File -Depth 0 | Where-Object { $_.Name -ne 'joys.ffp' } | Remove-Item
    Write-Output "Cleared Korea. IL-2 Series input directory '$il2InputDir'"
} catch {
    Write-Output "Error: Could not clear Korea. IL-2 Series input directory '$il2InputDir'"
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

Write-ConfigFile (Join-Path $il2InputDir shared.responses) $SharedResponsesFileContent
Write-ConfigFile (Join-Path $il2InputDir known.devices.json) $knownDevicesJsonContent
Write-ConfigFile (Join-Path $il2InputDir general.actions) $GeneralActionsFileContent
Write-ConfigFile (Join-Path $il2InputDir general.pitch) $GeneralPitchFileContent
Write-ConfigFile (Join-Path $il2DataDir LuaScripts\snapviews\snaps.cfg) $SnapsCfgFileContent

Write-Output ''

try {
    $startupCfg = Join-Path $il2DataDir startup.cfg
    $startupCfgContent = ''
    if (Test-Path $startupCfg) {
        $content = Get-Content -Raw $startupCfg
        if ($null -ne $content) { $startupCfgContent = $content }
    }

    foreach ($patch in $StartupCfgSectionPatches) {
        $sectionPattern = "(?ms)^\[KEY = $($patch.Section)\].*?^\[END\]"

        $startupCfgContent = if ($startupCfgContent -match $sectionPattern) {
            [regex]::Replace($startupCfgContent, $sectionPattern, [System.Text.RegularExpressions.MatchEvaluator] {
                param($match)

                $section = $match.Value
                foreach ($property in $patch.Properties.GetEnumerator()) {
                    $propertyPattern = "(?m)^\s*$($property.Key)\s*=\s*[^\r\n]+"
                    $section = if ($section -match $propertyPattern) {
                        $section -replace $propertyPattern, "`t$($property.Key) = $($property.Value)"
                    } else {
                        $section -replace '(?m)^\[END\]$', "`t$($property.Key) = $($property.Value)`r`n[END]"
                    }
                }
                $section
            })
        } else {
            $propertyLines = ($patch.Properties.GetEnumerator() | ForEach-Object { "`t$($_.Key) = $($_.Value)" }) -join "`r`n"
            $trimmed = $startupCfgContent.TrimEnd()
            $separator = if ($trimmed) { "`r`n`r`n" } else { "`r`n" }
            "$trimmed$separator[KEY = $($patch.Section)]`r`n$propertyLines`r`n[END]`r`n"
        }
    }

    New-Item $startupCfg -Value $startupCfgContent -Force | Out-Null
    Write-Output "Updated file: $startupCfg"
} catch {
    Write-Output "Error: Could not update file: $startupCfg"
    Exit 1
}

Write-Output "`nKorea. IL-2 Series is now fully configured!"
Exit 0
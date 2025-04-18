local diff = {
	["axisDiffs"] = {
		["a2001cdnil"] = {
			["changed"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = 0.1,
						},
						["deadzone"] = 0.12,
						["hardwareDetent"] = false,
						["hardwareDetentAB"] = 0,
						["hardwareDetentMax"] = 0,
						["invert"] = false,
						["saturationX"] = 1,
						["saturationY"] = 1,
						["slider"] = false,
					},
					["key"] = "JOY_Y",
				},
			},
			["name"] = "Flight Control Cyclic Pitch",
		},
		["a2002cdnil"] = {
			["changed"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = 0.1,
						},
						["deadzone"] = 0.12,
						["hardwareDetent"] = false,
						["hardwareDetentAB"] = 0,
						["hardwareDetentMax"] = 0,
						["invert"] = false,
						["saturationX"] = 1,
						["saturationY"] = 1,
						["slider"] = false,
					},
					["key"] = "JOY_X",
				},
			},
			["name"] = "Flight Control Cyclic Roll",
		},
		["a2003cdnil"] = {
			["changed"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = 0.25,
						},
						["deadzone"] = 0.25,
						["hardwareDetent"] = false,
						["hardwareDetentAB"] = 0,
						["hardwareDetentMax"] = 0,
						["invert"] = false,
						["saturationX"] = 1,
						["saturationY"] = 1,
						["slider"] = false,
					},
					["key"] = "JOY_RZ",
				},
			},
			["name"] = "Flight Control Yaw (pedals)",
		},
		["a2010cdnil"] = {
			["added"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = 0,
						},
						["deadzone"] = 0,
						["hardwareDetent"] = false,
						["hardwareDetentAB"] = 0,
						["hardwareDetentMax"] = 0,
						["invert"] = false,
						["saturationX"] = 1,
						["saturationY"] = 0.41,
						["slider"] = false,
					},
					["key"] = "JOY_RX",
				},
			},
			["name"] = "Absolute Camera Horizontal View",
		},
		["a2011cdnil"] = {
			["added"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = 0,
						},
						["deadzone"] = 0,
						["hardwareDetent"] = false,
						["hardwareDetentAB"] = 0,
						["hardwareDetentMax"] = 0,
						["invert"] = false,
						["saturationX"] = 1,
						["saturationY"] = 0.5,
						["slider"] = false,
					},
					["key"] = "JOY_RY",
				},
			},
			["name"] = "Absolute Camera Vertical View",
		},
		["a2087cdnil"] = {
			["changed"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = 0.2,
						},
						["deadzone"] = 0,
						["hardwareDetent"] = false,
						["hardwareDetentAB"] = 0,
						["hardwareDetentMax"] = 0,
						["invert"] = false,
						["saturationX"] = 1,
						["saturationY"] = 1,
						["slider"] = false,
					},
					["key"] = "JOY_Z",
				},
			},
			["name"] = "Flight Control Collective",
		},
		["a3023cd20"] = {
			["added"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = 0,
						},
						["deadzone"] = 0,
						["hardwareDetent"] = false,
						["hardwareDetentAB"] = 0,
						["hardwareDetentMax"] = 0,
						["invert"] = true,
						["saturationX"] = 1,
						["saturationY"] = 1,
						["slider"] = true,
					},
					["key"] = "JOY_SLIDER1",
				},
			},
			["name"] = "Wheel brake Left (analog)",
		},
		["a3024cd20"] = {
			["added"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = 0,
						},
						["deadzone"] = 0,
						["hardwareDetent"] = false,
						["hardwareDetentAB"] = 0,
						["hardwareDetentMax"] = 0,
						["invert"] = true,
						["saturationX"] = 1,
						["saturationY"] = 1,
						["slider"] = true,
					},
					["key"] = "JOY_SLIDER2",
				},
			},
			["name"] = "Wheel brake Right (analog)",
		},
	},
	["keyDiffs"] = {
		["d1731pnilu1731cdnilvd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN9",
				},
			},
			["name"] = "Radio Button (VOIP)",
		},
		["d1757pnilu1757cdnilvd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN10",
				},
			},
			["name"] = "INT Button (VOIP)",
		},
		["d3163pnilunilcd29vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN33",
				},
			},
			["name"] = "Thrust Grip, SRCH Switch - WHT/IR",
		},
		["d3164pnilu3164cd29vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN34",
				},
			},
			["name"] = "Thrust Grip, SRCH ON/OFF Pushbutton",
		},
		["d3165pnilu3165cd29vd-1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN31",
				},
			},
			["name"] = "Thrust Grip, SRCH POSITION Hat - depress LEFT ← (LT)",
		},
		["d3165pnilu3165cd29vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN32",
				},
			},
			["name"] = "Thrust Grip, SRCH POSITION Hat - depress RIGHT → (RT)",
		},
		["d3166pnilu3166cd29vd-1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN30",
				},
			},
			["name"] = "Thrust Grip, SRCH POSITION Hat - depress DOWN ↓ (RETRACT)",
		},
		["d3166pnilu3166cd29vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN29",
				},
			},
			["name"] = "Thrust Grip, SRCH POSITION Hat - depress UP ↑ (EXTEND)",
		},
		["d3168pnilu3168cd29vd-1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN28",
				},
			},
			["name"] = "Thrust Grip, UP/DN Switch - depress UP ↑",
		},
		["d3168pnilu3168cd29vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN27",
				},
			},
			["name"] = "Thrust Grip, UP/DN Switch - depress DOWN ↓",
		},
		["d3169pnilu3169cd29vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN39",
				},
			},
			["name"] = "Thrust Grip, GO AROUND Pushbutton",
		},
		["d3170pnilu3170cd29vd-1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN37",
				},
			},
			["name"] = "Thrust Grip, Radio Frq. Hat - depress LEFT ← (R-DN)",
		},
		["d3170pnilu3170cd29vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN38",
				},
			},
			["name"] = "Thrust Grip, Radio Frq. Hat - depress RIGHT → (R-UP)",
		},
		["d3171pnilu3171cd29vd-1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN36",
				},
			},
			["name"] = "Thrust Grip, Radio Frq. Hat - depress DOWN ↓ (F-DN)",
		},
		["d3171pnilu3171cd29vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN35",
				},
			},
			["name"] = "Thrust Grip, Radio Frq. Hat - depress UP ↑ (F-UP)",
		},
		["d3172pnilu3172cd29vd-1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN25",
				},
			},
			["name"] = "Thrust Grip, HUD Hat - depress LEFT ← (MODE)",
		},
		["d3172pnilu3172cd29vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN26",
				},
			},
			["name"] = "Thrust Grip, HUD Hat - depress RIGHT → (DCLT)",
		},
		["d3173pnilu3173cd29vd-1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN24",
				},
			},
			["name"] = "Thrust Grip, HUD Hat - depress BACK/DOWN ↓ (DIM)",
		},
		["d3173pnilu3173cd29vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN23",
				},
			},
			["name"] = "Thrust Grip, HUD Hat - depress FORWARD/UP ↑ (BRT)",
		},
		["d3174pnilu3174cd29vd-1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN21",
				},
			},
			["name"] = "Thrust Grip, AFCS Mode Hat - depress LEFT ← (PH)",
		},
		["d3174pnilu3174cd29vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN22",
				},
			},
			["name"] = "Thrust Grip, AFCS Mode Hat - depress RIGHT → (IN/RA)",
		},
		["d3175pnilu3175cd29vd-1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN20",
				},
			},
			["name"] = "Thrust Grip, AFCS Mode Hat - depress DOWN ↓ (TRC)",
		},
		["d3175pnilu3175cd29vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN19",
				},
			},
			["name"] = "Thrust Grip, AFCS Mode Hat - depress UP ↑ (ALT)",
		},
		["d3176pnilu3176cd29vd0.1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN12",
				},
			},
			["name"] = "Cyclic Grip, XMIT/ICS Trigger - depress ICS (HALF)",
		},
		["d3176pnilu3176cd29vd1vpnilvu0.9"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN11",
				},
			},
			["name"] = "Cyclic Grip, XMIT/ICS Trigger - depress XMIT (FULL)",
		},
		["d3177pnilu3177cd29vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN7",
				},
			},
			["name"] = "Cyclic Grip, CRSR ACT Button",
		},
		["d3178pnilu3178cd29vd-1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN5",
				},
			},
			["name"] = "Cyclic Grip, MFD CRSR Hat - depress LEFT ←",
		},
		["d3178pnilu3178cd29vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN6",
				},
			},
			["name"] = "Cyclic Grip, MFD CRSR Hat - depress RIGHT →",
		},
		["d3179pnilu3179cd29vd-1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN4",
				},
			},
			["name"] = "Cyclic Grip, MFD CRSR Hat - depress DOWN ↓",
		},
		["d3179pnilu3179cd29vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN3",
				},
			},
			["name"] = "Cyclic Grip, MFD CRSR Hat - depress UP ↑",
		},
		["d3180pnilu3180cd29vd-1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN16",
				},
			},
			["name"] = "Cyclic Grip, AFCS TRIM Hat - depress LEFT ←",
		},
		["d3180pnilu3180cd29vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN17",
				},
			},
			["name"] = "Cyclic Grip, AFCS TRIM Hat - depress RIGHT →",
		},
		["d3181pnilu3181cd29vd-1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN15",
				},
			},
			["name"] = "Cyclic Grip, AFCS TRIM Hat - depress DOWN ↓",
		},
		["d3181pnilu3181cd29vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN14",
				},
			},
			["name"] = "Cyclic Grip, AFCS TRIM Hat - depress UP ↑",
		},
		["d3182pnilu3182cd29vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN18",
				},
			},
			["name"] = "Cyclic Grip, FD CPLR REL Button",
		},
		["d3183pnilu3183cd29vd-1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN2",
				},
			},
			["name"] = "Cyclic Grip, FLARE/CHAFF Dispensing - depress DOWN ↓ (CHAFF)",
		},
		["d3183pnilu3183cd29vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN1",
				},
			},
			["name"] = "Cyclic Grip, FLARE/CHAFF Dispensing - depress UP ↑ (FLARE)",
		},
		["d3184pnilu3184cd29vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN8",
				},
			},
			["name"] = "Cyclic Grip, ACK Button",
		},
		["d3185pnilu3185cd29vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN13",
				},
			},
			["name"] = "Cyclic Grip, CD REL Button",
		},
		["d957pnilu958cdnilvdnilvpnilvunil"] = {
			["name"] = "Trim Control",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN3",
				},
			},
		},
	},
}
return diff
local diff = {
	["axisDiffs"] = {
		["a2001cdnil"] = {
			["changed"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = 0.1,
						},
						["deadzone"] = 0.15,
						["invert"] = false,
						["saturationX"] = 1,
						["saturationY"] = 1,
						["slider"] = false,
					},
					["key"] = "JOY_Y",
				},
			},
			["name"] = "Pitch",
		},
		["a2002cdnil"] = {
			["changed"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = 0.25,
						},
						["deadzone"] = 0.15,
						["invert"] = false,
						["saturationX"] = 1,
						["saturationY"] = 1,
						["slider"] = false,
					},
					["key"] = "JOY_X",
				},
			},
			["name"] = "Roll",
		},
		["a2003cdnil"] = {
			["changed"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = 0.25,
						},
						["deadzone"] = 0.15,
						["invert"] = false,
						["saturationX"] = 1,
						["saturationY"] = 1,
						["slider"] = false,
					},
					["key"] = "JOY_RZ",
				},
			},
			["name"] = "Rudder",
		},
		["a2010cdnil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_RX",
				},
			},
			["name"] = "Absolute Camera Horizontal View",
		},
		["a2011cdnil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_RY",
				},
			},
			["name"] = "Absolute Camera Vertical View",
		},
		["a3162cdnil"] = {
			["added"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = 0,
						},
						["deadzone"] = 0,
						["invert"] = true,
						["saturationX"] = 1,
						["saturationY"] = 1,
						["slider"] = true,
					},
					["key"] = "JOY_SLIDER1",
				},
			},
			["name"] = "Wheel Brake Left",
		},
		["a3163cdnil"] = {
			["added"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = 0,
						},
						["deadzone"] = 0,
						["invert"] = true,
						["saturationX"] = 1,
						["saturationY"] = 1,
						["slider"] = true,
					},
					["key"] = "JOY_SLIDER2",
				},
			},
			["name"] = "Wheel Brake Right",
		},
	},
	["keyDiffs"] = {
		["d3107pnilu3107cd32vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN3",
				},
			},
			["name"] = "Chaff AUTO Pushbutton (ALE-29A Salvo)",
		},
	},
}
return diff
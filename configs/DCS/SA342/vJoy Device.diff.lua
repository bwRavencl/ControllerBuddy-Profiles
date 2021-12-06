local diff = {
	["axisDiffs"] = {
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
		["a2013cdnil"] = {
			["changed"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = 0.1,
						},
						["deadzone"] = 0.15,
						["invert"] = false,
						["saturationX"] = 1,
						["saturationY"] = 0.6,
						["slider"] = false,
					},
					["key"] = "JOY_Y",
				},
			},
			["name"] = "Flight Control Cyclic Pitch",
		},
		["a2014cdnil"] = {
			["changed"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = 0.1,
						},
						["deadzone"] = 0.15,
						["invert"] = false,
						["saturationX"] = 1,
						["saturationY"] = 0.6,
						["slider"] = false,
					},
					["key"] = "JOY_X",
				},
			},
			["name"] = "Flight Control Cyclic Roll",
		},
		["a2015cdnil"] = {
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
			["name"] = "Flight Control Rudder",
		},
	},
	["keyDiffs"] = {
		["d3003pnilu3004cd8vd1vpnilvu0"] = {
			["name"] = "Trim: Nose Down",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_U",
				},
			},
		},
		["d3005pnilu3006cd8vd1vpnilvu0"] = {
			["name"] = "Trim: Nose Up",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_D",
				},
			},
		},
		["d3009pnilu3010cd8vd1vpnilvu0"] = {
			["name"] = "Trim: Left Wing Down",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_L",
				},
			},
		},
		["d3011pnilu3012cd8vd1vpnilvu0"] = {
			["name"] = "Trim: Right Wing Down",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_R",
				},
			},
		},
	},
}
return diff
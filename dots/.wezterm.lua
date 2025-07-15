local wezterm = require("wezterm")

local config = wezterm.config_builder()

------- _____Start_____ -------

------- Theme and text -----
--config.color_scheme = 'Sweet Terminal (Gogh)'
--config.color_scheme = 'Catppuccin Mocha (Gogh)'
--config.color_scheme = 'Mariana'
--config.color_scheme = "ChallengerDeep"

--config.color_scheme = 'Abernathy'
--config.color_scheme = 'Builtin Dark'
--config.color_scheme = 'CGA'
--config.color_scheme = 'Dark Pastel'
--config.color_scheme = 'Elementary (Gogh)'
--config.color_scheme = 'Firefly Traditional'
--config.color_scheme = 'Gnometerm (terminal.sexy)'
--config.color_scheme = 'iTerm2 Dark Background'
--config.color_scheme = 'Konsolas'
--config.color_scheme = 'Liquid Carbon Transparent (Gogh)'
--config.color_scheme = 'Monokai Vivid'
--config.color_scheme = 'NightLion v1'
--config.color_scheme = 'Orangish (terminal.sexy)'
--config.color_scheme = 'Pro'  
--config.color_scheme = 'Symfonic'
--config.color_scheme = 'Tomorrow Night Bright'
--config.color_scheme = 'UltraDark'
config.color_scheme = 'VibrantInk'
--config.color_scheme = 'Windows NT (base16)'
config.font = wezterm.font("JetBrains Mono")
config.text_background_opacity = 1
config.initial_rows = 26
config.initial_cols = 80

----- Background -----
--[[
config.background = {
	{
		source = {
			File = "Pictures/islands.jpg",
			--File = 'Pictures/streetlamp.jpg',
			--File = '',
		},
		height = "Cover",
		width = "Cover",
		hsb = {
			brightness = 0.225,
			saturation = 1.25,
			hue = 1.1,
		},
		opacity = 0.95,
	},
}
--]]
config.window_background_opacity = 0.50

------- Tab Bar ------
config.enable_tab_bar = false 

config.window_frame = {
	font = wezterm.font({ family = "JetBrains Mono", weight = "Bold" }),
	font_size = 10.5,
	active_titlebar_bg = "#161626",
}

config.colors = {
	tab_bar = {
		inactive_tab_edge = "#744fb3",
	},
}

-- Fixing gnome title bar problem:
config.enable_wayland = false

------ Startup -------
config.default_prog = { "bash" }

return config

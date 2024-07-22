local wezterm = require("wezterm")
local home = os.getenv("HOME")
local padding = {
	left = "0.0cell",
	right = "0.0cell",
	top = "0.0cell",
	bottom = "0.0cell",
}

-- Reload the configuration every ten minutes
wezterm.time.call_after(600, function()
	wezterm.reload_configuration()
end)
wezterm.add_to_config_reload_watch_list(home .. "/.cache/wal/colors-alacritty.toml")
return {
	color_scheme_dirs = { home .. "/.cache/wal" },
	color_scheme = "color-alacritty",
	enable_wayland = false,
	enable_tab_bar = false,
	font_size = 10.0,
	font = wezterm.font("IosevkaLyteTerm"),
	window_padding = padding,
	line_height = 1,
	window_background_image_hsb = {
		brightness = 0.01,
		hue = 1.0,
		saturation = 0.5,
	},
	window_background_opacity = 0.92,
	window_decorations = "RESIZE",
	mouse_bindings = {
		-- Ctrl-click will open the link under the mouse cursor
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},
}

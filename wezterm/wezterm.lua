local wezterm = require("wezterm")
local mux = wezterm.mux
local padding = {
	left = "0px",
	right = "0px",
	top = "0px",
	bottom = "0px",
}

-- Reload the configuration every ten minutes
wezterm.time.call_after(600, function()
	wezterm.reload_configuration()
end)

wezterm.on("gui_startup", function()
	local window = mux.spawn_window({})
	window:gui_window():maximize()
end)

return {
	enable_wayland = false,
	enable_tab_bar = false,
	font_size = 11.0,
	font = wezterm.font_with_fallback({ "Iosevka", { family = "Symbols Nerd Font", scale = 0.85 } }),
	window_padding = padding,
	line_height = 1,
	window_background_image_hsb = {
		brightness = 0.10,
		hue = 0.8,
		saturation = 0.8,
	},
	window_decorations = "NONE",
	mouse_bindings = {
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},
	window_frame = {
		border_left_width = "0.0cell",
		border_right_width = "0.0cell",
		border_bottom_height = "0.0cell",
		border_top_height = "0.0cell",
	},
}

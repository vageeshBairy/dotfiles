local wezterm = require("wezterm")
local mux = wezterm.mux
local padding = {
	left = "0",
	right = "0",
	top = "0",
	bottom = "0",
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
	enable_scroll_bar = false,
	font_size = 10.50,
	font = wezterm.font_with_fallback({
		{ family = "JetBrains Mono NL", scale = 1.00 },
		{ family = "Symbols Nerd Font", scale = 0.94 },
	}),
	window_padding = padding,
	line_height = 1.00,
	window_decorations = "NONE",
	mouse_bindings = {
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},
	window_background_opacity = 1.00,
	window_frame = {
		border_left_width = "0.0cell",
		border_right_width = "0.0cell",
		border_bottom_height = "0.0cell",
		border_top_height = "0.0cell",
	},
}

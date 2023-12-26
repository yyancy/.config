-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This table will hold the configuration.
local config = {}
-- config.use_ime = true
-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

require("tabs").setup(config)
require("links").setup(config)
require("keys").setup(config)

-- set PowerShell for windows
if wezterm.target_triple:find("windows") then
	config.default_prog = { "pwsh" }
	config.window_decorations = "RESIZE|TITLE"
	config.default_cursor_style = "BlinkingBar"
end

-- config.underline_thickness = 3
-- config.cursor_thickness = 4
-- config.underline_position = -6

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "AdventureTime"
config.window_background_opacity = 0.8
-- config.harfbuzz_features = { "liga=1" }
-- Source Han Sans CN
-- config.font = wezterm.font({ family = "Fira Code", harfbuzz_features = { "calt=1", "clig=1", "liga=1" } })
config.font = wezterm.font_with_fallback({
	{ family = "Fira Code", harfbuzz_features = { "calt=1", "clig=1", "liga=1" } },
	-- 我的天空
	{ family = "Source Han Sans CN", scale = 1.1 },
})
config.font_size = 14.0
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.scrollback_lines = 10000

-- Show which key table is active in the status area
wezterm.on("update-right-status", function(window, pane)
	local name = window:active_key_table()
	if name then
		name = "TABLE: " .. name
	end
	window:set_right_status(name or "")
end)

config.mouse_bindings = {
	{
		event = { Down = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = wezterm.action_callback(function(window, pane)
			window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
		end),
	},
}

config.quick_select_patterns = {
	-- "^.*?$",
}

-- and finally, return the configuration to wezterm
return config

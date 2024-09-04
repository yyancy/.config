-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This table will hold the configuration.
local config = wezterm.config_builder()

require("tabs").setup(config)
require("links").setup(config)
require("keys").setup(config)

-- set PowerShell for windows
if wezterm.target_triple:find("windows") then
	config.default_prog = { "pwsh" }
	config.window_decorations = "RESIZE|TITLE"
	wezterm.on("gui-startup", function(cmd)
		local screen = wezterm.gui.screens().active
		local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
		local gui = window:gui_window()
		local width = 0.7 * screen.width
		local height = 0.7 * screen.height
		gui:set_inner_size(width, height)
		gui:set_position((screen.width - width) / 2, (screen.height - height) / 2)
	end)
end

-- This is where you actually apply your config choices
-- Colorscheme
config.color_scheme_dirs = { wezterm.home_dir .. "/.config/tokyonight.nvim/extras/wezterm" }
config.color_scheme = "tokyonight_night"

config.window_background_opacity = 0.8
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.scrollback_lines = 10000

config.font_size = 12.0
config.bold_brightens_ansi_colors = true
-- config.harfbuzz_features = { "liga=1" }
-- config.font = wezterm.font({ family = "Fira Code" })
-- config.font = wezterm.font({ family = "Fira Code", harfbuzz_features = { "calt=1", "clig=1", "liga=1" } })
config.font = wezterm.font_with_fallback({
	{ family = "Fira Code" },
	{ family = "Maple Mono NF CN", scale = 1.1 },
	-- 我的天空
	-- { family = "Source Han Sans CN", scale = 1.1 },
})

config.font_rules = {
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font({ family = "Maple Mono NF CN", weight = "Bold", style = "Italic" }),
	},
	{
		italic = true,
		intensity = "Half",
		font = wezterm.font({ family = "Maple Mono NF CN", weight = "DemiBold", style = "Italic" }),
	},
	{
		italic = true,
		intensity = "Normal",
		font = wezterm.font({ family = "Maple Mono NF CN", style = "Italic" }),
	},
}

-- Show which key table is active in the status area
wezterm.on("update-right-status", function(window, pane)
	local name = window:active_key_table()
	if name then
		name = "TABLE: " .. name
	end
	window:set_right_status(name or "")
end)

-- Mouse bindings
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
	"\\S{5,100}",
	-- ".{6,100}",
}

-- Cursor
config.default_cursor_style = "BlinkingBar"
-- config.force_reverse_video_cursor = true
-- and finally, return the configuration to wezterm
return config

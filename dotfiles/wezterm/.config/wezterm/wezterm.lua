local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- 🖋️ Font settings
config.font = wezterm.font_with_fallback({
	"FiraCode Nerd Font Mono",
	"JetBrains Mono",
})

config.font_size = 14
-- config.line_height = 1.1

-- 🎨 Appearance
config.color_scheme = "Tokyo Night" -- Try "Builtin Solarized Dark" if unavailable
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.colors = {
	tab_bar = {
		background = "#1a1b26", -- Adjust to match your color scheme
		active_tab = {
			bg_color = "#2f2a40", -- Active tab background color
			fg_color = "#a3ec71", -- Active tab text color
		},
		inactive_tab = {
			bg_color = "#1a1b26", -- Inactive tab background color
			fg_color = "#3b4261", -- Inactive tab text color
		},
	},
}

-- 🖼️ Padding
config.window_padding = {
	left = 7,
	right = 0,
	top = 7,
	bottom = 0,
}

-- 🔲 Window behavior
-- config.initial_rows = 32
-- config.initial_cols = 100
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8

-- 🔀 Shell selector (Windows)
-- config.default_prog = wezterm.target_triple == "x86_64-pc-windows-msvc" and {
-- 	"powershell.exe",
-- 	"-NoLogo",
-- } or nil

config.default_prog = { "fish" }

-- ⌨️ Keybindings
-- keys = {
-- 	{ key = "Enter", mods = "ALT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
-- 	{ key = "\\", mods = "ALT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
-- 	{ key = "t", mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
-- 	{ key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
-- 	{ key = "h", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },
-- 	{ key = "l", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Right") },
-- 	{ key = "k", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Up") },
-- 	{ key = "j", mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Down") },
-- },

-- 🧠 Behavior
config.use_dead_keys = false
config.scrollback_lines = 10000

-- Tab bar settings
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_frame = {
	font_size = 14, -- Adjust as needed
	-- font = wezterm.font("JetBrains Mono"),
}

return config

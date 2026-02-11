local wezterm = require("wezterm")
local act = wezterm.action

-- local function isViProcess(pane)
-- 	-- get_foreground_process_name On Linux, macOS and Windows,
-- 	-- the process can be queried to determine this path. Other operating systems
-- 	-- (notably, FreeBSD and other unix systems) are not currently supported
-- 	return pane:get_foreground_process_name():find("n?vim") ~= nil or pane:get_title():find("n?vim") ~= nil
-- end
--
-- local function conditionalActivatePane(window, pane, pane_direction, vim_direction)
-- 	if isViProcess(pane) then
-- 		window:perform_action(
-- 			-- This should match the keybinds you set in Neovim.
-- 			act.SendKey({ key = vim_direction, mods = "ALT" }),
-- 			pane
-- 		)
-- 	else
-- 		window:perform_action(act.ActivatePaneDirection(pane_direction), pane)
-- 	end
-- end
--
-- wezterm.on("ActivatePaneDirection-right", function(window, pane)
-- 	conditionalActivatePane(window, pane, "Right", "l")
-- end)
-- wezterm.on("ActivatePaneDirection-left", function(window, pane)
-- 	conditionalActivatePane(window, pane, "Left", "h")
-- end)
-- wezterm.on("ActivatePaneDirection-up", function(window, pane)
-- 	conditionalActivatePane(window, pane, "Up", "k")
-- end)
-- wezterm.on("ActivatePaneDirection-down", function(window, pane)
-- 	conditionalActivatePane(window, pane, "Down", "j")
-- end)

local config = {
	harfbuzz_features = { "calt = 0", "clig = 0", "liga = 0" },
	audible_bell = "Disabled",
	check_for_updates = false,
	color_scheme = "AdventureTime",
	inactive_pane_hsb = {
		hue = 1.0,
		saturation = 1.0,
		brightness = 1.0,
	},
	font_size = 9.0,
	font = wezterm.font_with_fallback {
		-- "GohuFont 11 Nerd Font Mono",
		-- "ProggyClean Nerd Font Mono",
		"JetBrains Mono",
	},
	launch_menu = {},
	leader = { key = "c", mods = "ALT" },
	disable_default_key_bindings = true,
	keys = {
		{ key = "P", mods = "LEADER", action = act({ SplitVertical = { domain = "DefaultDomain" } }) },
		{ key = "p", mods = "LEADER", action = act({ SplitHorizontal = { domain = "DefaultDomain" } }) },
		{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
		-- { key = "c", mods = "LEADER", action = act({ SpawnTab = "CurrentPaneDomain" }) },
		{ key = "c", mods = "LEADER", action = act({ SpawnTab = "DefaultDomain" }) },
		{ key = "h", mods = "ALT|CTRL", action = act.ActivatePaneDirection 'Left'},
		{ key = "j", mods = "ALT|CTRL", action = act.ActivatePaneDirection 'Down'},
		{ key = "k", mods = "ALT|CTRL", action = act.ActivatePaneDirection 'Up'},
		{ key = "l", mods = "ALT|CTRL", action = act.ActivatePaneDirection 'Right'},
		{ key = "H", mods = "ALT", action = act({ ActivateTabRelative = -1 }) },
		{ key = "J", mods = "LEADER|SHIFT", action = act({ AdjustPaneSize = { "Down", 5 } }) },
		{ key = "K", mods = "LEADER|SHIFT", action = act({ AdjustPaneSize = { "Up", 5 } }) },
		{ key = "L", mods = "ALT", action = act({ ActivateTabRelative = 1 }) },
		{ key = "H", mods = "CTRL", action = act({ MoveTabRelative = -1 }) },
		{ key = "L", mods = "CTRL", action = act({ MoveTabRelative = 1 }) },
		{ key = "1", mods = "ALT", action = act({ ActivateTab = 0 }) },
		{ key = "2", mods = "ALT", action = act({ ActivateTab = 1 }) },
		{ key = "3", mods = "ALT", action = act({ ActivateTab = 2 }) },
		{ key = "4", mods = "ALT", action = act({ ActivateTab = 3 }) },
		{ key = "5", mods = "ALT", action = act({ ActivateTab = 4 }) },
		{ key = "6", mods = "ALT", action = act({ ActivateTab = 5 }) },
		{ key = "7", mods = "ALT", action = act({ ActivateTab = 6 }) },
		{ key = "8", mods = "ALT", action = act({ ActivateTab = 7 }) },
		{ key = "9", mods = "ALT", action = act({ ActivateTab = 8 }) },
		{ key = "0", mods = "ALT", action = act({ ActivateTab = 9 }) },
		{ key = "&", mods = "LEADER|SHIFT", action = act({ CloseCurrentTab = { confirm = true } }) },
		{ key = "x", mods = "LEADER", action = act({ CloseCurrentPane = { confirm = true } }) },
		{ key = "n", mods = "SHIFT|CTRL", action = "ToggleFullScreen" },
		{ key = "v", mods = "SHIFT|CTRL", action = act.PasteFrom("Clipboard") },
		{ key = "c", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
		{ key = "+", mods = "SHIFT|CTRL", action = "IncreaseFontSize" },
		{ key = "-", mods = "CTRL", action = "DecreaseFontSize" },
		{ key = "0", mods = "SHIFT|CTRL", action = "ResetFontSize" },
	},
	set_environment_variables = {},
}

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "powershell.exe"}
else
	config.default_prog = { "/bin/bash", "-l" }
end

return config

local wezterm = require 'wezterm'
local MOD     = "CTRL|SHIFT"
local act     = wezterm.action
-- Registrar función
wezterm.on('open-vscode-here', require('functions.open-vscode-here'))
local set_tab_title = require 'functions.set-tab-title'

return {
	-- *DEFAULT KEYS
	{ key = '+',          mods = 'CTRL',     action = act.IncreaseFontSize },
	{ key = '-',          mods = 'CTRL',     action = act.DecreaseFontSize },
	{ key = '0',          mods = 'CTRL',     action = act.ResetFontSize },
	{ key = 'c',          mods = MOD,        action = act.CopyTo("Clipboard") },
	{ key = 'v',          mods = MOD,        action = act.PasteFrom("Clipboard") },
	-- { key = "l",          mods = "CTRL",     action = act.ClearScrollback("ScrollbackOnly") },
	-- *TABS - WINDOWS
	{ key = "t",          mods = "CTRL",     action = act.SpawnTab("CurrentPaneDomain") },     -- nueva pestaña
	{ key = "h",          mods = "CTRL",     action = act.SplitVertical },                     -- divide el panel actual verticalmente
	{ key = "v",          mods = "CTRL",     action = act.SplitHorizontal },                   -- divide el panel actual horizontalmente
	{ key = "t",          mods = MOD,        action = act.CloseCurrentTab { confirm = false } }, -- cerrar pestaña
	{ key = "w",          mods = MOD,        action = act.CloseCurrentPane { confirm = false } }, -- cerrar panel actual
	-- *FOCUS
	{ key = "LeftArrow",  mods = MOD,        action = act.ActivateTabRelative(-1) },           -- ir a la pestaña anterior
	{ key = "RightArrow", mods = MOD,        action = act.ActivateTabRelative(1) },            -- ir a la pestaña siguiente
	{ key = "LeftArrow",  mods = "CTRL",     action = act.ActivatePaneDirection("Left") },     -- mover al panel vecino izquierdo
	{ key = "RightArrow", mods = "CTRL",     action = act.ActivatePaneDirection("Right") },    -- mover al panel vecino derecho
	{ key = "UpArrow",    mods = "CTRL",     action = act.ActivatePaneDirection("Up") },       -- mover al panel vecino arriba
	{ key = "DownArrow",  mods = "CTRL",     action = act.ActivatePaneDirection("Down") },     -- mover al panel vecino abajo
	-- *REDIMENSIONAR
	{ key = "LeftArrow",  mods = "ALT",      action = act.AdjustPaneSize({ "Left", 2 }) },     -- redimensionar panel a la izquierda
	{ key = "RightArrow", mods = "ALT",      action = act.AdjustPaneSize({ "Right", 2 }) },    -- redimensionar panel a la derecha
	{ key = "UpArrow",    mods = "ALT",      action = act.AdjustPaneSize({ "Up", 2 }) },       -- redimensionar panel hacia arriba
	{ key = "DownArrow",  mods = "ALT",      action = act.AdjustPaneSize({ "Down", 2 }) },     -- redimensionar panel hacia abajo
	-- *FUNCTION
	{ key = "F2",         mods = "SHIFT",    action = set_tab_title() },
	{ key = 'e',          mods = 'CTRL|ALT', action = act.EmitEvent('open-vscode-here') },
}

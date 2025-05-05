local wezterm = require 'wezterm'

local MOD = "CTRL|SHIFT"

return {
	-- F5 para recargar la configuración
	{ key = "F5", action = wezterm.action.ReloadConfiguration, },

	-- TABS - WINDOWS

	-- nueva pestaña
	{ key = "t", mods = "CTRL", action = wezterm.action.SpawnTab("CurrentPaneDomain"), },
	-- cerrar pestaña
	{ key = "t", mods = MOD, action = wezterm.action.CloseCurrentTab { confirm = true }, },
	-- divide el panel actual verticalmente
	{ key = "h", mods = "CTRL", action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }, },
	-- divide el panel actual horizontalmente
	{ key = "v", mods = "CTRL", action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }, },
	-- cerrar panel actual
	{ key = "w", mods = MOD, action = wezterm.action.CloseCurrentPane { confirm = true }, },


	-- FOCUS

	-- ir a la pestaña anterior
	{ key = "LeftArrow",  mods = MOD, action = wezterm.action.ActivateTabRelative(-1), },
	-- ir a la pestaña siguiente
	{ key = "RightArrow", mods = MOD, action = wezterm.action.ActivateTabRelative(1), },
	-- mover al panel vecino izquierdo
	{ key = "LeftArrow", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Left"), },
	--  mover al panel vecino derecho
	{ key = "RightArrow", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Right"), },
	-- mover al panel vecino arriba
	{ key = "UpArrow", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Up"), },
	-- mover al panel vecino abajo
	{ key = "DownArrow", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Down"), },


	-- REDIMENSIONAR

	-- redimensionar panel a la izquierda
	{ key = "LeftArrow", mods = "ALT", action = wezterm.action.AdjustPaneSize({ "Left", 2 }), },
	-- redimensionar panel a la derecha
	{ key = "RightArrow", mods = "ALT", action = wezterm.action.AdjustPaneSize({ "Right", 2 }), },
	-- redimensionar panel hacia arriba
	{ key = "UpArrow", mods = "ALT", action = wezterm.action.AdjustPaneSize({ "Up", 2 }), },
	-- redimensionar panel hacia abajo
	{ key = "DownArrow", mods = "ALT", action = wezterm.action.AdjustPaneSize({ "Down", 2 }), },


	-- DEFAULT KEYS
	{ key = '+', mods = 'CTRL', action = wezterm.action.IncreaseFontSize },
	{ key = '-', mods = 'CTRL', action = wezterm.action.DecreaseFontSize },
	{ key = '0', mods = 'CTRL', action = wezterm.action.ResetFontSize },


	-- FUNCTION

	{ key = "F2", mods = "SHIFT",
		action = wezterm.action.PromptInputLine {
			description = "Set tab title",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end)
		},
	},

}

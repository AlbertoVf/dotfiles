local wezterm = require 'wezterm'

return function()
	return wezterm.action.PromptInputLine {
		description = "Set tab title",
		action = wezterm.action_callback(function(window, _pane, line)
			if line then
				window:active_tab():set_title(line)
			end
		end),
	}
end

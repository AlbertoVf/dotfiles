local wezterm = require 'wezterm'

return function()
	wezterm.on('open-vscode-here', function(window, pane)
		local cwd_uri = pane:get_current_working_dir()

		local cwd = cwd_uri.file_path
		pane:send_text('code .\r')
	end)
end

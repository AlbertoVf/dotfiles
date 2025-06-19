local wezterm = require 'wezterm'

return function()
	wezterm.on('open-uri', function(window, pane, uri)
		if not uri:find('^file:') or pane:is_alt_screen_active() then return end

		local url = wezterm.url.parse(uri)
		local success, stdout = wezterm.run_child_process { 'file', '--brief', '--mime-type', url.file_path, }
		local editor = 'code'
		local mime = stdout:lower()

		if not success then return end
		if mime:find('directory') then
			pane:send_text(('cd %q && ls -a\r'):format(url.file_path))
		end

		if mime:find('text') then
			local cmd = url.fragment
				and { editor, '+' .. url.fragment, url.file_path }
				or { editor, url.file_path }
			pane:send_text(wezterm.shell_join_args(cmd) .. '\r')
		end

		if mime:find('image') and not mime:find('svg') then
			pane:send_text(wezterm.shell_join_args {
				'wezterm', 'imgcat', url.file_path
			} .. '\r')
		end

		return false
	end)
end

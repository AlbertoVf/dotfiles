local wezterm = require 'wezterm'

local function fn()
	wezterm.on('open-uri', function(window, pane, uri)
		-- local editor = os.getenv('EDITOR') or 'code'
		local editor = 'code'

		if uri:find '^file:' == 1 and not pane:is_alt_screen_active() then
			local url = wezterm.url.parse(uri)
			local success, stdout, _ = wezterm.run_child_process {
				'file',
				'--brief',
				'--mime-type',
				url.file_path,
			}
			if success then
				if stdout:find 'directory' then
					pane:send_text(
						wezterm.shell_join_args { 'cd', url.file_path } .. '\r'
					)
					pane:send_text(wezterm.shell_join_args {
						'ls',
						'-a',
					} .. '\r')
					return false
				end

				if stdout:find 'text' then
					if url.fragment then
						pane:send_text(wezterm.shell_join_args {
							editor,
							'+' .. url.fragment,
							url.file_path,
						} .. '\r')
					else
						pane:send_text(
							wezterm.shell_join_args { editor, url.file_path } .. '\r'
						)
					end
					return false
				end
			end
		end
	end)
end

return fn

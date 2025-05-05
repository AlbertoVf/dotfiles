local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local keys = require 'keys'
config = {
	color_scheme                 = 'Palenight (Gogh)',
	-- Fonts
	font                         = wezterm.font('GeistMono Nerd Font Mono'),
	font_size                    = 12.5,
	-- Mouse and url
	default_cursor_style         = "BlinkingBar",
	-- Window
	scrollback_lines             = 5000,
	window_padding               = {
		left   = 8,
		right  = 8,
		top    = 8,
		bottom = 8
	},
	-- Tabs and layout
	enable_tab_bar               = true,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar            = false,
	show_tab_index_in_tab_bar    = true,
	-- Mapping
	disable_default_key_bindings = true,
	keys                         = keys,

}

return config

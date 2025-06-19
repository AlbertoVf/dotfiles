local wezterm = require 'wezterm'
local config = wezterm.config_builder()
require('functions.open-uri')()
config = {
	-- https://wezterm.org/colorschemes/index.html
	color_scheme                 = 'Catppuccin Frappe',
	-- Fonts
	font                         = wezterm.font('GeistMono Nerd Font Mono', { weight = 'Bold', italic = false }),
	font_size                    = 12.5,
	-- Mouse and url
	default_cursor_style         = "BlinkingBar",
	hyperlink_rules              = require 'hyperlinks_rules',
	quote_dropped_files          = "Windows",
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
	keys                         = require 'keys',
}

return config

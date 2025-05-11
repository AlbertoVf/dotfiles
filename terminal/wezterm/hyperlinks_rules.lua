local wezterm = require 'wezterm'

local hyperlink_rules = wezterm.default_hyperlink_rules()


-- github
table.insert(hyperlink_rules, {
	regex = [[(?<![\w\-/\.])([\w.-]+\/[\w.-]+)(?![\w\-/\.])]],
	format = 'https://www.github.com/$1',
})

-- mails
table.insert(hyperlink_rules, {
	regex = [[\b[\w._%+-]+@[\w.-]+\.[a-zA-Z]{2,15}\b]],
	format = "mailto:$0",
})

-- urls http/s
table.insert(hyperlink_rules, {
	regex = [[https?:\/\/(?:[\w-]+\.)+[a-z]{2,15}(?:\/[^\s\"\)\]\}<>]*)?]],
	format = "$0",
})

-- urls with port
table.insert(hyperlink_rules, {
	regex = [[\bhttps?:\/\/(?:[\w\-]+\.)+[\w\-]+(?::\d+)?(?:\/[^\s"\)\]\}<>]*)?]],
	format = "$0",
})

return hyperlink_rules

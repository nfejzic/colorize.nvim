local theme = require("colorize.colors").setup().theme

local colorize = {}

colorize.normal = {
	a = { bg = theme.syn.fun, fg = theme.ui.bg },
	b = { bg = theme.ui.bg, fg = theme.syn.fun },
	c = { bg = theme.ui.bg_p1, fg = theme.ui.fg },
}

colorize.insert = {
	a = { bg = theme.diag.ok, fg = theme.ui.bg },
	b = { bg = theme.ui.bg, fg = theme.diag.ok },
}

colorize.command = {
	a = { bg = theme.syn.constant, fg = theme.ui.bg },
	b = { bg = theme.ui.bg, fg = theme.syn.operator },
}

colorize.visual = {
	a = { bg = theme.syn.keyword, fg = theme.ui.bg },
	b = { bg = theme.ui.bg, fg = theme.syn.keyword },
}

colorize.replace = {
	a = { bg = theme.syn.special2, fg = theme.ui.bg },
	b = { bg = theme.ui.bg, fg = theme.syn.constant },
}

colorize.inactive = {
	a = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
	b = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim, gui = "bold" },
	c = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
}

if vim.g.colorize_lualine_bold then
	for _, mode in pairs(colorize) do
		mode.a.gui = "bold"
	end
end

return colorize

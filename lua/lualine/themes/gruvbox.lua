local theme = require("gruvbox.colors").setup().theme

local gruvbox = {}

gruvbox.normal = {
  a = { bg = theme.syn.fun, fg = theme.ui.bg_m3 },
  b = { bg = theme.diff.change, fg = theme.syn.fun },
  c = { bg = theme.ui.bg_p1, fg = theme.ui.fg },
}

gruvbox.insert = {
  a = { bg = theme.diag.ok, fg = theme.ui.bg },
  b = { bg = theme.ui.bg, fg = theme.diag.ok },
}

gruvbox.command = {
  a = { bg = theme.syn.operator, fg = theme.ui.bg },
  b = { bg = theme.ui.bg, fg = theme.syn.operator },
}

gruvbox.visual = {
  a = { bg = theme.syn.keyword, fg = theme.ui.bg },
  b = { bg = theme.ui.bg, fg = theme.syn.keyword },
}

gruvbox.replace = {
  a = { bg = theme.syn.special2, fg = theme.ui.bg },
  b = { bg = theme.ui.bg, fg = theme.syn.constant },
}

gruvbox.inactive = {
  a = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
  b = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim, gui = "bold" },
  c = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
}

if vim.g.gruvbox_lualine_bold then
  for _, mode in pairs(gruvbox) do
    mode.a.gui = "bold"
  end
end

return gruvbox

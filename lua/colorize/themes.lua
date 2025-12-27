--TODO:
--PreProc needs its own color
--parameter and field should be different
---@class SyntaxElements
---@field string ColorSpec
---@field variable ColorSpec
---@field number ColorSpec
---@field constant ColorSpec
---@field identifier ColorSpec
---@field parameter ColorSpec
---@field fun ColorSpec
---@field statement ColorSpec
---@field keyword ColorSpec
---@field operator ColorSpec
---@field preproc ColorSpec
---@field type ColorSpec
---@field interface? ColorSpec
---@field regex ColorSpec
---@field deprecated ColorSpec
---@field comment ColorSpec
---@field docComment ColorSpec
---@field punct ColorSpec
---@field special1 ColorSpec
---@field special2 ColorSpec
---@field special3 ColorSpec

---@class DiagnosticsElements
---@field error ColorSpec
---@field ok ColorSpec
---@field warning ColorSpec
---@field info ColorSpec
---@field hint ColorSpec
--
---@class DiffElements
---@field add ColorSpec
---@field delete ColorSpec
---@field change ColorSpec
---@field text ColorSpec
---@field blend number|nil

---@class VCSElements
---@field added ColorSpec
---@field removed ColorSpec
---@field changed ColorSpec

---@class UiElements
---@field fg ColorSpec Default foreground
---@field fg_dim ColorSpec Dimmed foreground
---@field fg_reverse ColorSpec|nil
---@field bg_dim ColorSpec Dimmed background
---@field bg_m3 ColorSpec
---@field bg_m2 ColorSpec
---@field bg_m1 ColorSpec
---@field bg ColorSpec Default background
---@field bg_p1 ColorSpec Lighter background ColorColumn, Folded, Gutter
---@field bg_p2 ColorSpec Lighter background Cursor{Line,Column}, TabLineSel (Selected Items)
---@field bg_gutter ColorSpec {Sign,Fold}Column, LineNr
---@field special ColorSpec SpecialKey
---@field nontext ColorSpec LineNr, NonText
---@field whitespace ColorSpec Whitespace
---@field bg_search ColorSpec
---@field bg_visual ColorSpec
---@field fg_visual ColorSpec|nil
---@field pmenu MenuElements
---@field float FloatElements

---@class FloatElements
---@field fg ColorSpec
---@field bg ColorSpec
---@field fg_border ColorSpec
---@field bg_border ColorSpec

---@class MenuElements
---@field bg ColorSpec
---@field fg ColorSpec
---@field fg_sel ColorSpec
---@field bg_sel ColorSpec
---@field bg_sbar ColorSpec
---@field bg_thumb ColorSpec

---@class ThemeColors
---@field syn SyntaxElements
---@field diag DiagnosticsElements
---@field vcs VCSElements
---@field diff DiffElements
---@field ui UiElements
---@field term ColorSpec[]

---@class Theme
---@field colors ThemeColors

local gruvbox = require('colorize.themes.gruvbox')
local solarized = require('colorize.themes.solarized')
local rose_pine = require('colorize.themes.rose_pine')
local kanagawa = require('colorize.themes.kanagawa')
local kanso = require('colorize.themes.kanso')
local catppuccin = require('colorize.themes.catppuccin')
local everforest = require('colorize.themes.everforest')
local monokai_pro = require('colorize.themes.monokai_pro')
local vague = require('colorize.themes.vague')

---@alias ThemeChoice
---|'gruvbox-dark-hard'
---|'gruvbox-dark-soft'
---|'gruvbox-dark'
---|'gruvbox-light-hard'
---|'gruvbox-light-soft'
---|'gruvbox-light'
---|'solarized-dark-hard'
---|'solarized-dark'
---|'rose-pine-main'
---|'rose-pine-black'
---|'rose-pine-moon'
---|'rose-pine-dawn'
---|'kanagawa-wave'
---|'kanagawa-dragon'
---|'kanagawa-lotus'
---|'kanso-zen'
---|'kanso-ink'
---|'kanso-pearl'
---|'kanso-mist'
---|'catppuccin-latte'
---|'catppuccin-frappe'
---|'catppuccin-macchiato'
---|'catppuccin-mocha'

--- @param get_colors fun(palette: PaletteColors): AllColors
---@return fun(palette: PaletteColors): Theme
local function colorize(get_colors)
	return function(palette)
		local colors = get_colors(palette)

		local c = {
			ui = {
				fg = colors.fg,
				fg_dim = colors.fg_dim,
				special = colors.fg_accent,

				bg = colors.bg,
				bg_dim = colors.bg_dim,
				bg_gutter = colors.bg_chrome,

				bg_m3 = colors.bg_accent,

				bg_p1 = colors.bg_chrome,
				bg_p2 = colors.bg_chrome,

				nontext = colors.nontext,
				whitespace = colors.bg_chrome,

				bg_search = colors.bg_highlight,
				bg_visual = colors.bg_select,

				pmenu = {
					fg = colors.fg,
					fg_sel = "none", -- This is important to make highlights pass-through
					bg = "none",
					bg_sel = colors.bg_accent,
					bg_sbar = colors.bg_accent,
					bg_thumb = colors.bg_accent,
				},

				float = {
					fg = colors.fg,
					bg = colors.bg,
					fg_border = colors.nontext,
					bg_border = colors.bg,
				},
			},

			syn = {
				variable = colors.fg,
				identifier = colors.fg,
				parameter = colors.fg,

				string = colors.br_green,
				number = colors.orange,
				constant = colors.orange,
				regex = colors.yellow,

				operator = colors.orange,
				punct = colors.fg,

				fun = colors.blue,
				statement = colors.magenta,
				keyword = colors.br_magenta,
				preproc = colors.red,

				type = colors.br_yellow,
				interface = colors.br_cyan,

				deprecated = colors.fg_faded, -- prev: katanaGrey...

				comment = colors.fg_faded, -- fujiGrey
				docComment = colors.br_green,

				special1 = colors.cyan,
				special2 = colors.fg_accent,
				special3 = colors.fg_accent,
			},

			vcs = {
				added = colors.faded_green,
				removed = colors.faded_red,
				changed = colors.faded_yellow,
			},

			diff = {
				add = colors.dark_green,
				delete = colors.dark_red,
				change = colors.dark_blue,
				text = colors.faded_green,
				blend = 0,
			},

			diag = {
				ok = colors.br_green,
				error = colors.br_red, -- samuraiRed
				warning = colors.orange,
				info = colors.cyan,
				hint = colors.br_cyan,
			},

			term = {
				colors.bg_chrome, -- black
				colors.red, -- red
				colors.faded_green, -- green
				colors.yellow, -- yellow
				colors.blue, -- blue
				colors.magenta, -- magenta
				colors.cyan, -- cyan
				colors.fg, -- white
				colors.fg_dim, -- bright black
				colors.br_red, -- bright red
				colors.br_green, -- bright green
				colors.br_yellow, -- bright yellow
				colors.br_blue, -- bright blue
				colors.br_magenta, -- bright magenta
				colors.br_cyan, -- bright cyan
				colors.fg_dim, -- bright white
				colors.orange, -- extended color 1
				colors.br_red, -- extended color 2
			},
		}

		return { colors = c }
	end
end

--- @class AllColors
---
--- @field fg string
--- @field fg_accent string
--- @field fg_dim string
--- @field fg_faded string
--- @field nontext string
---
--- @field bg string
--- @field bg_accent string
--- @field bg_chrome string
--- @field bg_dim string
--- @field bg_highlight string
--- @field bg_select string
---
--- @field dark_blue string
--- @field blue string
--- @field br_blue string
---
--- @field cyan string
--- @field br_cyan string
---
--- @field dark_green string
--- @field faded_green string
--- @field br_green string
---
--- @field magenta string
--- @field br_magenta string
---
--- @field dark_red string
--- @field faded_red string
--- @field red string
--- @field br_red string
---
--- @field orange string
---
--- @field faded_yellow string
--- @field yellow string
--- @field br_yellow string

---@type table<ThemeChoice, fun(pc: PaletteColors): Theme>
return {
	["gruvbox-dark-hard"] = gruvbox.dark("hard"),
	["gruvbox-dark-soft"] = gruvbox.dark("soft"),
	["gruvbox-dark"] = gruvbox.dark("none"),
	["gruvbox-light-hard"] = gruvbox.light("hard"),
	["gruvbox-light-soft"] = gruvbox.light("soft"),
	["gruvbox-light"] = gruvbox.light("none"),

	["solarized-dark-hard"] = solarized.dark("hard"),
	["solarized-dark"] = solarized.dark("normal"),

	["rose-pine-main"] = rose_pine.colorize("main"),
	["rose-pine-black"] = rose_pine.colorize("black"),
	["rose-pine-moon"] = rose_pine.colorize("moon"),
	["rose-pine-dawn"] = rose_pine.colorize("dawn"),

	["kanagawa-wave"] = colorize(kanagawa.wave),
	["kanagawa-dragon"] = colorize(kanagawa.dragon),
	["kanagawa-lotus"] = colorize(kanagawa.lotus),

	["kanso-zen"] = kanso.zen(),
	["kanso-ink"] = kanso.ink(),
	["kanso-pearl"] = kanso.pearl(),
	["kanso-mist"] = kanso.mist(),

	["catppuccin-latte"] = colorize(catppuccin.latte),
	["catppuccin-frappe"] = colorize(catppuccin.frappe),
	["catppuccin-macchiato"] = colorize(catppuccin.macchiato),
	["catppuccin-mocha"] = colorize(catppuccin.mocha),

	["everforest-dark-hard"] = everforest.dark("hard"),

	["monokai-pro"] = monokai_pro.dark("pro"),
	["monokai-spectrum"] = monokai_pro.dark("spectrum"),
	["monokai-octagon"] = monokai_pro.dark("octagon"),
	["monokai-ristretto"] = monokai_pro.dark("ristretto"),
	["monokai-machine"] = monokai_pro.dark("machine"),
	["monokai-light"] = monokai_pro.light(),

	["vague"] = colorize(vague.colors),
}

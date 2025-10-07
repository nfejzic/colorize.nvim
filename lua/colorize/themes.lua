local M = {}

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
---@field fg_reverse ColorSpec
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
---@field base_color string

local gruvbox = require('colorize.themes.gruvbox')
local solarized = require('colorize.themes.solarized')
local rose_pine = require('colorize.themes.rose_pine')
local kanagawa = require('colorize.themes.kanagawa')
local kanso = require('colorize.themes.kanso')
local catppuccin = require('colorize.themes.catppuccin')
local everforest = require('colorize.themes.everforest')

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

--- @class Colors
--- @field bg string
--- @field bg1 string
--- @field bg2 string
--- @field bg3 string
--- @field fg string
--- @field fg1 string
--- @field fg2 string
--- @field brightRed string
--- @field neutralRed string
--- @field darkRed string
--- @field brightGreen string
--- @field neutralGreen string
--- @field darkGreen string
--- @field brightYellow string
--- @field neutralYellow string
--- @field brightBlue string
--- @field neutralBlue string
--- @field brightPurple string
--- @field neutralPurple string
--- @field brightAqua string
--- @field neutralAqua string
--- @field darkAqua string
--- @field brightOrange string
--- @field neutralOrange string
--- @field blend number|nil

--- @param colors Colors
--- @return Theme
function M.colorize(colors)
	---@type Theme
	return {
		colors = {
			ui = {
				fg = colors.fg,
				fg_dim = colors.fg1,
				fg_reverse = colors.fg2,

				bg_dim = colors.bg,
				bg_gutter = colors.bg1,

				bg_m3 = colors.bg1,
				bg_m2 = colors.bg,
				bg_m1 = colors.bg2,
				bg = colors.bg,
				bg_p1 = colors.bg1,
				bg_p2 = colors.bg2,

				special = colors.brightRed,
				nontext = colors.bg3,
				whitespace = colors.bg3,

				bg_search = colors.darkAqua,
				bg_visual = colors.bg2,

				pmenu = {
					fg = colors.fg,
					fg_sel = "none", -- This is important to make highlights pass-through
					bg = "none",
					bg_sel = colors.bg1,
					bg_sbar = colors.bg1,
					bg_thumb = colors.bg2,
				},
				float = {
					fg = colors.fg,
					bg = colors.bg,
					fg_border = colors.bg3,
					bg_border = colors.bg,
				},
			},
			syn = {
				string = colors.brightGreen,
				variable = colors.fg,
				number = colors.brightOrange,
				constant = colors.brightOrange,
				identifier = colors.fg,
				parameter = colors.fg,
				fun = colors.brightBlue,
				statement = colors.brightPurple,
				keyword = colors.brightPurple,
				operator = colors.brightOrange,
				preproc = colors.brightRed,
				type = colors.brightYellow,
				regex = colors.neutralYellow,
				deprecated = colors.bg3,
				comment = colors.brightOrange,
				docComment = colors.brightAqua,
				punct = colors.fg,
				special1 = colors.brightAqua,
				special2 = colors.brightRed,
				special3 = colors.brightRed,
			},
			vcs = {
				added = colors.neutralGreen,
				removed = colors.neutralRed,
				changed = colors.neutralOrange,
			},
			diff = {
				add = colors.darkGreen,
				delete = colors.darkRed,
				change = colors.darkAqua,
				text = colors.darkGreen,
				blend = colors.blend,
			},
			diag = {
				ok = colors.brightGreen,
				error = colors.brightRed,
				warning = colors.brightOrange,
				info = colors.brightBlue,
				hint = colors.brightAqua,
			},
			term = {
				colors.bg, -- 0 black
				colors.neutralRed, -- 1 red
				colors.neutralGreen, -- 2 green
				colors.neutralYellow, -- 3 yellow
				colors.neutralBlue, -- 4 blue
				colors.neutralPurple, -- 5 magenta
				colors.neutralAqua, -- 6 cyan
				colors.fg2, -- 7 grey
				colors.bg2, -- 8 bright black
				colors.brightRed, -- 9 bright red
				colors.brightGreen, -- 10 bright green
				colors.brightYellow, -- 11 bright yellow
				colors.brightBlue, -- 12 bright blue
				colors.brightPurple, -- 13 bright magenta
				colors.brightAqua, -- 14 bright cyan
				colors.fg, -- 15 bright white
				colors.brightOrange, -- 16 extended color 1
				colors.brightRed, -- 17 extended color 2
			},
		},
		base_color = colors.bg,
	}
end

---@type table<ThemeChoice, Colors>
M.palettes = {
	["gruvbox-dark-hard"] = gruvbox.dark("hard"),
	["gruvbox-dark-soft"] = gruvbox.dark("soft"),
	["gruvbox-dark"] = gruvbox.dark("normal"),
	["gruvbox-light-hard"] = gruvbox.light("hard"),
	["gruvbox-light-soft"] = gruvbox.light("soft"),
	["gruvbox-light"] = gruvbox.light("normal"),

	["solarized-dark-hard"] = solarized.dark("hard"),
	["solarized-dark"] = solarized.dark("normal"),
	["solarized-light"] = solarized.light(),

	["rose-pine-main"] = rose_pine.main(),
	["rose-pine-black"] = rose_pine.black(),
	["rose-pine-moon"] = rose_pine.moon(),
	["rose-pine-dawn"] = rose_pine.dawn(),

	["kanagawa-wave"] = kanagawa.wave(),
	["kanagawa-dragon"] = kanagawa.dragon(),
	["kanagawa-lotus"] = kanagawa.lotus(),

	["kanso-zen"] = kanso.zen(),
	["kanso-ink"] = kanso.ink(),
	["kanso-mist"] = kanso.mist(),
	["kanso-pearl"] = kanso.pearl(),

	["catppuccin-latte"] = catppuccin.latte(),
	["catppuccin-frappe"] = catppuccin.frappe(),
	["catppuccin-macchiato"] = catppuccin.macchiato(),
	["catppuccin-mocha"] = catppuccin.mocha(),

	["everforest-dark"] = everforest.colors("normal", "dark"),
	["everforest-dark-soft"] = everforest.colors("soft", "dark"),
	["everforest-dark-hard"] = everforest.colors("hard", "dark"),
	["everforest-light"] = everforest.colors("normal", "light"),
	["everforest-light-soft"] = everforest.colors("soft", "light"),
	["everforest-light-hard"] = everforest.colors("hard", "light"),
}

return M

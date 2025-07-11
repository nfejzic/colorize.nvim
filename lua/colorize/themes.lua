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

---@type table<string, fun(pc: PaletteColors): Theme>
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

	["kanagawa-wave"] = kanagawa.wave(),
	["kanagawa-dragon"] = kanagawa.dragon(),
	["kanagawa-lotus"] = kanagawa.lotus(),

	["kanso-zen"] = kanso.zen(),
	["kanso-ink"] = kanso.ink(),
	["kanso-pearl"] = kanso.pearl(),
	["kanso-mist"] = kanso.mist(),

	["catppuccin-latte"] = catppuccin.latte(),
	["catppuccin-frappe"] = catppuccin.frappe(),
	["catppuccin-macchiato"] = catppuccin.macchiato(),
	["catppuccin-mocha"] = catppuccin.mocha(),
}

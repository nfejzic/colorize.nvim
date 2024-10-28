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

---@param contrast "hard"|"soft"|"none"
---@return fun(palette: PaletteColors): ThemeColors
local function gruvbox_dark(contrast)
	if contrast == "hard" then
		return function(palette)
			return {
				ui = {
					fg = palette.light1,
					fg_dim = palette.light2,
					fg_reverse = palette.light4,

					bg_dim = palette.dark0_soft,
					bg_gutter = palette.dark1,

					bg_m3 = palette.dark0,
					bg_m2 = palette.dark0_soft,
					bg_m1 = palette.dark2,
					bg = palette.dark0_hard,
					bg_p1 = palette.dark1,
					bg_p2 = palette.dark3,

					special = palette.neutralPurple,
					nontext = palette.dark4,
					whitespace = palette.dark4,

					bg_search = palette.darkAquaHard,
					bg_visual = palette.dark2,

					pmenu = {
						fg = palette.light1,
						fg_sel = "none", -- This is important to make highlights pass-through
						bg = palette.neutralBlue,
						bg_sel = palette.darkAquaHard,
						bg_sbar = palette.neutralBlue,
						bg_thumb = palette.darkAquaHard,
					},
					float = {
						fg = palette.light2,
						bg = palette.dark0,
						fg_border = palette.dark4,
						bg_border = palette.dark0,
					},
				},
				syn = {
					string = palette.brightGreen,
					variable = palette.light1,
					number = palette.brightOrange,
					constant = palette.brightOrange,
					identifier = palette.light1,
					parameter = palette.light2,
					fun = palette.brightBlue,
					statement = palette.brightPurple,
					keyword = palette.brightPurple,
					operator = palette.brightYellow,
					preproc = palette.brightRed, --lightBlue? deserves its own color
					type = palette.brightYellow,
					regex = palette.neutralYellow,
					deprecated = palette.dark4,
					comment = palette.brightOrange,
					docComment = palette.brightAqua,
					punct = palette.light1,
					special1 = palette.brightBlue,
					special2 = palette.brightRed,
					special3 = palette.brightRed,
				},
				vcs = {
					added = palette.neutralGreen,
					removed = palette.brightRed,
					changed = palette.brightOrange,
				},
				diff = {
					add = palette.darkGreenHard,
					delete = palette.darkRedHard,
					change = palette.dark0_soft,
					text = palette.dark3,
				},
				diag = {
					ok = palette.brightGreen,
					error = palette.brightRed,
					warning = palette.brightOrange,
					info = palette.brightBlue,
					hint = palette.brightAqua,
				},
				term = {
					palette.dark0, -- black
					palette.brightRed, -- red
					palette.neutralGreen, -- green
					palette.neutralYellow, -- yellow
					palette.brightBlue, -- blue
					palette.brightPurple, -- magenta
					palette.neutralAqua, -- cyan
					palette.light2, -- white
					palette.light4, -- bright black
					palette.brightRed, -- bright red
					palette.brightGreen, -- bright green
					palette.brightYellow, -- bright yellow
					palette.brightBlue, -- bright blue
					palette.neutralPurple, -- bright magenta
					palette.neutralAqua, -- bright cyan
					palette.light1, -- bright white
					palette.brightOrange, -- extended color 1
					palette.brightRed, -- extended color 2
				},
			}
		end
	elseif contrast == "soft" then
		return function(palette)
			return {
				ui = {
					fg = palette.light1,
					fg_dim = palette.light2,
					fg_reverse = palette.light4,

					bg_dim = palette.dark0_soft,
					bg_gutter = palette.dark1,

					bg_m3 = palette.dark0,
					bg_m2 = palette.dark0_soft,
					bg_m1 = palette.dark2,
					bg = palette.dark0_soft,
					bg_p1 = palette.dark1,
					bg_p2 = palette.dark3,

					special = palette.neutralPurple,
					nontext = palette.dark4,
					whitespace = palette.dark4,

					bg_search = palette.darkAquaSoft,
					bg_visual = palette.dark2,

					pmenu = {
						fg = palette.light1,
						fg_sel = "none", -- This is important to make highlights pass-through
						bg = palette.neutralBlue,
						bg_sel = palette.darkAquaSoft,
						bg_sbar = palette.neutralBlue,
						bg_thumb = palette.darkAquaSoft,
					},
					float = {
						fg = palette.light2,
						bg = palette.dark0,
						fg_border = palette.dark4,
						bg_border = palette.dark0,
					},
				},
				syn = {
					string = palette.brightGreen,
					variable = palette.light1,
					number = palette.brightOrange,
					constant = palette.brightOrange,
					identifier = palette.light1,
					parameter = palette.light2,
					fun = palette.brightBlue,
					statement = palette.brightPurple,
					keyword = palette.brightPurple,
					operator = palette.brightYellow,
					preproc = palette.brightRed, --lightBlue? deserves its own color
					type = palette.brightYellow,
					regex = palette.neutralYellow,
					deprecated = palette.dark4,
					comment = palette.brightOrange,
					docComment = palette.brightAqua,
					punct = palette.light1,
					special1 = palette.brightBlue,
					special2 = palette.brightRed,
					special3 = palette.brightRed,
				},
				vcs = {
					added = palette.brightGreen,
					removed = palette.brightRed,
					changed = palette.brightOrange,
				},
				diff = {
					add = palette.darkGreenSoft,
					delete = palette.darkRedSoft,
					change = palette.dark0,
					text = palette.dark2,
				},
				diag = {
					ok = palette.brightGreen,
					error = palette.brightRed,
					warning = palette.brightOrange,
					info = palette.brightBlue,
					hint = palette.brightAqua,
				},
				term = {
					palette.dark0, -- black
					palette.brightRed, -- red
					palette.neutralGreen, -- green
					palette.neutralYellow, -- yellow
					palette.brightBlue, -- blue
					palette.brightPurple, -- magenta
					palette.neutralAqua, -- cyan
					palette.light2, -- white
					palette.light4, -- bright black
					palette.brightRed, -- bright red
					palette.brightGreen, -- bright green
					palette.brightYellow, -- bright yellow
					palette.brightBlue, -- bright blue
					palette.neutralPurple, -- bright magenta
					palette.neutralAqua, -- bright cyan
					palette.light1, -- bright white
					palette.brightOrange, -- extended color 1
					palette.brightRed, -- extended color 2
				},
			}
		end
	else
		return function(palette)
			return {
				ui = {
					fg = palette.light1,
					fg_dim = palette.light2,
					fg_reverse = palette.light4,

					bg_dim = palette.dark0,
					bg_gutter = palette.dark1,

					bg_m3 = palette.dark0,
					bg_m2 = palette.dark0,
					bg_m1 = palette.dark2,
					bg = palette.dark0,
					bg_p1 = palette.dark1,
					bg_p2 = palette.dark3,

					special = palette.neutralPurple,
					nontext = palette.dark4,
					whitespace = palette.dark4,

					bg_search = palette.darkAqua,
					bg_visual = palette.dark2,

					pmenu = {
						fg = palette.light1,
						fg_sel = "none", -- This is important to make highlights pass-through
						bg = palette.neutralBlue,
						bg_sel = palette.darkAqua,
						bg_sbar = palette.neutralBlue,
						bg_thumb = palette.darkAqua,
					},
					float = {
						fg = palette.light2,
						bg = palette.dark0,
						fg_border = palette.dark4,
						bg_border = palette.dark0,
					},
				},
				syn = {
					string = palette.brightGreen,
					variable = palette.light1,
					number = palette.brightOrange,
					constant = palette.brightOrange,
					identifier = palette.light1,
					parameter = palette.light2,
					fun = palette.brightBlue,
					statement = palette.brightPurple,
					keyword = palette.brightPurple,
					operator = palette.brightYellow,
					preproc = palette.brightRed, --lightBlue? deserves its own color
					type = palette.brightYellow,
					regex = palette.neutralYellow,
					deprecated = palette.dark4,
					comment = palette.brightOrange,
					docComment = palette.brightAqua,
					punct = palette.light1,
					special1 = palette.brightBlue,
					special2 = palette.brightRed,
					special3 = palette.brightRed,
				},
				vcs = {
					added = palette.brightGreen,
					removed = palette.brightRed,
					changed = palette.brightOrange,
				},
				diff = {
					add = palette.darkGreen,
					delete = palette.darkRed,
					change = palette.dark1,
					text = palette.dark3,
				},
				diag = {
					ok = palette.brightGreen,
					error = palette.brightRed,
					warning = palette.brightOrange,
					info = palette.brightBlue,
					hint = palette.brightAqua,
				},
				term = {
					palette.dark0, -- black
					palette.brightRed, -- red
					palette.neutralGreen, -- green
					palette.neutralYellow, -- yellow
					palette.brightBlue, -- blue
					palette.brightPurple, -- magenta
					palette.neutralAqua, -- cyan
					palette.light2, -- white
					palette.light4, -- bright black
					palette.brightRed, -- bright red
					palette.brightGreen, -- bright green
					palette.brightYellow, -- bright yellow
					palette.brightBlue, -- bright blue
					palette.neutralPurple, -- bright magenta
					palette.neutralAqua, -- bright cyan
					palette.light1, -- bright white
					palette.brightOrange, -- extended color 1
					palette.brightRed, -- extended color 2
				},
			}
		end
	end
end

---@param contrast "hard"|"soft"|"none"
---@return fun(palette: PaletteColors): ThemeColors
local function gruvbox_light(contrast)
	if contrast == "hard" then
		return function(palette)
			return {
				ui = {
					fg = palette.dark1,
					fg_dim = palette.dark2,
					fg_reverse = palette.dark4,

					bg_dim = palette.light0,
					bg_gutter = palette.light1,

					bg_m3 = palette.light0,
					bg_m2 = palette.light0,
					bg_m1 = palette.light2,
					bg = palette.light0_hard,
					bg_p1 = palette.light1,
					bg_p2 = palette.light2,

					special = palette.neutralPurple,
					nontext = palette.light4,
					whitespace = palette.light4,

					bg_search = palette.light0,
					bg_visual = palette.light2,

					pmenu = {
						fg = palette.dark1,
						fg_sel = "none", -- This is important to make highlights pass-through
						bg = palette.light0,
						bg_sel = palette.light1,
						bg_sbar = palette.light2,
						bg_thumb = palette.light1,
					},
					float = {
						fg = palette.dark2,
						bg = palette.light0_hard,
						fg_border = palette.light4,
						bg_border = palette.light0,
					},
				},
				syn = {
					string = palette.neutralGreen,
					variable = palette.dark1,
					number = palette.neutralOrange,
					constant = palette.neutralOrange,
					identifier = palette.dark1,
					parameter = palette.dark2,
					fun = palette.neutralBlue,
					statement = palette.neutralPurple,
					keyword = palette.neutralPurple,
					operator = palette.fadedYellow,
					preproc = palette.neutralRed, --lightBlue? deserves its own color
					type = palette.fadedYellow,
					regex = palette.neutralYellow,
					deprecated = palette.light4,
					comment = palette.neutralOrange,
					docComment = palette.neutralAqua,
					punct = palette.dark1,
					special1 = palette.neutralBlue,
					special2 = palette.neutralRed,
					special3 = palette.neutralRed,
				},
				vcs = {
					added = palette.neutralGreen,
					removed = palette.neutralRed,
					changed = palette.neutralYellow,
				},
				diff = {
					add = palette.darkGreenHard,
					delete = palette.darkRedHard,
					change = palette.light1,
					text = palette.light2,
				},
				diag = {
					ok = palette.brightGreen,
					error = palette.brightRed,
					warning = palette.brightOrange,
					info = palette.brightBlue,
					hint = palette.neutralAqua,
				},
				term = {
					palette.light0, -- black
					palette.brightRed, -- red
					palette.neutralGreen, -- green
					palette.neutralYellow, -- yellow
					palette.brightBlue, -- blue
					palette.brightPurple, -- magenta
					palette.neutralAqua, -- cyan
					palette.dark2, -- white
					palette.dark4, -- bright black
					palette.brightRed, -- bright red
					palette.brightGreen, -- bright green
					palette.brightYellow, -- bright yellow
					palette.brightBlue, -- bright blue
					palette.neutralPurple, -- bright magenta
					palette.neutralAqua, -- bright cyan
					palette.dark1, -- bright white
					palette.brightOrange, -- extended color 1
					palette.brightRed, -- extended color 2
				},
			}
		end
	elseif contrast == "soft" then
		return function(palette)
			return {
				ui = {
					fg = palette.dark1,
					fg_dim = palette.dark2,
					fg_reverse = palette.light4,

					bg_dim = palette.light0_soft,
					bg_gutter = palette.light1,

					bg_m3 = palette.light0,
					bg_m2 = palette.light0_soft,
					bg_m1 = palette.light2,
					bg = palette.light0_soft,
					bg_p1 = palette.light1,
					bg_p2 = palette.light2,

					special = palette.neutralPurple,
					nontext = palette.light4,
					whitespace = palette.light4,

					bg_search = palette.light0,
					bg_visual = palette.light2,

					pmenu = {
						fg = palette.dark1,
						fg_sel = "none", -- This is important to make highlights pass-through
						bg = palette.neutralBlue,
						bg_sel = palette.darkAquaSoft,
						bg_sbar = palette.neutralBlue,
						bg_thumb = palette.darkAquaSoft,
					},
					float = {
						fg = palette.dark2,
						bg = palette.light0_soft,
						fg_border = palette.light4,
						bg_border = palette.light0,
					},
				},
				syn = {
					string = palette.neutralGreen,
					variable = palette.dark1,
					number = palette.neutralOrange,
					constant = palette.neutralOrange,
					identifier = palette.dark1,
					parameter = palette.dark2,
					fun = palette.neutralBlue,
					statement = palette.neutralPurple,
					keyword = palette.neutralPurple,
					operator = palette.fadedYellow,
					preproc = palette.neutralRed, --lightBlue? deserves its own color
					type = palette.fadedYellow,
					regex = palette.neutralYellow,
					deprecated = palette.light4,
					comment = palette.neutralOrange,
					docComment = palette.neutralAqua,
					punct = palette.dark1,
					special1 = palette.neutralBlue,
					special2 = palette.neutralRed,
					special3 = palette.neutralRed,
				},
				vcs = {
					added = palette.neutralGreen,
					removed = palette.neutralRed,
					changed = palette.neutralYellow,
				},
				diff = {
					add = palette.darkGreenSoft,
					delete = palette.darkRedSoft,
					change = palette.light1,
					text = palette.light2,
				},
				diag = {
					ok = palette.neutralGreen,
					error = palette.neutralRed,
					warning = palette.neutralOrange,
					info = palette.neutralBlue,
					hint = palette.neutralAqua,
				},
				term = {
					palette.light0, -- black
					palette.brightRed, -- red
					palette.neutralGreen, -- green
					palette.neutralYellow, -- yellow
					palette.brightBlue, -- blue
					palette.brightPurple, -- magenta
					palette.neutralAqua, -- cyan
					palette.dark2, -- white
					palette.dark4, -- bright black
					palette.brightRed, -- bright red
					palette.brightGreen, -- bright green
					palette.brightYellow, -- bright yellow
					palette.brightBlue, -- bright blue
					palette.neutralPurple, -- bright magenta
					palette.neutralAqua, -- bright cyan
					palette.dark1, -- bright white
					palette.brightOrange, -- extended color 1
					palette.brightRed, -- extended color 2
				},
			}
		end
	else
		return function(palette)
			return {
				ui = {
					fg = palette.dark1,
					fg_dim = palette.dark2,
					fg_reverse = palette.light4,

					bg_dim = palette.light0_soft,
					bg_gutter = palette.light1,

					bg_m3 = palette.light0,
					bg_m2 = palette.light0_soft,
					bg_m1 = palette.light2,
					bg = palette.light0,
					bg_p1 = palette.light1,
					bg_p2 = palette.light2,

					special = palette.neutralPurple,
					nontext = palette.light4,
					whitespace = palette.light4,

					bg_search = palette.light0,
					bg_visual = palette.light2,

					pmenu = {
						fg = palette.dark1,
						fg_sel = "none", -- This is important to make highlights pass-through
						bg = palette.neutralBlue,
						bg_sel = palette.darkAquaSoft,
						bg_sbar = palette.neutralBlue,
						bg_thumb = palette.darkAquaSoft,
					},
					float = {
						fg = palette.dark2,
						bg = palette.light0,
						fg_border = palette.light4,
						bg_border = palette.light0,
					},
				},
				syn = {
					string = palette.neutralGreen,
					variable = palette.dark1,
					number = palette.neutralOrange,
					constant = palette.neutralOrange,
					identifier = palette.dark1,
					parameter = palette.dark2,
					fun = palette.neutralBlue,
					statement = palette.neutralPurple,
					keyword = palette.neutralPurple,
					operator = palette.fadedYellow,
					preproc = palette.neutralRed, --lightBlue? deserves its own color
					type = palette.fadedYellow,
					regex = palette.neutralYellow,
					deprecated = palette.light4,
					comment = palette.neutralOrange,
					docComment = palette.neutralAqua,
					punct = palette.dark1,
					special1 = palette.neutralBlue,
					special2 = palette.neutralRed,
					special3 = palette.neutralRed,
				},
				vcs = {
					added = palette.neutralGreen,
					removed = palette.neutralRed,
					changed = palette.neutralYellow,
				},
				diff = {
					add = palette.darkGreenSoft,
					delete = palette.darkRedSoft,
					change = palette.light1,
					text = palette.light2,
				},
				diag = {
					ok = palette.neutralGreen,
					error = palette.neutralRed,
					warning = palette.neutralOrange,
					info = palette.neutralBlue,
					hint = palette.neutralAqua,
				},
				term = {
					palette.light0, -- black
					palette.brightRed, -- red
					palette.neutralGreen, -- green
					palette.neutralYellow, -- yellow
					palette.brightBlue, -- blue
					palette.brightPurple, -- magenta
					palette.neutralAqua, -- cyan
					palette.dark2, -- white
					palette.dark4, -- bright black
					palette.brightRed, -- bright red
					palette.brightGreen, -- bright green
					palette.brightYellow, -- bright yellow
					palette.brightBlue, -- bright blue
					palette.neutralPurple, -- bright magenta
					palette.neutralAqua, -- bright cyan
					palette.dark1, -- bright white
					palette.brightOrange, -- extended color 1
					palette.brightRed, -- extended color 2
				},
			}
		end
	end
end

---@param variant "hard"|"normal"
---@return fun(palette: PaletteColors): ThemeColors
local function solarized_dark(variant)
	return function(palette)
		local visual = palette.sol_base02
		if variant == "hard" then
			visual = palette.sol_base03
			palette.sol_base03 = palette.sol_base03_hard
		end

		return {
			ui = {
				fg = palette.sol_base0,
				fg_dim = palette.sol_base00,
				fg_reverse = palette.sol_base3,

				bg_dim = palette.sol_base01,
				bg_gutter = palette.sol_base02,

				bg_m3 = palette.sol_base01,
				bg_m2 = palette.sol_base00,
				bg_m1 = palette.dark2,
				bg = palette.sol_base03,
				bg_p1 = palette.sol_base02,
				bg_p2 = palette.sol_base02,

				special = palette.sol_magenta,
				nontext = palette.sol_base01,
				whitespace = palette.sol_base01,

				bg_search = palette.sol_cyan,
				bg_visual = visual,

				pmenu = {
					fg = palette.sol_base0,
					fg_sel = "none", -- This is important to make highlights pass-through
					bg = palette.sol_base02,
					bg_sel = palette.sol_base01,
					bg_sbar = palette.sol_base01,
					bg_thumb = palette.sol_cyan,
				},
				float = {
					fg = palette.sol_base0,
					bg = palette.sol_base03,
					fg_border = palette.sol_base01,
					bg_border = palette.sol_base03,
				},
			},
			syn = {
				string = palette.sol_green,
				variable = palette.sol_base0,
				number = palette.sol_base0,
				constant = palette.sol_magenta,
				identifier = palette.sol_base0,
				parameter = palette.sol_base0,
				fun = palette.sol_blue,
				statement = palette.sol_violet,
				keyword = palette.sol_magenta,
				operator = palette.sol_yellow,
				preproc = palette.sol_red,
				type = palette.sol_yellow,
				regex = palette.sol_yellow,
				deprecated = palette.sol_base01,
				comment = palette.sol_orange,
				docComment = palette.sol_cyan,
				punct = palette.sol_base0,
				special1 = palette.sol_blue,
				special2 = palette.sol_red,
				special3 = palette.sol_red,
			},
			vcs = {
				added = palette.sol_green,
				removed = palette.sol_red,
				changed = palette.sol_orange,
			},
			diff = {
				add = palette.sol_mix_green,
				delete = palette.sol_mix_red,
				change = palette.sol_mix_base1,
				text = palette.sol_mix_blue,
			},
			diag = {
				ok = palette.sol_green,
				error = palette.sol_red,
				warning = palette.sol_yellow,
				info = palette.sol_blue,
				hint = palette.sol_cyan,
			},
			term = {
				palette.sol_base02, -- black
				palette.sol_red, -- red
				palette.sol_green, -- green
				palette.sol_yellow, -- yellow
				palette.sol_blue, -- blue
				palette.sol_magenta, -- magenta
				palette.sol_cyan, -- cyan
				palette.sol_base2, -- white
				palette.sol_base03, -- bright black
				palette.sol_red, -- bright red
				palette.sol_base01, -- bright green
				palette.sol_base00, -- bright yellow
				palette.sol_blue, -- bright blue
				palette.sol_violet, -- bright magenta
				palette.sol_base1, -- bright cyan
				palette.sol_base3, -- bright white
				palette.sol_orange, -- extended color 1
				palette.sol_red, -- extended color 2
			},
		}
	end
end

return {
	["gruvbox-dark-hard"] = gruvbox_dark("hard"),
	["gruvbox-dark-soft"] = gruvbox_dark("soft"),
	["gruvbox-dark"] = gruvbox_dark("none"),
	["gruvbox-light-hard"] = gruvbox_light("hard"),
	["gruvbox-light-soft"] = gruvbox_light("soft"),
	["gruvbox-light"] = gruvbox_light("none"),
	["solarized-dark-hard"] = solarized_dark("hard"),
	["solarized-dark"] = solarized_dark("normal"),
}

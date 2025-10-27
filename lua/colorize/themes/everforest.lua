local public = {}

local private = {}

---@class Everforest.Colours
local M = {}

---@class EverforestPaletteColors
private.everforest_palette = {
	dark = {
		base = {
			fg = "#d3c6aa",
			red = "#e67e80",
			orange = "#e69875",
			yellow = "#dbbc7f",
			green = "#a7c080",
			aqua = "#83c092",
			blue = "#7fbbb3",
			purple = "#d699b6",
			grey0 = "#7a8478",
			grey1 = "#859289",
			grey2 = "#9da9a0",
			statusline1 = "#a7c080",
			statusline2 = "#d3c6aa",
			statusline3 = "#e67e80",
			none = "NONE",
		},
		hard = {
			bg_dim = "#1e2326",
			bg0 = "#272e33",
			bg1 = "#2e383c",
			bg2 = "#374145",
			bg3 = "#414b50",
			bg4 = "#495156",
			bg5 = "#4f5b58",
			bg_visual = "#4c3743",
			bg_red = "#493b40",
			bg_green = "#3c4841",
			bg_blue = "#384b55",
			bg_yellow = "#45443c",
			bg_purple = "#463f48",
		},
		medium = {
			bg_dim = "#232a2e",
			bg0 = "#2d353b",
			bg1 = "#343f44",
			bg2 = "#3d484d",
			bg3 = "#475258",
			bg4 = "#4f585e",
			bg5 = "#56635f",
			bg_visual = "#543a48",
			bg_red = "#514045",
			bg_green = "#425047",
			bg_blue = "#3a515d",
			bg_yellow = "#4d4c43",
			bg_purple = "#4a444e",

		},
		soft = {
			bg_dim = "#293136",
			bg0 = "#333c43",
			bg1 = "#3a464c",
			bg2 = "#434f55",
			bg3 = "#4d5960",
			bg4 = "#555f66",
			bg5 = "#5d6b66",
			bg_visual = "#5c3f4f",
			bg_red = "#59464c",
			bg_green = "#48584e",
			bg_blue = "#3f5865",
			bg_yellow = "#55544a",
			bg_purple = "#4e4953",
		},
	},

	light = {
		base = {
			fg = "#5c6a72",
			red = "#f85552",
			orange = "#f57d26",
			yellow = "#dfa000",
			green = "#8da101",
			aqua = "#35a77c",
			blue = "#3a94c5",
			purple = "#df69ba",
			grey0 = "#a6b0a0",
			grey1 = "#939f91",
			grey2 = "#829181",
			statusline1 = "#93b259",
			statusline2 = "#708089",
			statusline3 = "#e66868",
			none = "NONE",
		},
		hard = {
			bg_dim = "#f2efdf",
			bg0 = "#fffbef",
			bg1 = "#f8f5e4",
			bg2 = "#f2efdf",
			bg3 = "#edeada",
			bg4 = "#e8e5d5",
			bg5 = "#bec5b2",
			bg_visual = "#f0f2d4",
			bg_red = "#ffe7de",
			bg_green = "#f3f5d9",
			bg_blue = "#ecf5ed",
			bg_yellow = "#fef2d5",
			bg_purple = "#fceced",
		},
		medium = {
			bg_dim = "#efebd4",
			bg0 = "#fdf6e3",
			bg1 = "#f4f0d9",
			bg2 = "#efebd4",
			bg3 = "#e6e2cc",
			bg4 = "#e0dcc7",
			bg5 = "#bdc3af",
			bg_visual = "#eaedc8",
			bg_red = "#fde3da",
			bg_green = "#f0f1d2",
			bg_blue = "#e9f0e9",
			bg_yellow = "#faedcd",
			bg_purple = "#fae8e2",
		},
		soft = {
			bg_dim = "#e5dfc5",
			bg0 = "#f3ead3",
			bg1 = "#eae4ca",
			bg2 = "#e5dfc5",
			bg3 = "#ddd8be",
			bg4 = "#d8d3ba",
			bg5 = "#b9c0ab",
			bg_visual = "#e1e4bd",
			bg_red = "#fadbd0",
			bg_green = "#e5e6c5",
			bg_blue = "#e1e7dd",
			bg_yellow = "#f1e4c5",
			bg_purple = "#f1ddd4",
		},
	},
}

---@return EverforestPaletteColors
function public.palette()
	return private.everforest_palette
end

---@param contrast "hard"|"soft"|"none"
---@return fun(palette: PaletteColors): Theme
function public.dark(contrast)
	---@param palette_colors PaletteColors
	return function(palette_colors)
		local palette = palette_colors.everforest

		local contrast_colors = palette.dark.medium
		local base = palette.dark.base

		if contrast == "hard" then
			contrast_colors = palette.dark.hard
		elseif contrast == "soft" then
			contrast_colors = palette.dark.soft
		end

		local colors = {
			ui = {
				fg = base.fg,
				fg_dim = base.grey0,
				fg_reverse = contrast_colors.bg0,

				bg_dim = contrast_colors.bg_dim,
				bg_gutter = contrast_colors.bg2,

				bg_m3 = contrast_colors.bg3,
				bg_m2 = contrast_colors.bg2,
				bg_m1 = contrast_colors.bg1,
				bg = contrast_colors.bg0,
				bg_p1 = contrast_colors.bg1,
				bg_p2 = contrast_colors.bg2,

				special = base.red,
				nontext = base.grey0,
				whitespace = base.grey0,

				bg_search = base.orange,
				bg_visual = contrast_colors.bg_visual,

				pmenu = {
					fg = base.fg,
					fg_sel = "none", -- This is important to make highlights pass-through
					bg = "none",
					bg_sel = contrast_colors.bg2,
					bg_sbar = contrast_colors.bg2,
					bg_thumb = contrast_colors.bg2,
				},
				float = {
					fg = base.fg,
					bg = contrast_colors.bg0,
					fg_border = contrast_colors.bg3,
					bg_border = contrast_colors.bg0,
				},
			},
			syn = {
				string = base.green,
				variable = base.fg,
				number = base.orange,
				constant = base.orange,
				identifier = base.fg,
				parameter = base.fg,
				fun = base.blue,
				statement = base.purple,
				keyword = base.purple,
				operator = base.orange,
				preproc = base.red,
				type = base.yellow,
				regex = base.yellow,
				deprecated = base.grey0,
				comment = base.orange,
				docComment = base.aqua,
				punct = base.fg,
				special1 = base.aqua,
				special2 = base.red,
				special3 = base.red,
			},
			vcs = {
				added = base.green,
				removed = base.red,
				changed = base.orange,
			},
			diff = {
				add = contrast_colors.bg_green,
				delete = contrast_colors.bg_red,
				change = contrast_colors.bg_blue,
				text = base.green,
			},
			diag = {
				ok = base.green,
				error = base.red,
				warning = base.orange,
				info = base.blue,
				hint = base.aqua,
			},
			term = {
				contrast_colors.bg0, -- black
				base.red, -- red
				base.green, -- green
				base.yellow, -- yellow
				base.blue, -- blue
				base.purple, -- magenta
				base.aqua, -- cyan
				contrast_colors.bg5, -- white
				contrast_colors.bg1, -- bright black
				base.red, -- bright red
				base.green, -- bright green
				base.yellow, -- bright yellow
				base.blue, -- bright blue
				base.purple, -- bright magenta
				base.aqua, -- bright cyan
				base.fg, -- bright white
				base.orange, -- extended color 1
				base.red, -- extended color 2
			},
		}

		return { colors = colors, base_color = contrast_colors.dark0 }
	end
end

---@param contrast "hard"|"soft"|"none"
---@return fun(palette: PaletteColors): Theme
function public.light(contrast)
	return function(palette_colors)
		local palette = palette_colors.gruvbox

		---@class LightGruvboxContrastColors
		local contrast_colors = {
			light0 = palette.light0,
			light0_dim = palette.light0,
		}

		if contrast == "hard" then
			contrast_colors = {
				light0 = palette.light0_hard,
				light0_dim = palette.light0_soft,
			}
		elseif contrast == "soft" then
			contrast_colors = {
				light0 = palette.light0_soft,
				light0_dim = palette.light0_soft,
			}
		end

		local colors = {
			ui = {
				fg = palette.dark1,
				fg_dim = palette.dark2,
				fg_reverse = contrast_colors.light0,

				bg_dim = palette.light0,
				bg_gutter = palette.light1,

				bg_m3 = palette.light0,
				bg_m2 = palette.light0,
				bg_m1 = palette.light2,
				bg = contrast_colors.light0,
				bg_p1 = palette.light1,
				bg_p2 = palette.light2,

				special = palette.neutralPurple,
				nontext = palette.light4,
				whitespace = palette.light4,

				bg_search = palette.brightOrange,
				bg_visual = palette.light2,

				pmenu = {
					fg = palette.dark1,
					fg_sel = "none", -- This is important to make highlights pass-through
					bg = "none",
					bg_sel = palette.light1,
					bg_sbar = palette.light2,
					bg_thumb = palette.light1,
				},
				float = {
					fg = palette.dark2,
					bg = contrast_colors.light0,
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
				parameter = palette.dark1,
				fun = palette.neutralBlue,
				statement = palette.neutralPurple,
				keyword = palette.neutralPurple,
				operator = palette.fadedYellow,
				preproc = palette.neutralRed,
				type = palette.fadedYellow,
				regex = base.yellow,
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
				changed = base.yellow,
			},
			diff = {
				add = palette.darkGreenHard,
				delete = palette.darkRedHard,
				change = palette.light1,
				text = palette.light2,
			},
			diag = {
				ok = palette.brightGreen,
				error = base.red,
				warning = base.orange,
				info = palette.brightBlue,
				hint = palette.neutralAqua,
			},
			term = {
				contrast_colors.light0, -- black
				base.red,   -- red
				palette.neutralGreen, -- green
				base.yellow, -- yellow
				palette.brightBlue, -- blue
				base.purple, -- magenta
				palette.neutralAqua, -- cyan
				palette.dark2, -- white
				base.grey0, -- bright black
				base.red,   -- bright red
				palette.brightGreen, -- bright green
				base.yellow, -- bright yellow
				palette.brightBlue, -- bright blue
				palette.neutralPurple, -- bright magenta
				palette.neutralAqua, -- bright cyan
				palette.dark1, -- bright white
				base.orange, -- extended color 1
				base.red,   -- extended color 2
			},
		}

		return { colors = colors, base_color = contrast_colors.light0 }
	end
end

return public

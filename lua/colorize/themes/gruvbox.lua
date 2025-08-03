local public = {}

local private = {}

---@class GruvboxPaletteColors
private.gruvbox_palette = {
	-- Bg Shades
	dark0_hard = "#1d2021",
	dark0 = "#282828",
	dark0_soft = "#32302f",
	dark1 = "#3c3836",
	dark2 = "#504945",
	dark3 = "#665c54",
	dark4 = "#7c6f64",

	light0_hard = "#f9f5d7",
	light0 = "#fbf1c7",
	light0_soft = "#f2e5bc",
	light1 = "#ebdbb2",
	light2 = "#d5c4a1",
	light3 = "#bdae93",
	light4 = "#a89984",

	gray = "#928374",

	brightRed = "#fb4934",
	neutralRed = "#cc241d",
	fadedRed = "#9d0006",
	darkRedHard = "#792329",
	darkRed = "#722529",
	darkRedSoft = "#7b2c2f",

	brightGreen = "#b8bb26",
	neutralGreen = "#98971a",
	fadedGreen = "#79740e",
	darkGreenHard = "#5a633a",
	darkGreen = "#62693e",
	darkGreenSoft = "#686d43",

	brightYellow = "#fabd2f",
	neutralYellow = "#d79921",
	fadedYellow = "#b57614",

	brightBlue = "#83a598",
	neutralBlue = "#458588",
	fadedBlue = "#076678",

	brightPurple = "#d3869b",
	neutralPurple = "#b16286",
	fadedPurple = "#8f3f71",

	brightAqua = "#8ec07c",
	neutralAqua = "#689d6a",
	fadedAqua = "#427b58",
	darkAquaHard = "#3e4934",
	darkAqua = "#49503b",
	darkAquaSoft = "#525742",

	brightOrange = "#fe8019",
	neutralOrange = "#d65d03",
	fadedOrange = "#af3a03",
}

---@return GruvboxPaletteColors
function public.palette()
	return private.gruvbox_palette
end

---@param contrast "hard"|"soft"|"none"
---@return fun(palette: PaletteColors): Theme
function public.dark(contrast)
	---@param palette_colors PaletteColors
	return function(palette_colors)
		local palette = palette_colors.gruvbox

		---@class GruvboxContrastColors
		local contrast_colors = {
			dark0 = palette.dark0,
			dark0_dim = palette.dark0,
			darkAqua = palette.darkAqua,
			darkRed = palette.darkRed,
		}

		if contrast == "hard" then
			contrast_colors = {
				dark0 = palette.dark0_hard,
				dark0_dim = palette.dark0_soft,
				darkAqua = palette.darkAquaHard,
				darkRed = palette.darkRedHard,
			}
		elseif contrast == "soft" then
			contrast_colors = {
				dark0 = palette.dark0_soft,
				dark0_dim = palette.dark0_soft,
				darkAqua = palette.darkAquaSoft,
				darkRed = palette.darkRedSoft,
			}
		end

		local colors = {
			ui = {
				fg = palette.light1,
				fg_dim = palette.light2,
				fg_reverse = palette.light4,

				bg_dim = contrast_colors.dark0_dim,
				bg_gutter = palette.dark1,

				bg_m3 = palette.dark0,
				bg_m2 = contrast_colors.dark0_dim,
				bg_m1 = palette.dark2,
				bg = contrast_colors.dark0,
				bg_p1 = palette.dark1,
				bg_p2 = palette.dark2,

				special = palette.brightRed,
				nontext = palette.dark4,
				whitespace = palette.dark4,

				bg_search = palette.darkAquaHard,
				bg_visual = palette.dark2,

				pmenu = {
					fg = palette.light1,
					fg_sel = "none", -- This is important to make highlights pass-through
					bg = "none",
					bg_sel = palette.dark1,
					bg_sbar = palette.dark1,
					bg_thumb = palette.dark2,
				},
				float = {
					fg = palette.light2,
					bg = contrast_colors.dark0,
					fg_border = palette.dark4,
					bg_border = contrast_colors.dark0,
				},
			},
			syn = {
				string = palette.brightGreen,
				variable = palette.light1,
				number = palette.brightOrange,
				constant = palette.brightOrange,
				identifier = palette.light1,
				parameter = palette.light1,
				fun = palette.brightBlue,
				statement = palette.brightPurple,
				keyword = palette.brightPurple,
				operator = palette.brightOrange,
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
				add = palette.fadedGreen,
				delete = contrast_colors.darkRed,
				change = contrast_colors.darkAqua,
				text = palette.darkGreenSoft,
			},
			diag = {
				ok = palette.brightGreen,
				error = palette.brightRed,
				warning = palette.brightOrange,
				info = palette.brightBlue,
				hint = palette.brightAqua,
			},
			term = {
				contrast_colors.dark0, -- black
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
				fg_reverse = palette.dark4,

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

				bg_search = palette.light0,
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
				contrast_colors.light0, -- black
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

		return { colors = colors, base_color = contrast_colors.light0 }
	end
end

return public

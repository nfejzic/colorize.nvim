local public = {}
local private = {}

---@class KansoPaletteColors
private.palette = {
	-- Bg Shades
	zen0 = "#090E13",
	zen1 = "#1C1E25",
	zen2 = "#22262D",
	zen3 = "#393B44",

	-- Popup and Floats
	zenBlue1 = "#223249",
	zenBlue2 = "#2D4F67",

	-- Diff and Git
	winterGreen = "#2B3328",
	winterYellow = "#49443C",
	winterRed = "#43242B",
	winterBlue = "#252535",
	autumnGreen = "#76946A",
	autumnRed = "#C34043",
	autumnYellow = "#DCA561",

	-- Diag
	samuraiRed = "#C34043",
	roninYellow = "#DCA561",
	zenAqua1 = "#6A9589",
	inkBlue = "#658594",

	-- Fg and Comments
	oldWhite = "#C5C9C7",
	fujiWhite = "#f2f1ef",

	springViolet1 = "#938AA9",
	springBlue = "#7FB4CA",
	zenAqua2 = "#7AA89F",

	springGreen = "#98BB6C",
	carpYellow = "#E6C384",

	zenRed = "#E46876",
	katanaGray = "#717C7C",

	inkBlack0 = "#14171d",
	inkBlack1 = "#1f1f26",
	inkBlack2 = "#22262D",
	inkBlack3 = "#393B44",
	inkBlack4 = "#4b4e57",

	inkWhite = "#C5C9C7",
	inkGreen = "#87a987",
	inkGreen2 = "#8a9a7b",
	inkPink = "#a292a3",
	inkOrange = "#b6927b",
	inkOrange2 = "#b98d7b",
	inkGray = "#A4A7A4",
	inkGray1 = "#909398",
	inkGray2 = "#75797f",
	inkGray3 = "#5C6066",
	inkBlue2 = "#8ba4b0",
	inkViolet = "#8992a7",
	inkRed = "#c4746e",
	inkAqua = "#8ea4a2",
	inkAsh = "#5C6066",
	inkTeal = "#949fb5",
	inkYellow = "#c4b28a", --"#a99c8b",
	-- "#8a9aa3",

	-- Mist Shades
	mist0 = "#22262D",
	mist1 = "#2a2c35",
	mist2 = "#393B44",
	mist3 = "#5C6066",

	mistWhite = "#C5C9C7",
	mistGreen = "#87a987",
	mistGreen2 = "#8a9a7b",
	mistPink = "#a292a3",
	mistOrange = "#b6927b",
	mistOrange2 = "#b98d7b",
	mistGray = "#A4A7A4",
	mistGray1 = "#909398",
	mistGray2 = "#75797f",
	mistGray3 = "#5C6066",
	mistBlue2 = "#8ba4b0",
	mistViolet = "#8992a7",
	mistRed = "#c4746e",
	mistAqua = "#8ea4a2",
	mistAsh = "#5C6066",
	mistTeal = "#949fb5",
	mistYellow = "#c4b28a",

	pearlInk0 = "#22262D",
	pearlInk1 = "#545464",
	pearlInk2 = "#43436c",
	pearlGray = "#e2e1df",
	pearlGray2 = "#5C6068",
	pearlGray3 = "#6D6D69",
	pearlGray4 = "#9F9F99",

	pearlWhite0 = "#f2f1ef",
	pearlWhite1 = "#e2e1df",
	pearlWhite2 = "#dddddb",
	pearlWhite3 = "#cacac7",
	pearlViolet1 = "#a09cac",
	pearlViolet2 = "#766b90",
	pearlViolet3 = "#c9cbd1",
	pearlViolet4 = "#624c83",
	pearlBlue1 = "#c7d7e0",
	pearlBlue2 = "#b5cbd2",
	pearlBlue3 = "#9fb5c9",
	pearlBlue4 = "#4d699b",
	pearlBlue5 = "#5d57a3",
	pearlGreen = "#6f894e",
	pearlGreen2 = "#6e915f",
	pearlGreen3 = "#b7d0ae",
	pearlPink = "#b35b79",
	pearlOrange = "#cc6d00",
	pearlOrange2 = "#e98a00",
	pearlYellow = "#77713f",
	pearlYellow2 = "#836f4a",
	pearlYellow3 = "#de9800",
	pearlYellow4 = "#f9d791",
	pearlRed = "#c84053",
	pearlRed2 = "#d7474b",
	pearlRed3 = "#e82424",
	pearlRed4 = "#d9a594",
	pearlAqua = "#597b75",
	pearlAqua2 = "#5e857a",
	pearlTeal1 = "#4e8ca2",
	pearlTeal2 = "#6693bf",
	pearlTeal3 = "#5a7785",
	pearlCyan = "#d7e3d8",
}

---@return KansoPaletteColors
function public.palette()
	return private.palette
end

---@return fun(palette: PaletteColors): Theme
function public.zen()
	return function(palette_colors)
		local palette = palette_colors.kanso

		local colors = {
			ui = {
				fg = palette.inkWhite,
				fg_dim = palette.inkGray,
				fg_reverse = palette.zenBlue1,

				bg_dim = palette.zen0,
				bg_gutter = palette.zen1,

				bg_m3 = palette.zen0,
				bg_m2 = palette.inkGray,
				bg_m1 = palette.zen0,
				bg = palette.zen0,
				bg_p1 = palette.zen1,
				bg_p2 = palette.zen1,

				special = palette.inkRed,
				nontext = palette.inkAsh,
				whitespace = palette.inkBlack3,

				bg_search = palette.roninYellow,
				bg_visual = palette.inkBlack3,

				pmenu = {
					fg = palette.inkGray,
					fg_sel = "none", -- This is important to make highlights pass-through
					bg = "none",
					bg_sel = palette.inkBlack3,
					bg_sbar = palette.inkBlack3,
					bg_thumb = palette.inkBlack3,
				},
				float = {
					fg = palette.inkGray,
					bg = palette.zen0,
					fg_border = palette.inkBlack3,
					bg_border = palette.zen0,
				},
			},
			syn = {
				string = palette.inkGreen2,
				variable = palette.inkWhite,
				number = palette.inkOrange,
				constant = palette.inkOrange,
				identifier = palette.inkWhite,
				parameter = palette.inkWhite,
				fun = palette.inkBlue2,
				statement = palette.inkViolet,
				keyword = palette.inkPink,
				operator = palette.inkGray1,
				preproc = palette.inkRed,
				type = palette.inkYellow,
				regex = palette.inkRed,
				deprecated = palette.katanaGray,
				comment = palette.inkOrange,
				docComment = palette.inkGreen2,
				punct = palette.inkWhite,
				special1 = palette.inkYellow,
				special2 = palette.inkRed,
				special3 = palette.inkRed,
			},
			vcs = {
				added = palette.autumnGreen,
				removed = palette.autumnRed,
				changed = palette.autumnYellow,
			},
			diff = {
				add = palette.winterGreen,
				delete = palette.winterRed,
				change = palette.winterBlue,
				text = palette.winterYellow,
				blend = 100,
			},
			diag = {
				ok = palette.springGreen,
				error = palette.samuraiRed,
				warning = palette.roninYellow,
				info = palette.inkBlue,
				hint = palette.zenAqua1,
			},
			term = {
				palette.zen0, -- black
				palette.inkRed, -- red
				palette.inkGreen2, -- green
				palette.inkYellow, -- yellow
				palette.inkBlue2, -- blue
				palette.inkPink, -- magenta
				palette.inkWhite, -- cyan
				palette.inkGray, -- white
				palette.inkGray1, -- bright black
				palette.zenRed, -- bright red
				palette.inkGreen, -- bright green
				palette.carpYellow, -- bright yellow
				palette.springBlue, -- bright blue
				palette.springViolet1, -- bright magenta
				palette.zenAqua2, -- bright cyan
				palette.inkWhite, -- bright white
				palette.inkOrange, -- extended color 1
				palette.inkOrange2, -- extended color 2
			},
		}

		return { colors = colors, base_color = palette.oldWhite }
	end
end

---@return fun(palette: PaletteColors): Theme
function public.ink()
	return function(palette_colors)
		local palette = palette_colors.kanso

		local colors = {
			ui = {
				fg = palette.inkWhite,
				fg_dim = palette.inkGray,
				fg_reverse = palette.zenBlue1,

				bg_dim = palette.inkBlack0,
				bg_gutter = palette.inkBlack1,

				bg_m3 = palette.inkBlack0,
				bg_m2 = palette.inkBlack0,
				bg_m1 = palette.inkBlack0,
				bg = palette.inkBlack0,
				bg_p1 = palette.inkBlack1,
				bg_p2 = palette.inkBlack1,

				special = palette.inkRed,
				nontext = palette.inkAsh,
				whitespace = palette.inkBlack4,

				bg_search = palette.roninYellow,
				bg_visual = palette.inkBlack3,

				pmenu = {
					fg = palette.fujiWhite,
					fg_sel = "none", -- This is important to make highlights pass-through
					bg = "none",
					bg_sel = palette.inkBlack3,
					bg_sbar = palette.inkBlack3,
					bg_thumb = palette.inkBlack2,
				},
				float = {
					fg = palette.inkGray,
					bg = palette.inkBlack0,
					fg_border = palette.inkBlack2,
					bg_border = palette.inkBlack0,
				},
			},
			syn = {
				string = palette.inkGreen2,
				variable = palette.inkWhite,
				number = palette.inkOrange,
				constant = palette.inkOrange,
				identifier = palette.inkWhite,
				parameter = palette.inkWhite,
				fun = palette.inkBlue2,
				statement = palette.inkViolet,
				keyword = palette.inkPink,
				operator = palette.inkGray1,
				preproc = palette.inkRed,
				type = palette.inkYellow,
				regex = palette.inkRed,
				deprecated = palette.katanaGray,
				comment = palette.inkOrange,
				docComment = palette.inkGreen2,
				punct = palette.inkGray1,
				special1 = palette.inkYellow,
				special2 = palette.inkRed,
				special3 = palette.inkRed,
			},
			vcs = {
				added = palette.autumnGreen,
				removed = palette.autumnRed,
				changed = palette.autumnYellow,
			},
			diff = {
				add = palette.winterGreen,
				delete = palette.winterRed,
				change = palette.winterBlue,
				text = palette.winterYellow,
				blend = 100,
			},
			diag = {
				ok = palette.springGreen,
				error = palette.samuraiRed,
				warning = palette.roninYellow,
				info = palette.inkBlue,
				hint = palette.zenAqua1,
			},
			term = {
				palette.inkBlack0, -- black
				palette.inkRed, -- red
				palette.inkGreen2, -- green
				palette.inkYellow, -- yellow
				palette.inkBlue2, -- blue
				palette.inkPink, -- magenta
				palette.inkWhite, -- cyan
				palette.inkGray, -- white
				palette.inkGray1, -- bright black
				palette.zenRed, -- bright red
				palette.inkGreen, -- bright green
				palette.carpYellow, -- bright yellow
				palette.springBlue, -- bright blue
				palette.springViolet1, -- bright magenta
				palette.zenAqua2, -- bright cyan
				palette.inkWhite, -- bright white
				palette.inkOrange, -- extended color 1
				palette.inkOrange2, -- extended color 2
			},
		}

		return { colors = colors, base_color = palette.oldWhite }
	end
end

---@return fun(palette: PaletteColors): Theme
function public.pearl()
	return function(palette_colors)
		local palette = palette_colors.kanso

		local colors = {
			ui = {
				fg = palette.pearlInk0,
				fg_dim = palette.pearlInk1,
				fg_reverse = palette.pearlGray,

				bg_dim = palette.pearlWhite0,
				bg_gutter = palette.pearlWhite1,

				bg_m3 = palette.pearlWhite0,
				bg_m2 = palette.pearlWhite0,
				bg_m1 = palette.pearlWhite0,
				bg = palette.pearlWhite0,
				bg_p1 = palette.pearlWhite1,
				bg_p2 = palette.pearlWhite1,

				special = palette.pearlRed,
				nontext = palette.pearlViolet1,
				whitespace = palette.pearlWhite3,

				bg_search = palette.pearlOrange2,
				bg_visual = palette.pearlWhite2,

				pmenu = {
					fg = palette.pearlInk2,
					fg_sel = "none", -- This is important to make highlights pass-through
					bg = "none",
					bg_sel = palette.pearlWhite2,
					bg_sbar = palette.pearlWhite2,
					bg_thumb = palette.inkBlack2,
				},
				float = {
					fg = palette.pearlInk2,
					bg = palette.pearlWhite0,
					fg_border = palette.pearlGray2,
					bg_border = palette.pearlWhite0,
				},
			},
			syn = {
				string = palette.pearlGreen,
				variable = palette.pearlInk0,
				number = palette.pearlOrange,
				constant = palette.pearlOrange,
				identifier = palette.pearlInk0,
				parameter = palette.pearlInk0,
				fun = palette.pearlBlue4,
				statement = palette.pearlViolet4,
				keyword = palette.pearlPink,
				operator = palette.pearlGray3,
				preproc = palette.pearlRed,
				type = palette.pearlYellow,
				regex = palette.pearlRed,
				deprecated = palette.pearlGray3,
				comment = palette.pearlOrange,
				docComment = palette.pearlGreen,
				punct = palette.pearlGray3,
				special1 = palette.pearlYellow,
				special2 = palette.pearlRed,
				special3 = palette.pearlRed,
			},
			vcs = {
				added = palette.pearlGreen2,
				removed = palette.pearlRed2,
				changed = palette.pearlYellow3,
			},
			diff = {
				add = palette.pearlGreen3,
				delete = palette.pearlRed4,
				change = palette.pearlCyan,
				text = palette.pearlYellow4,
				blend = 100,
			},
			diag = {
				ok = palette.pearlGreen,
				error = palette.pearlRed3,
				warning = palette.pearlOrange2,
				info = palette.pearlTeal3,
				hint = palette.pearlAqua2,
			},
			term = {
				palette.inkBlack2, -- black
				palette.pearlRed, -- red
				palette.pearlGreen, -- green
				palette.pearlYellow, -- yellow
				palette.pearlBlue4, -- blue
				palette.pearlPink, -- magenta
				palette.pearlAqua, -- cyan
				palette.pearlInk0, -- white
				palette.pearlGray3, -- bright black
				palette.pearlRed2, -- bright red
				palette.pearlGreen2, -- bright green
				palette.pearlYellow2, -- bright yellow
				palette.pearlTeal2, -- bright blue
				palette.pearlViolet4, -- bright magenta
				palette.pearlAqua2, -- bright cyan
				palette.pearlInk2, -- bright white
				palette.pearlOrange2, -- extended color 1
				palette.pearlRed3, -- extended color 2
			},
		}

		return { colors = colors, base_color = palette.oldWhite }
	end
end

---@return fun(palette: PaletteColors): Theme
function public.mist()
	return function(palette_colors)
		local palette = palette_colors.kanso

		local colors = {
			ui = {
				fg = palette.mistWhite,
				fg_dim = palette.mistGray,
				fg_reverse = palette.zenBlue1,

				bg_dim = palette.mist0,
				bg_gutter = palette.mist2,

				bg_m3 = palette.mist0,
				bg_m2 = palette.mist0,
				bg_m1 = palette.mist0,
				bg = palette.mist0,
				bg_p1 = palette.mist2,
				bg_p2 = palette.mist2,

				special = palette.mistRed,
				nontext = palette.mistAsh,
				whitespace = palette.mist3,

				bg_search = palette.roninYellow,
				bg_visual = palette.mist2,

				pmenu = {
					fg = palette.fujiWhite,
					fg_sel = "none", -- This is important to make highlights pass-through
					bg = "none",
					bg_sel = palette.mist2,
					bg_sbar = palette.mist2,
					bg_thumb = palette.mist3,
				},
				float = {
					fg = palette.mistGray,
					bg = palette.mist0,
					fg_border = palette.mist2,
					bg_border = palette.mist0,
				},
			},
			syn = {
				string = palette.mistGreen2,
				variable = palette.mistWhite,
				number = palette.mistOrange,
				constant = palette.mistOrange,
				identifier = palette.mistWhite,
				parameter = palette.mistWhite,
				fun = palette.mistBlue2,
				statement = palette.mistViolet,
				keyword = palette.mistPink,
				operator = palette.mistGray1,
				preproc = palette.mistRed,
				type = palette.mistYellow,
				regex = palette.mistRed,
				deprecated = palette.katanaGray,
				comment = palette.mistOrange,
				docComment = palette.mistGreen2,
				punct = palette.mistGray1,
				special1 = palette.mistYellow,
				special2 = palette.mistRed,
				special3 = palette.mistRed,
			},
			vcs = {
				added = palette.autumnGreen,
				removed = palette.autumnRed,
				changed = palette.autumnYellow,
			},
			diff = {
				add = palette.winterGreen,
				delete = palette.winterRed,
				change = palette.winterBlue,
				text = palette.winterYellow,
				blend = 100,
			},
			diag = {
				ok = palette.springGreen,
				error = palette.samuraiRed,
				warning = palette.roninYellow,
				info = palette.inkBlue,
				hint = palette.zenAqua1,
			},
			term = {
				palette.mist0, -- black
				palette.mistRed, -- red
				palette.mistGreen2, -- green
				palette.mistYellow, -- yellow
				palette.mistBlue2, -- blue
				palette.mistPink, -- magenta
				palette.mistWhite, -- cyan
				palette.mistGray, -- white
				palette.mistGray1, -- bright black
				palette.zenRed, -- bright red
				palette.mistGreen, -- bright green
				palette.carpYellow, -- bright yellow
				palette.springBlue, -- bright blue
				palette.springViolet1, -- bright magenta
				palette.zenAqua2, -- bright cyan
				palette.mistWhite, -- bright white
				palette.mistOrange, -- extended color 1
				palette.mistOrange2, -- extended color 2
			},
		}

		return { colors = colors, base_color = palette.oldWhite }
	end
end

return public

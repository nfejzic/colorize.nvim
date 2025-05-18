local public = {}

local private = {}

---@class KanagawaPaletteColors
private.palette = {
	fujiWhite = '#DCD7BA',
	fujiGrey = '#727169',
	oldWhite = '#C8C093',

	sumiInk0 = '#16161D',
	sumiInk1 = '#1F1F28',
	sumiInk2 = '#2A2A37',
	sumiInk3 = '#363646',
	sumiInk4 = '#54546D',

	waveBlue1 = '#223249',
	waveBlue2 = '#2D4F67',

	waveAqua1 = '#6A9589',
	waveAqua2 = '#7AA89F',

	samuraiRed = '#E82424',
	autumnRed = '#C34043',
	autumnYellow = '#DCA561',
	roninYellow = '#FF9E3B',
	peachRed = '#FF5D62',
	crystalBlue = '#7E9CD8',
	dragonBlue = '#658594',
	springGreen = '#98BB6C',
	springBlue = '#7FB4CA',
	autumnGreen = '#76946A',
	winterGreen = '#2B3328',
	winterYellow = '#49443C',
	winterRed = '#43242B',
	winterBlue = '#252535',
	oniViolet = '#957FB8',
	sakuraPink = '#D27E99',
	lightBlue = '#A3D4D5',

	surimiOrange = '#FFA066',
	boatYellow2 = '#C0A36E',
	carpYellow = '#E6C384',

	katanaGrey = '#717C7C',

	-- # LOTUS

	-- ink
	lotusInk1 = "#545464",
	lotusInk2 = "#43436c",

	-- white
	lotusWhite0 = "#d5cea3",
	lotusWhite1 = "#dcd5ac",
	lotusWhite2 = "#e5ddb0",
	lotusWhite3 = "#f2ecbc",
	lotusWhite4 = "#e7dba0",

	-- grey
	lotusGray = "#dcd7ba",
	lotusGray2 = "#716e61",
	lotusGrey3 = "#8a8980",

	-- red
	lotusRed = "#c84053",
	lotusRed3 = "#e82424",
	lotusRed4 = "#d9a594",

	-- orange
	lotusOrange = "#cc6d00",
	lotusOrange2 = "#e98a00",

	-- yellow
	lotusYellow2 = "#836f4a",
	lotusYellow3 = "#de9800",
	lotusYellow4 = "#f9d791",

	-- green
	lotusGreen = "#6f894e",
	lotusGreen2 = "#6e915f",
	lotusGreen3 = "#b7d0ae",

	-- teal
	lotusTeal2 = "#6693bf",
	lotusTeal3 = "#5a7785",

	-- aqua
	lotusAqua2 = "#5e857a",

	-- cyan
	lotusCyan = "#d7e3d8",

	-- blue
	lotusBlue2 = "#b5cbd2",
	lotusBlue4 = "#4d699b",

	-- violet
	lotusViolet3 = "#c9cbd1",
	lotusViolet4 = "#624c83",

	-- pink
	lotusPink = "#b35b79",
}

---@return KanagawaPaletteColors
function public.palette()
	return private.palette
end

---@return fun(palette: PaletteColors): Theme
function public.lotus()
	return function(palette_colors)
		local palette = palette_colors.kanagawa

		local colors = {
			ui = {
				fg = palette.lotusInk1,
				fg_dim = palette.lotusInk2,
				fg_reverse = palette.lotusWhite1,

				bg_dim = palette.lotusWhite0,
				bg_gutter = palette.lotusWhite0,

				bg_m3 = palette.lotusWhite3,
				bg_m2 = palette.lotusInk2,
				bg_m1 = palette.lotusWhite0,
				bg = palette.lotusWhite1,
				bg_p1 = palette.lotusWhite0,
				bg_p2 = palette.lotusWhite2,

				special = palette.lotusRed,
				nontext = palette.lotusGray2,
				whitespace = palette.lotusWhite2,

				bg_search = palette.lotusViolet3,
				bg_visual = palette.lotusInk2,
				fg_visual = palette.lotusWhite1,

				pmenu = {
					fg = palette.lotusInk2,
					fg_sel = palette.lotusWhite1,
					bg = "none",
					bg_sel = palette.lotusRed,
					bg_sbar = palette.lotusInk2,
					bg_thumb = palette.lotusInk2,
				},
				float = {
					fg = palette.lotusInk2,
					bg = palette.lotusWhite1,
					fg_border = palette.lotusInk1,
					bg_border = palette.lotusWhite1,
				},
			},
			syn = {
				string = palette.lotusGreen,
				variable = palette.lotusInk1,
				number = palette.lotusOrange,
				constant = palette.lotusOrange,
				identifier = palette.lotusInk1,
				parameter = palette.lotusInk1,
				fun = palette.lotusBlue4,
				statement = palette.lotusViolet4,
				keyword = palette.lotusPink,
				operator = palette.lotusOrange,
				preproc = palette.lotusRed,
				type = palette.lotusYellow2,
				regex = palette.lotusYellow2,
				deprecated = palette.lotusGrey3,
				comment = palette.lotusOrange,
				docComment = palette.lotusGreen,
				punct = palette.lotusInk1,
				special1 = palette.lotusTeal2,
				special2 = palette.lotusRed,
				special3 = palette.lotusRed,
			},
			vcs = {
				added = palette.lotusGreen2,
				removed = palette.lotusRed,
				changed = palette.lotusYellow3,
			},
			diff = {
				add = palette.lotusGreen3,
				delete = palette.lotusRed4,
				change = palette.lotusYellow4,
				text = palette.lotusGreen3,
				blend = 90,
			},
			diag = {
				ok = palette.lotusGreen,
				error = palette.lotusRed3,
				warning = palette.lotusOrange2,
				info = palette.lotusAqua2,
				hint = palette.lotusTeal3,
			},
			term = {
				palette.lotusWhite2, -- black
				palette.lotusRed, -- red
				palette.lotusGreen2, -- green
				palette.lotusYellow2, -- yellow
				palette.lotusBlue4, -- blue
				palette.lotusViolet4, -- magenta
				palette.lotusAqua2, -- cyan
				palette.lotusInk1, -- white
				palette.lotusInk2, -- bright black
				palette.lotusRed3, -- bright red
				palette.lotusGreen, -- bright green
				palette.lotusOrange2, -- bright yellow
				palette.lotusTeal2, -- bright blue
				palette.lotusPink, -- bright magenta
				palette.lotusAqua2, -- bright cyan
				palette.lotusInk2, -- bright white
				palette.lotusOrange, -- extended color 1
				palette.lotusRed3, -- extended color 2
			},
		}

		return { colors = colors, base_color = palette.oldWhite }
	end
end

--- @return fun(palette: PaletteColors): Theme
function public.wave()
	return function(palette_colors)
		local palette = palette_colors.kanagawa

		local colors = {
			ui = {
				fg = palette.fujiWhite,
				fg_dim = palette.oldWhite,
				fg_reverse = palette.sumiInk1,

				bg_dim = palette.sumiInk0,
				bg_gutter = palette.sumiInk2,

				bg_m3 = palette.sumiInk3,
				bg_m2 = palette.oldWhite,
				bg_m1 = palette.sumiInk0,
				bg = palette.sumiInk1,
				bg_p1 = palette.sumiInk2,
				bg_p2 = palette.sumiInk2,

				special = palette.peachRed,
				nontext = palette.sumiInk4,
				whitespace = palette.sumiInk2,

				bg_search = palette.waveBlue2,
				bg_visual = palette.waveBlue1,

				pmenu = {
					fg = palette.oldWhite,
					fg_sel = "none", -- This is important to make highlights pass-through
					bg = "none",
					bg_sel = palette.sumiInk3,
					bg_sbar = palette.sumiInk3,
					bg_thumb = palette.sumiInk3,
				},
				float = {
					fg = palette.oldWhite,
					bg = palette.sumiInk1,
					fg_border = palette.sumiInk4,
					bg_border = palette.sumiInk1,
				},
			},
			syn = {
				string = palette.springGreen,
				variable = palette.fujiWhite,
				number = palette.surimiOrange,
				constant = palette.surimiOrange,
				identifier = palette.fujiWhite,
				parameter = palette.fujiWhite,
				fun = palette.crystalBlue,
				statement = palette.oniViolet,
				keyword = palette.sakuraPink,
				operator = palette.surimiOrange,
				preproc = palette.peachRed,
				type = palette.carpYellow,
				regex = palette.boatYellow2,
				deprecated = palette.katanaGrey,
				comment = palette.surimiOrange,
				docComment = palette.springGreen,
				punct = palette.fujiWhite,
				special1 = palette.springBlue,
				special2 = palette.peachRed,
				special3 = palette.peachRed,
			},
			vcs = {
				added = palette.autumnGreen,
				removed = palette.autumnRed,
				changed = palette.autumnYellow,
			},
			diff = {
				add = palette.winterGreen,
				delete = palette.winterRed,
				change = palette.winterYellow,
				text = palette.winterGreen,
				blend = 90,
			},
			diag = {
				ok = palette.springGreen,
				error = palette.samuraiRed,
				warning = palette.roninYellow,
				info = palette.waveAqua1,
				hint = palette.dragonBlue,
			},
			term = {
				palette.sumiInk2, -- black
				palette.peachRed, -- red
				palette.autumnGreen, -- green
				palette.boatYellow2, -- yellow
				palette.crystalBlue, -- blue
				palette.oniViolet, -- magenta
				palette.waveAqua1, -- cyan
				palette.fujiWhite, -- white
				palette.oldWhite, -- bright black
				palette.samuraiRed, -- bright red
				palette.springGreen, -- bright green
				palette.roninYellow, -- bright yellow
				palette.springBlue, -- bright blue
				palette.sakuraPink, -- bright magenta
				palette.lightBlue, -- bright cyan
				palette.oldWhite, -- bright white
				palette.surimiOrange, -- extended color 1
				palette.samuraiRed, -- extended color 2
			},
		}

		return { colors = colors, base_color = palette.oldWhite }
	end
end

return public

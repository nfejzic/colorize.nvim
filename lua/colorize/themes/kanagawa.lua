local public = {}

local private = {}

---@class KanagawaPaletteColors
private.palette = {
	fujiWhite = '#DCD7BA',
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

	oldWhite3 = '#002B36',
	oldWhite3_hard = '#00141D',
	surimiOrange = '#FFA066',
	boatYellow2 = '#C0A36E',
	carpYellow = '#E6C384',

	katanaGrey = '#717C7C',
}

---@return KanagawaPaletteColors
function public.palette()
	return private.palette
end

---@return fun(palette: PaletteColors): Theme
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
					bg = palette.sumiInk2,
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
				special2 = palette.autumnRed,
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
				palette.oldWhite3, -- bright black
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

		return { colors = colors, base_color = palette.oldWhite3 }
	end
end

return public

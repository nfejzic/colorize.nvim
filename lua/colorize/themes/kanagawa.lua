local public = {}

local private = {}

---@class KanagawaPaletteColors
private.palette = {
	fujiWhite = '#DCD7BA',
	fujiGrey = '#727169',
	oldWhite = '#C8C093',

	katanaGrey = '#717C7C',

	sumiInk0 = '#16161D',
	sumiInk1 = '#1F1F28',
	sumiInk2 = '#2A2A37',
	sumiInk3 = '#363646',
	sumiInk4 = '#54546D',

	waveRed = '#E46876',
	samuraiRed = '#E82424',
	peachRed = '#FF5D62',
	autumnRed = '#C34043',
	winterRed = '#43242B',

	surimiOrange = '#FFA066',

	boatYellow2 = '#C0A36E',
	carpYellow = '#E6C384',
	autumnYellow = '#DCA561',
	winterYellow = '#49443C',
	roninYellow = '#FF9E3B',

	springGreen = '#98BB6C',
	autumnGreen = '#76946A',
	winterGreen = '#2B3328',

	waveAqua1 = '#6A9589',
	waveAqua2 = '#7AA89F',

	waveBlue1 = '#223249',
	waveBlue2 = '#2D4F67',
	lightBlue = '#A3D4D5',
	crystalBlue = '#7E9CD8',
	dragonBlue = '#658594',
	springBlue = '#7FB4CA',
	winterBlue = '#252535',

	springViolet1 = '#938AA9',
	oniViolet = '#957FB8',

	sakuraPink = '#D27E99',

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
	lotusGray3 = "#8a8980",

	-- red
	lotusRed = "#c84053", -- faded red
	lotusRed2 = "#d7474b", -- red
	lotusRed3 = "#e82424", -- bright red
	lotusRed4 = "#d9a594", -- dark red

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
	lotusAqua = "#597b75",
	lotusAqua2 = "#5e857a",

	-- cyan
	lotusCyan = "#d7e3d8",

	-- blue
	lotusBlue1 = "#c7d7e0",
	lotusBlue2 = "#b5cbd2",
	lotusBlue3 = "#9fb5c9",
	lotusBlue4 = "#4d699b",

	-- violet
	lotusViolet3 = "#c9cbd1",
	lotusViolet4 = "#624c83",

	-- pink
	lotusPink = "#b35b79",

	-- # DRAGON

	-- black
	dragonBlack0 = "#0d0c0c",
	dragonBlack1 = "#12120f",
	dragonBlack2 = "#1D1C19",
	dragonBlack3 = "#181616",
	dragonBlack4 = "#282727",
	dragonBlack5 = "#393836",
	dragonBlack6 = "#625e5a",

	-- gray
	dragonAsh = "#737c73",
	dragonGray = "#a6a69c",
	dragonGray2 = "#9e9b93",
	dragonGray3 = "#7a8382",

	-- white
	dragonWhite = "#c5c9c5",

	-- red
	dragonRed = "#c4746e",

	-- orange
	dragonOrange = "#b6927b",
	dragonOrange2 = "#b98d7b",

	-- yellow
	dragonYellow = "#c4b28a",

	-- green
	dragonGreen = "#87a987",
	dragonGreen2 = "#8a9a7b",

	-- aqua
	dragonAqua = "#8ea4a2",

	-- teal
	dragonTeal = "#949fb5",

	-- blue
	dragonBlue2 = "#8ba4b0",

	-- violet
	dragonViolet = "#8992a7",

	-- pink
	dragonPink = "#a292a3",
}

---@return KanagawaPaletteColors
function public.palette()
	return private.palette
end

--- @param palette PaletteColors
--- @return AllColors
function public.lotus(palette)
	local p = palette.kanagawa

	--- @type AllColors
	local colors = {
		fg = p.lotusInk1,
		fg_dim = p.lotusInk2,
		fg_faded = p.lotusGray3,
		fg_accent = p.lotusRed,
		nontext = p.lotusGray2,

		bg = p.lotusWhite3,
		bg_chrome = p.lotusWhite4,
		bg_dim = p.lotusWhite4,
		bg_accent = p.lotusWhite4,
		bg_highlight = p.lotusOrange,
		bg_select = p.lotusWhite0,

		-- NOTE: maybe introduce another red color here...
		dark_red = p.lotusRed4,
		faded_red = p.lotusRed,
		red = p.lotusRed2,
		br_red = p.lotusRed3,

		orange = p.lotusOrange,

		faded_yellow = p.lotusYellow3,
		yellow = p.lotusYellow2,
		br_yellow = p.lotusAqua2,

		dark_green = p.lotusGreen3,
		faded_green = p.lotusGreen2,
		br_green = p.lotusGreen,

		cyan = p.lotusAqua2,
		br_cyan = p.lotusTeal3,

		dark_blue = p.lotusCyan,
		blue = p.lotusBlue4,
		br_blue = p.lotusTeal2,

		magenta = p.lotusViolet4,
		br_magenta = p.lotusPink,
	}

	return colors
end

--- @param palette PaletteColors
--- @return AllColors
function public.dragon(palette)
	local p = palette.kanagawa

	--- @type AllColors
	local colors = {
		fg = p.dragonWhite,
		fg_dim = p.oldWhite,
		fg_faded = p.fujiGrey,
		fg_accent = p.dragonRed,
		nontext = p.dragonBlack6,

		bg = p.dragonBlack1,
		bg_chrome = p.dragonBlack2,
		bg_dim = p.dragonBlack0,
		bg_accent = p.dragonBlack4,
		bg_highlight = p.roninYellow,
		bg_select = p.dragonBlack4,

		dark_red = p.winterRed,
		faded_red = p.autumnRed,
		red = p.dragonRed,
		br_red = p.waveRed,

		orange = p.dragonOrange,

		faded_yellow = p.autumnYellow,
		yellow = p.dragonYellow,
		br_yellow = p.dragonYellow,

		dark_green = p.winterGreen,
		faded_green = p.autumnGreen,
		br_green = p.dragonGreen2,

		cyan = p.waveAqua1,
		br_cyan = p.waveAqua2,

		dark_blue = p.winterBlue,
		blue = p.dragonBlue2,
		br_blue = p.springBlue,

		magenta = p.dragonViolet,
		br_magenta = p.dragonPink,
	}

	return colors
end

--- @param palette PaletteColors
--- @return AllColors
function public.wave(palette)
	local p = palette.kanagawa

	--- @type AllColors
	local colors = {
		fg = p.fujiWhite,
		fg_dim = p.oldWhite,
		fg_faded = p.fujiGrey,
		fg_accent = p.peachRed,
		nontext = p.sumiInk4,

		bg = p.sumiInk1,
		bg_chrome = p.sumiInk2,
		bg_dim = p.sumiInk0,
		bg_accent = p.sumiInk3,
		bg_highlight = p.roninYellow,
		bg_select = p.waveBlue1,

		dark_red = p.winterRed,
		faded_red = p.autumnRed,
		red = p.peachRed,
		br_red = p.samuraiRed,

		orange = p.surimiOrange,

		faded_yellow = p.autumnYellow,
		yellow = p.boatYellow2,
		br_yellow = p.carpYellow,

		dark_green = p.winterGreen,
		faded_green = p.autumnGreen,
		br_green = p.springGreen,

		cyan = p.waveAqua1,
		br_cyan = p.waveAqua2,

		dark_blue = p.winterBlue,
		blue = p.crystalBlue,
		br_blue = p.springBlue,

		magenta = p.oniViolet,
		br_magenta = p.sakuraPink,
	}

	return colors
end

return public

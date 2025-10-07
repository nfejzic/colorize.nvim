local public = {}

local private = {}

---@class KanagawaPaletteColors
private.palette = {
	fujiWhite = '#DCD7BA',
	fujiGrey = '#727169',
	oldWhite = '#C8C093',
	-- hello there
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

local Color = require("colorize.lib.color")

---@return Colors
function public.dragon()
	local p = private.palette


	---@type Colors
	return {
		fg = p.oldWhite,
		fg1 = p.dragonWhite,
		fg2 = p.fujiGrey,

		bg = p.dragonBlack3,
		bg1 = p.dragonBlack4,
		bg2 = p.dragonBlack5,
		bg3 = p.dragonBlack6,

		brightRed = p.dragonRed,
		neutralRed = Color.darken(p.autumnRed, p.dragonBlack3, -0.35),
		darkRed = p.winterRed,

		brightGreen = p.dragonGreen2,
		neutralGreen = p.autumnGreen,
		darkGreen = Color.darken(p.autumnGreen, p.dragonBlack3, -0.35),

		brightYellow = p.dragonYellow,
		neutralYellow = p.dragonYellow,

		brightBlue = p.dragonBlue2,
		neutralBlue = p.dragonBlue,

		brightPurple = p.dragonPink,
		neutralPurple = p.dragonViolet,

		brightAqua = p.dragonGreen2,
		neutralAqua = p.dragonAqua,
		darkAqua = p.winterGreen,

		brightOrange = p.dragonOrange,
		neutralOrange = p.autumnYellow,
	}
end

---@return Colors
function public.lotus()
	local p = private.palette

	---@type Colors
	return {
		bg = p.lotusWhite3,
		bg1 = p.lotusWhite4,
		bg2 = p.lotusWhite0,
		bg3 = p.lotusGray2,

		fg = p.lotusInk1,
		fg1 = p.lotusInk2,
		fg2 = p.lotusInk1,

		brightRed = p.lotusRed,
		neutralRed = Color.darken(p.lotusRed3, p.lotusWhite3, -0.25),
		darkRed = Color.darken(p.lotusRed3, p.lotusWhite3, -0.45),

		brightGreen = p.lotusGreen,
		neutralGreen = Color.darken(p.lotusGreen2, p.lotusWhite3, -0.15),
		darkGreen = Color.darken(p.lotusGreen2, p.lotusWhite3, -0.25),

		brightYellow = p.lotusBlue4,
		neutralYellow = p.lotusBlue2,

		brightBlue = p.lotusYellow3,
		neutralBlue = p.lotusYellow2,

		brightPurple = p.lotusPink,
		neutralPurple = p.lotusViolet4,

		brightAqua = p.lotusGreen,
		neutralAqua = p.lotusAqua2,
		darkAqua = p.lotusGreen3,

		brightOrange = p.lotusOrange,
		neutralOrange = p.lotusYellow3,
		blend = 50,
	}
end

--- @return Colors
function public.wave()
	local palette = private.palette

	---@type Colors
	return {
		bg = palette.sumiInk1,
		bg1 = palette.sumiInk2,
		bg2 = palette.sumiInk3,
		bg3 = palette.sumiInk4,

		fg = palette.fujiWhite,
		fg1 = palette.oldWhite,
		fg2 = palette.fujiGrey,

		brightRed = palette.peachRed,
		neutralRed = palette.autumnRed,
		darkRed = palette.winterRed,

		brightGreen = palette.springGreen,
		neutralGreen = palette.autumnGreen,
		darkGreen = palette.autumnGreen,

		brightYellow = palette.carpYellow,
		neutralYellow = palette.autumnYellow,

		brightBlue = palette.crystalBlue,
		neutralBlue = palette.springBlue,

		brightPurple = palette.sakuraPink,
		neutralPurple = palette.oniViolet,

		brightAqua = palette.springGreen,
		neutralAqua = palette.waveAqua2,
		darkAqua = palette.winterGreen,

		brightOrange = palette.surimiOrange,
		neutralOrange = palette.autumnYellow,
	}
end

return public

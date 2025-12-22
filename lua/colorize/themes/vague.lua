local Color = require("colorize.lib.color")

local private = {}
local public = {}

--- @class VaguePalette
private.palette = {
	eerie_black = "#141415",     -- prev: bg
	raisin_black = "#252530",    -- prev: line
	taupe_gray = "#878787",      -- prev: floatBorder
	dark_jungle_green = "#1c1c24", -- prev: inactiveBg
	onyx = "#333738",            -- prev: visual

	light_gray = "#cdcdcd",      -- prev: fg
	lavender_gray = "#c3c3d5",   -- prev: property
	cadet_grey = "#90a0b5",      -- prev: operator
	independence = "#405065",    -- prev: search

	dark_electric_blue = "#606079", -- prev: comment
	light_steel_blue = "#b4d4cf", -- prev: builtin
	little_boy_blue = "#7e98e8", -- prev: hint

	blush = "#d8647e",           -- prev: error
	old_rose = "#c48282",        -- prev: func

	gold = "#e8b589",            -- prev: string
	indian_yellow = "#e0a363",   -- prev: number
	mellow_apricot = "#f3be7c",  -- prev: warning

	wild_blue_yonder = "#aeaed1", -- prev: constant
	lilac = "#bb9dbd",           -- prev: parameter
	shadow_blue = "#6e94b2",     -- prev: keyword
	opal = "#9bb4bc",            -- prev: type

	moss_green = "#7fa563",      -- prev: plus
}

--- @return VaguePalette
function public.palette()
	return private.palette
end

--- @param palette PaletteColors
--- @return AllColors
function public.colors(palette)
	local p = palette.vague

	--- @type AllColors
	return {
		fg = p.light_gray,
		fg_dim = p.light_gray,
		fg_faded = p.dark_electric_blue,
		fg_accent = p.blush,
		nontext = p.dark_electric_blue,

		bg = p.eerie_black,
		bg_chrome = p.dark_jungle_green,
		bg_dim = p.eerie_black,
		bg_accent = p.raisin_black,
		bg_highlight = p.gold,
		bg_select = p.onyx,

		dark_red = Color.shift(p.old_rose, p.eerie_black, -0.55),
		faded_red = Color.shift(p.old_rose, p.eerie_black, -0.25),
		red = p.blush,
		br_red = Color.shift(p.blush, p.eerie_black, 0.15),

		orange = p.mellow_apricot,

		faded_yellow = Color.shift(p.indian_yellow, p.eerie_black, -0.15),
		yellow = p.mellow_apricot,
		br_yellow = Color.shift(p.mellow_apricot, p.eerie_black, 0.15),

		dark_green = Color.shift(p.moss_green, p.eerie_black, -0.5),
		faded_green = Color.shift(p.moss_green, p.eerie_black, -0.15),
		br_green = p.moss_green,

		cyan = p.light_steel_blue,
		br_cyan = p.opal,

		dark_blue = p.little_boy_blue,
		blue = p.old_rose,
		br_blue = p.cadet_grey,

		magenta = p.wild_blue_yonder,
		br_magenta = p.shadow_blue,
	}
end

return public

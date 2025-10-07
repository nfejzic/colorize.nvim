local public = {}

local private = {}

---@class GruvboxPaletteColors
private.gruvbox_palette = {
	-- One of these
	dark0_hard = "#1d2021",
	dark0 = "#282828",
	dark0_soft = "#32302f",

	-- and all these
	dark1 = "#3c3836",
	dark2 = "#504945",
	dark4 = "#7c6f64",

	-- one of these
	light0_hard = "#f9f5d7",
	light0 = "#fbf1c7",
	light0_soft = "#f2e5bc",

	-- and all these
	light1 = "#ebdbb2",
	light2 = "#d5c4a1",
	light4 = "#a89984",

	brightRed = "#fb4934",
	neutralRed = "#cc241d",
	darkRedHard = "#792329",
	darkRed = "#722529",
	darkRedSoft = "#7b2c2f",

	brightGreen = "#b8bb26",
	neutralGreen = "#98971a",
	darkGreenHard = "#5a633a",
	darkGreen = "#62693e",
	darkGreenSoft = "#686d43",

	brightYellow = "#fabd2f",
	neutralYellow = "#d79921",
	fadedYellow = "#b57614",

	brightBlue = "#83a598",
	neutralBlue = "#458588",

	brightPurple = "#d3869b",
	neutralPurple = "#b16286",

	brightAqua = "#8ec07c",
	neutralAqua = "#689d6a",

	darkAquaHard = "#3e4934",
	darkAqua = "#49503b",
	darkAquaSoft = "#525742",

	brightOrange = "#fe8019",
	neutralOrange = "#d65d03",
}

---@return GruvboxPaletteColors
function public.palette()
	return private.gruvbox_palette
end

--- @param palette GruvboxPaletteColors
--- @param contrast "soft"|"normal"|"hard"
--- @return Colors.P
function private.base(palette, contrast)
	local Color = require("colorize.lib.color")
	local bg = palette.dark0

	if contrast == "hard" then
		bg = palette.dark0_hard
	elseif contrast == "soft" then
		bg = palette.dark0_soft
	end

	local colors = {
		brightRed = palette.brightRed,
		neutralRed = palette.neutralRed,
		darkRed = palette.darkRed,

		brightGreen = palette.brightGreen,
		neutralGreen = Color.darken(palette.neutralGreen, bg, -0.25),
		darkGreen = palette.darkGreen,

		brightYellow = palette.brightYellow,
		neutralYellow = palette.neutralYellow,
		fadedYellow = palette.fadedYellow,

		brightBlue = palette.brightBlue,
		neutralBlue = palette.neutralBlue,

		brightPurple = palette.brightPurple,
		neutralPurple = palette.neutralPurple,

		brightAqua = palette.brightAqua,
		neutralAqua = palette.neutralAqua,

		darkAqua = palette.darkAqua,

		brightOrange = palette.brightOrange,
		neutralOrange = palette.neutralOrange,
	}

	if contrast == "hard" then
		colors.darkRed = palette.darkRedHard
		colors.darkGreen = palette.darkGreenHard
		colors.darkAqua = palette.darkAquaHard
	elseif contrast == "soft" then
		colors.darkRed = palette.darkRedSoft
		colors.darkGreen = palette.darkGreenSoft
		colors.darkAqua = palette.darkAquaSoft
	end

	return colors
end

--- @param contrast "soft"|"normal"|"hard"
function public.dark(contrast)
	local palette = private.gruvbox_palette

	local colors = private.base(palette, contrast)

	colors.bg = palette.dark0
	colors.bg1 = palette.dark1
	colors.bg2 = palette.dark2
	colors.bg3 = palette.dark4

	colors.fg = palette.light1
	colors.fg1 = palette.light2
	colors.fg2 = palette.light4

	if contrast == "hard" then
		colors.bg = palette.dark0_hard
	elseif contrast == "soft" then
		colors.bg = palette.dark0_soft
	end

	return colors
end

--- @param contrast "soft"|"normal"|"hard"
--- @return Colors
function public.light(contrast)
	local palette = private.gruvbox_palette

	local colors = private.base(palette, contrast)

	colors.bg = palette.light0
	colors.bg1 = palette.light1
	colors.bg2 = palette.light2
	colors.bg3 = palette.light4

	colors.fg = palette.dark1
	colors.fg1 = palette.dark2
	colors.fg2 = palette.dark4

	if contrast == "hard" then
		colors.bg = palette.light0_hard
	elseif contrast == "soft" then
		colors.bg = palette.light0_soft
	end

	---@type Colors
	return colors
end

return public

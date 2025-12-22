local private = {}
local public = {}

--- @class VaguePalette
private.palette = {
	bg = "#141415",
	inactiveBg = "#1c1c24",
	fg = "#cdcdcd",
	floatBorder = "#878787",
	line = "#252530",
	comment = "#606079",
	builtin = "#b4d4cf", -- teal
	func = "#c48282",   -- red (faded)
	string = "#e8b589", -- orange
	number = "#e0a363", -- orange (darker)
	property = "#c3c3d5", -- lavender
	constant = "#aeaed1", -- violet
	parameter = "#bb9dbd", -- pink
	visual = "#333738", -- dark dark dark green
	error = "#d8647e",  -- red (bright)
	warning = "#f3be7c", -- orange (bright)
	hint = "#7e98e8",   -- blue (bright)
	operator = "#90a0b5", -- teal (bright)
	keyword = "#6e94b2", -- cyan
	type = "#9bb4bc",   -- teal
	search = "#405065", -- dark teal? dark cyan?
	plus = "#7fa563",   -- green
	delta = "#f3be7c",  -- orang-ish
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
		fg = p.fg,
		fg_dim = p.fg,
		fg_faded = p.comment,
		fg_accent = p.error,
		nontext = p.comment,

		bg = p.bg,
		bg_chrome = p.inactiveBg,
		bg_dim = p.bg,
		bg_accent = p.visual,
		bg_highlight = p.search,
		bg_select = p.visual,

		dark_red = p.func,
		faded_red = p.func,
		red = p.error,
		br_red = p.error,

		orange = p.warning,

		faded_yellow = p.number,
		yellow = p.delta,
		br_yellow = p.delta,

		dark_green = p.search,
		faded_green = p.plus,
		br_green = p.plus,

		cyan = p.builtin,
		br_cyan = p.type,

		dark_blue = p.hint,
		blue = p.func,
		br_blue = p.operator,

		magenta = p.constant,
		br_magenta = p.keyword,
	}
end

return public

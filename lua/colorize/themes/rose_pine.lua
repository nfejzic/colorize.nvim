local public = {}

local private = {}

---@class RosePinePalette
---@field base string
---@field surface string
---@field overlay string
---@field muted string
---@field subtle string
---@field text string
---@field love string
---@field gold string
---@field rose string
---@field pine string
---@field foam string
---@field iris string
---@field highlight_low string
---@field highlight_med string
---@field highlight_high string

---@alias RosePineChoice "main"|"moon"|"dawn"|"black"

---@alias RosePinePaletteColors table<RosePineChoice, RosePinePalette>

---@type RosePinePaletteColors
private.palette = {
	main = {
		base = "#191724",
		surface = "#1f1d2e",
		overlay = "#26233a",
		muted = "#6e6a86",
		subtle = "#908caa",
		text = "#e0def4",
		love = "#eb6f92",
		gold = "#f6c177",
		rose = "#ebbcba",
		pine = "#31748f",
		foam = "#9ccfd8",
		iris = "#c4a7e7",
		highlight_low = "#21202e",
		highlight_med = "#403d52",
		highlight_high = "#524f67",
	},

	moon = {
		base = "#232136",
		surface = "#2a273f",
		overlay = "#393552",
		muted = "#6e6a86",
		subtle = "#908caa",
		text = "#e0def4",
		love = "#eb6f92",
		gold = "#f6c177",
		rose = "#ea9a97",
		pine = "#3e8fb0",
		foam = "#9ccfd8",
		iris = "#c4a7e7",
		highlight_low = "#2a283e",
		highlight_med = "#44415a",
		highlight_high = "#56526e",
	},

	dawn = {
		base = "#faf4ed",
		surface = "#fffaf3",
		overlay = "#f2e9e1",
		muted = "#9893a5",
		subtle = "#797593",
		text = "#575279",
		love = "#b4637a",
		gold = "#ea9d34",
		rose = "#d7827e",
		pine = "#286983",
		foam = "#56949f",
		iris = "#907aa9",
		highlight_low = "#f4ede8",
		highlight_med = "#dfdad9",
		highlight_high = "#cecacd",
	},
}

private.palette.black = vim.tbl_deep_extend("force", private.palette.main, {
	base = "#000000",
})

---@return RosePinePaletteColors
function public.palette()
	return private.palette
end

---@return Colors
function public.main()
	local p = private.palette.main

	return private.to_colors(p)
end

---@return Colors
function public.black()
	local p = private.palette.black

	return private.to_colors(p)
end

---@return Colors
function public.moon()
	local p = private.palette.moon

	return private.to_colors(p)
end

---@return Colors
function public.dawn()
	local p = private.palette.dawn

	return private.to_colors(p)
end

---@param p RosePinePalette
---@return Colors
function private.to_colors(p)
	local Color = require("colorize.lib.color")

	---@type Colors
	return {
		bg = p.base,
		bg1 = p.overlay,
		bg2 = p.highlight_med,
		bg3 = p.subtle,

		fg = p.text,
		fg1 = p.subtle,
		fg2 = p.subtle,

		brightRed = p.love,
		neutralRed = Color.darken(p.love, p.base, -0.3),
		darkRed = Color.darken(p.love, p.base, -0.45),

		brightGreen = p.gold,
		neutralGreen = Color.darken(p.foam, p.base, -0.5),
		darkGreen = Color.darken(p.foam, p.base, -0.7),

		brightYellow = p.gold,
		neutralYellow = Color.darken(p.gold, p.base),

		brightBlue = p.iris,
		neutralBlue = Color.darken(p.foam, p.base, -0.15),

		brightPurple = p.pine,
		neutralPurple = p.iris,

		brightAqua = p.foam,
		neutralAqua = Color.darken(p.foam, p.base),
		darkAqua = Color.darken(p.foam, p.base, -0.8),

		brightOrange = p.gold,
		neutralOrange = Color.darken(p.gold, p.base),

		blend = nil,
	}
end

return public

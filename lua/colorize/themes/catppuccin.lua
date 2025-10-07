local public = {}

local private = {}

---@class CatppuccinPaletteColors
---@field Rosewater string
---@field Flamingo string
---@field Pink string
---@field Mauve string
---@field Red string
---@field Maroon string
---@field Peach string
---@field Yellow string
---@field Green string
---@field Teal string
---@field Sky string
---@field Sapphire string
---@field Blue string
---@field Lavender string
---@field Text string
---@field Subtext1 string
---@field Subtext0 string
---@field Overlay2 string
---@field Overlay1 string
---@field Overlay0 string
---@field Surface2 string
---@field Surface1 string
---@field Surface0 string
---@field Base string
---@field Mantle string
---@field Crust string

---@alias CatppuccinVariant 'latte'|'frappe'|'macchiato'|'mocha'

---@type table<CatppuccinVariant, CatppuccinPaletteColors>
private.palette = {
	latte = {
		Rosewater = "#dc8a78",
		Flamingo = "#dd7878",
		Pink = "#ea76cb",
		Mauve = "#8839ef",
		Red = "#d20f39",
		Maroon = "#e64553",
		Peach = "#fe640b",
		Yellow = "#df8e1d",
		Green = "#40a02b",
		Teal = "#179299",
		Sky = "#04a5e5",
		Sapphire = "#209fb5",
		Blue = "#1e66f5",
		Lavender = "#7287fd",

		Text = "#4c4f69",
		Subtext1 = "#5c5f77",
		Subtext0 = "#6c6f85",

		Overlay2 = "#7c7f93",
		Overlay1 = "#8c8fa1",
		Overlay0 = "#9ca0b0",

		Surface2 = "#acb0be",
		Surface1 = "#bcc0cc",
		Surface0 = "#ccd0da",

		Base = "#eff1f5",
		Mantle = "#e6e9ef",
		Crust = "#dce0e8",
	},

	frappe = {
		Rosewater = "#f2d5cf",
		Flamingo = "#eebebe",
		Pink = "#f4b8e4",
		Mauve = "#ca9ee6",
		Red = "#e78284",
		Maroon = "#ea999c",
		Peach = "#ef9f76",
		Yellow = "#e5c890",
		Green = "#a6d189",
		Teal = "#81c8be",
		Sky = "#99d1db",
		Sapphire = "#85c1dc",
		Blue = "#8caaee",
		Lavender = "#babbf1",

		Text = "#c6d0f5",
		Subtext1 = "#b5bfe2",
		Subtext0 = "#a5adce",

		Overlay2 = "#949cbb",
		Overlay1 = "#838ba7",
		Overlay0 = "#737994",

		Surface2 = "#626880",
		Surface1 = "#51576d",
		Surface0 = "#414559",

		Base = "#303446",
		Mantle = "#292c3c",
		Crust = "#232634",
	},

	macchiato = {
		Rosewater = "#f4dbd6",
		Flamingo = "#f0c6c6",
		Pink = "#f5bde6",
		Mauve = "#c6a0f6",
		Red = "#ed8796",
		Maroon = "#ee99a0",
		Peach = "#f5a97f",
		Yellow = "#eed49f",
		Green = "#a6da95",
		Teal = "#8bd5ca",
		Sky = "#91d7e3",
		Sapphire = "#7dc4e4",
		Blue = "#8aadf4",
		Lavender = "#b7bdf8",
		Text = "#cad3f5",
		Subtext1 = "#b8c0e0",
		Subtext0 = "#a5adcb",
		Overlay2 = "#939ab7",
		Overlay1 = "#8087a2",
		Overlay0 = "#6e738d",
		Surface2 = "#5b6078",
		Surface1 = "#494d64",
		Surface0 = "#363a4f",
		Base = "#24273a",
		Mantle = "#1e2030",
		Crust = "#181926",
	},

	mocha = {
		Rosewater = "#f5e0dc",

		Flamingo = "#f2cdcd",
		Pink = "#f5c2e7",

		Red = "#f38ba8",
		Maroon = "#eba0ac",

		Peach = "#fab387",
		Yellow = "#f9e2af",

		Green = "#a6e3a1",

		Mauve = "#cba6f7",
		Lavender = "#b4befe",

		Teal = "#94e2d5",
		Sky = "#89dceb",
		Sapphire = "#74c7ec",
		Blue = "#89b4fa",

		Text = "#cdd6f4",
		Subtext1 = "#bac2de",
		Subtext0 = "#a6adc8",

		Overlay2 = "#9399b2",
		Overlay1 = "#7f849c",
		Overlay0 = "#6c7086",

		Surface2 = "#585b70",
		Surface1 = "#45475a",
		Surface0 = "#313244",

		Base = "#1e1e2e",
		Mantle = "#181825",
		Crust = "#11111b",
	},
}

---@return table<CatppuccinVariant, CatppuccinPaletteColors>
function public.palette()
	return private.palette
end

---@return Colors
function public.latte()
	return private.colorize(private.palette.latte)
end

---@return Colors
function public.frappe()
	return private.colorize(private.palette.frappe)
end

---@return Colors
function public.macchiato()
	return private.colorize(private.palette.macchiato)
end

---@return Colors
function public.mocha()
	return private.colorize(private.palette.mocha)
end

---@param p CatppuccinPaletteColors
---@return Colors
function private.colorize(p)
	local Color = require("colorize.lib.color")
	local darken = function(hex, darken)
		local amount = darken or 0.15
		return Color(hex):brighten(amount, p.Base):to_hex()
	end

	---@type Colors
	return {
		bg = p.Base,
		bg1 = p.Surface0,
		bg2 = p.Surface1,
		bg3 = p.Surface2,

		fg = p.Text,
		fg1 = p.Subtext0,
		fg2 = p.Subtext1,
		brightRed = p.Red,
		neutralRed = darken(p.Maroon, -0.35),
		darkRed = darken(p.Red, -0.5),

		brightGreen = p.Green,
		neutralGreen = darken(p.Green, -0.35),
		darkGreen = darken(p.Green, -0.4),

		brightYellow = p.Yellow,
		neutralYellow = darken(p.Yellow),

		brightBlue = p.Blue,
		neutralBlue = p.Sapphire,

		brightPurple = p.Mauve,
		neutralPurple = p.Lavender,

		brightAqua = p.Teal,
		neutralAqua = darken(p.Teal),
		darkAqua = darken(p.Teal, -0.55),

		brightOrange = p.Peach,
		neutralOrange = darken(p.Peach),

		blend = nil,
	}
end

return public

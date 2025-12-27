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
		Mauve = "#cba6f7",
		Red = "#f38ba8",
		Maroon = "#eba0ac",
		Peach = "#fab387",
		Yellow = "#f9e2af",
		Green = "#a6e3a1",
		Teal = "#94e2d5",
		Sky = "#89dceb",
		Sapphire = "#74c7ec",
		Blue = "#89b4fa",
		Lavender = "#b4befe",
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

---@param palette PaletteColors
---@return AllColors
function public.latte(palette)
	return private.colorize(palette.catppuccin.latte)
end

---@param palette PaletteColors
---@return AllColors
function public.frappe(palette)
	return private.colorize(palette.catppuccin.frappe)
end

---@param palette PaletteColors
---@return AllColors
function public.macchiato(palette)
	return private.colorize(palette.catppuccin.macchiato)
end

---@param palette PaletteColors
---@return AllColors
function public.mocha(palette)
	return private.colorize(palette.catppuccin.mocha)
end

---@param palette CatppuccinPaletteColors
---@return AllColors
function private.colorize(palette)
	local Color = require("colorize.lib.color")

	---@type AllColors
	local colors = {
		fg = palette.Text,
		fg_dim = palette.Subtext1,
		fg_accent = palette.Maroon,
		fg_faded = palette.Overlay2,
		nontext = palette.Overlay1,

		bg = palette.Base,
		bg_dim = palette.Crust,
		bg_chrome = palette.Surface0,
		bg_accent = palette.Surface0,
		bg_highlight = palette.Teal,
		bg_select = palette.Surface1,

		dark_red = Color.shift(palette.Red, palette.Base, -0.6),
		faded_red = Color.shift(palette.Red, palette.Base, -0.45),
		red = palette.Red,
		br_red = palette.Maroon,

		orange = palette.Peach,

		faded_yellow = Color.shift(palette.Yellow, palette.Base, -0.2),
		yellow = palette.Yellow,
		br_yellow = palette.Yellow,

		dark_green = Color.shift(palette.Green, palette.Base, -0.6),
		faded_green = Color.shift(palette.Green, palette.Base, -0.45),
		br_green = palette.Green,

		cyan = palette.Teal,
		br_cyan = palette.Sky,

		dark_blue = Color.shift(palette.Blue, palette.Base, -0.6),
		blue = palette.Blue,
		br_blue = palette.Sapphire,

		magenta = palette.Lavender,
		br_magenta = palette.Mauve,
	}

	return colors
end

return public

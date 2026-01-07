local public = {}

local private = {}

---@class MonokaiProPalette
---@field background string
---@field foreground string
---@field red string
---@field orange string
---@field yellow string
---@field green string
---@field blue string
---@field magenta string
---@field dimmed1 string
---@field dimmed2 string
---@field dimmed3 string
---@field dimmed4 string
---@field dimmed5 string
---@field bg_dimmed1 string
---@field bg_dimmed2 string

---@class MonokaiProPaletteLight: MonokaiProPalette
---@field panel string
---@field light string

---@type MonokaiProPalette
local pro = {
	background = "#2D2A2E",
	foreground = "#FCFCFA",
	red = "#FF6188",
	orange = "#FC9867",
	yellow = "#FFD866",
	green = "#A9DC76",
	blue = "#78DCE8",
	magenta = "#AB9DF2",
	dimmed1 = "#C1C0C0",
	dimmed2 = "#939293",
	dimmed3 = "#727072",
	dimmed4 = "#5B595C",
	dimmed5 = "#403E41",
	bg_dimmed1 = "#221F22",
	bg_dimmed2 = "#19181A",
}

---@type MonokaiProPalette
local machine = {
	bg_dimmed2 = "#161b1e",
	bg_dimmed1 = "#1d2528",
	background = "#273136",
	foreground = "#f2fffc",
	red = "#ff6d7e",
	orange = "#ffb270",
	yellow = "#ffed72",
	green = "#a2e57b",
	blue = "#7cd5f1",
	magenta = "#baa0f8",
	dimmed1 = "#b8c4c3",
	dimmed2 = "#8b9798",
	dimmed3 = "#6b7678",
	dimmed4 = "#545f62",
	dimmed5 = "#3a4449",
}

---@type MonokaiProPalette
local octagon = {
	bg_dimmed2 = "#161821",
	bg_dimmed1 = "#1e1f2b",
	background = "#282a3a",
	foreground = "#eaf2f1",
	red = "#ff657a",
	orange = "#ff9b5e",
	yellow = "#ffd76d",
	green = "#bad761",
	blue = "#9cd1bb",
	magenta = "#c39ac9",
	dimmed1 = "#b2b9bd",
	dimmed2 = "#888d94",
	dimmed3 = "#696d77",
	dimmed4 = "#535763",
	dimmed5 = "#3a3d4b",
}

---@type MonokaiProPalette
local ristretto = {
	bg_dimmed2 = "#191515",
	bg_dimmed1 = "#211c1c",
	background = "#2c2525",
	foreground = "#fff1f3",
	red = "#fd6883",
	orange = "#f38d70",
	yellow = "#f9cc6c",
	green = "#adda78",
	blue = "#85dacc",
	magenta = "#a8a9eb",
	dimmed1 = "#c3b7b8",
	dimmed2 = "#948a8b",
	dimmed3 = "#72696a",
	dimmed4 = "#5b5353",
	dimmed5 = "#403838",
}

---@type MonokaiProPalette
local spectrum = {
	bg_dimmed2 = "#131313",
	bg_dimmed1 = "#191919",
	background = "#222222",
	foreground = "#f7f1ff",
	red = "#fc618d",
	orange = "#fd9353",
	yellow = "#fce566",
	green = "#7bd88f",
	blue = "#5ad4e6",
	magenta = "#948ae3",
	dimmed1 = "#bab6c0",
	dimmed2 = "#8b888f",
	dimmed3 = "#69676c",
	dimmed4 = "#525053",
	dimmed5 = "#363537",
}

---@type MonokaiProPaletteLight
local light = {
	bg_dimmed2 = "#d3cdcc",
	bg_dimmed1 = "#ede7e5",
	background = "#faf4f2",
	foreground = "#29242a",
	red = "#e14775",
	orange = "#e16032",
	yellow = "#cc7a0a",
	green = "#269d69",
	blue = "#1c8ca8",
	magenta = "#7058be",
	dimmed1 = "#706b6e",
	dimmed2 = "#918c8e",
	dimmed3 = "#a59fa0",
	dimmed4 = "#bfb9ba",
	dimmed5 = "#d3cdcc",
	panel = "#fefaf9",
	light = "#ffffff",
}

---@class MonokaiPro
private.monokai_pro_palette = {
	pro = pro,
	spectrum = spectrum,
	octagon = octagon,
	ristretto = ristretto,
	machine = machine,
	light = light,
}

---@return MonokaiPro
function public.palette()
	return private.monokai_pro_palette
end

--- @param filter "pro"|"spectrum"|"octagon"|"ristretto"|"machine"|"light"
--- @return fun(palette: PaletteColors): AllColors
function public.colors(filter)
	local Color = require("colorize.lib.color")

	return function(palette)
		--- @type MonokaiProPalette
		local p = palette.monokai_pro[filter]

		if filter == "light" then
			--- @cast p MonokaiProPaletteLight
			p = p
		end

		--- @type AllColors
		local colors = {
			fg = p.foreground,
			fg_dim = p.dimmed2,
			fg_accent = p.red,
			fg_faded = p.orange,

			nontext = p.dimmed3,

			bg = p.background,
			bg_dim = p.background,
			bg_chrome = Color.shift(p.background, p.background, 0.07),
			bg_accent = p.dimmed4,
			bg_highlight = p.orange,
			bg_select = p.dimmed5,

			dark_red = Color.shift(p.red, p.background, -0.5),
			faded_red = Color.shift(p.red, p.background, -0.25),
			red = p.red,
			br_red = p.red,

			orange = p.orange,

			faded_yellow = Color.shift(p.yellow, p.background, -0.2),
			yellow = p.yellow,
			br_yellow = p.yellow,

			dark_green = Color.shift(p.green, p.background, -0.6),
			faded_green = Color.shift(p.green, p.background, -0.3),
			br_green = p.green,

			cyan = p.blue,
			br_cyan = p.blue,

			dark_blue = Color.shift(p.green, p.background, -0.5),
			blue = p.blue,
			br_blue = Color.shift(p.blue, p.background, 0.2),

			magenta = p.red,
			-- br_magenta = Color.shift(Color.blend(p.magenta, p.red, 0.65), p.background, 0.1),
			br_magenta = p.magenta
		}

		return colors
	end
end

return public

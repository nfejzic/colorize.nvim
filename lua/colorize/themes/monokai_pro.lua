local public = {}

local private = {}

---@class MonokaiProPalette
---@field dark2 string
---@field dark1 string
---@field background string
---@field text string
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

---@class MonokaiProPaletteLight: MonokaiProPalette
---@field panel string
---@field light string

---@type MonokaiProPalette
local pro = {
	dark2 = "#19181a",
	dark1 = "#221f22",
	background = "#2d2a2e",
	text = "#fcfcfa",
	red = "#ff6188", -- red
	orange = "#fc9867",
	yellow = "#ffd866",
	green = "#a9dc76",
	blue = "#78dce8",
	magenta = "#ab9df2",
	dimmed1 = "#c1c0c0",
	dimmed2 = "#939293", -- border
	dimmed3 = "#727072",
	dimmed4 = "#5b595c",
	dimmed5 = "#403e41",
}

---@type MonokaiProPalette
local machine = {
	dark2 = "#161b1e",
	dark1 = "#1d2528",
	background = "#273136",
	text = "#f2fffc",
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
	dark2 = "#161821",
	dark1 = "#1e1f2b",
	background = "#282a3a",
	text = "#eaf2f1",
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
	dark2 = "#191515",
	dark1 = "#211c1c",
	background = "#2c2525",
	text = "#fff1f3",
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
	dark2 = "#131313",
	dark1 = "#191919",
	background = "#222222",
	text = "#f7f1ff",
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
	dark2 = "#d3cdcc",
	dark1 = "#ede7e5",
	background = "#faf4f2",
	text = "#29242a",
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

---@param filter "pro"|"spectrum"|"octagon"|"ristretto"|"machine"|"light"
---@return fun(palette: PaletteColors): Theme
function public.dark(filter)
	return function(palette)
		if filter == "light" then
			return private.colorize_light(palette.monokai_pro.light)
		else
			return private.colorize(palette.monokai_pro[filter])
		end
	end
end

---@param p MonokaiProPalette
---@return Theme
function private.colorize(p)
	local Color = require("colorize.lib.color")

	--- @type ThemeColors
	local colors = {
		ui = {
			fg = p.text,
			fg_dim = p.dimmed2,
			fg_reverse = p.dimmed4,

			bg_dim = p.background,
			bg_gutter = p.dimmed5,

			bg_m3 = p.dimmed4,
			bg_m2 = p.background,
			bg_m1 = p.dimmed5,
			bg = p.background,
			bg_p1 = p.dimmed5,
			bg_p2 = p.dimmed5,

			special = p.red,
			nontext = p.dimmed3,
			whitespace = p.dimmed5,

			bg_search = p.orange,
			bg_visual = Color.shift(p.dimmed5, p.background, -0.08),

			pmenu = {
				fg = p.text,
				fg_sel = "none", -- This is important to make highlights pass-through
				bg = "none",
				bg_sel = p.dimmed5,
				bg_sbar = p.dimmed5,
				bg_thumb = p.dimmed5,
			},
			float = {
				fg = p.dimmed1,
				bg = p.background,
				fg_border = p.dimmed3,
				bg_border = p.background,
			},
		},
		syn = {
			string = p.green,
			variable = p.text,
			number = p.orange,
			constant = p.orange,
			identifier = p.text,
			parameter = p.text,
			fun = p.blue,
			statement = p.red,
			keyword = p.magenta,
			operator = p.yellow,
			preproc = p.red,
			type = p.yellow,
			regex = p.yellow,
			deprecated = p.dimmed3,
			comment = p.orange,
			docComment = p.green,
			punct = p.text,
			special1 = p.blue,
			special2 = p.red,
			special3 = p.red,
		},
		vcs = {
			added = p.green,
			removed = Color.shift(p.red, p.background, -0.35),
			changed = p.yellow,
		},
		diff = {
			add = Color.shift(p.green, p.background, -0.5),
			delete = Color.shift(p.red, p.background, -0.5),
			change = Color.shift(p.green, p.background, -0.5),
			text = Color.shift(p.green, p.background, -0.35),
		},
		diag = {
			ok = p.green,
			error = p.red,
			warning = p.orange,
			info = p.blue,
			hint = p.blue,
		},
		term = {
			p.background, -- black
			p.red, -- red
			p.green, -- green
			p.yellow, -- yellow
			p.blue, -- blue
			p.magenta, -- magenta
			p.blue, -- cyan
			p.dark2, -- white
			p.dimmed5, -- bright black
			p.red, -- bright red
			p.green, -- bright green
			p.yellow, -- bright yellow
			p.blue, -- bright blue
			p.red, -- bright magenta
			p.blue, -- bright cyan
			p.text, -- bright white
			p.orange, -- extended color 1
			p.red, -- extended color 2
		},
	}

	return { colors = colors, base_color = p.background }
end

---@return fun(palette: PaletteColors): Theme
function public.light()
	return function(palette)
		return private.colorize(palette.monokai_pro.light)
	end
end

return public

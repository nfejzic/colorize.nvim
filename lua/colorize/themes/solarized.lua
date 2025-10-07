local public = {}

local private = {}

---@class SolarizedPaletteColors
private.palette = {
	sol_base0 = '#839496',
	sol_base00 = '#657B83',
	sol_base01 = '#586E75',
	sol_base02 = '#073642',
	sol_base03 = '#002B36',
	sol_base03_hard = '#00141D',
	sol_base04 = '#002731',
	sol_base1 = '#93A1A1',
	sol_base2 = '#eee8d5',
	sol_base3 = '#fdf6e3',
	sol_base4 = '#fbf3db',
	sol_blue = '#268BD2',
	sol_cyan = '#2AA198',
	sol_diag_error = '#DC322F',
	sol_diag_hint = '#268BD2',
	sol_diag_info = '#268BD2',
	sol_diag_ok = '#859900',
	sol_diag_warning = '#B58900',
	sol_git_add = '#268BD2',
	sol_git_delete = '#DC322F',
	sol_git_modify = '#B58900',
	sol_green = '#859900',
	sol_magenta = '#D33682',
	sol_mix_blue = '#0B4764',
	sol_mix_cyan = '#0C4E53',
	sol_mix_green = '#274C25',
	sol_mix_magenta = '#3F2E4C',
	sol_mix_orange = '#3C342C',
	sol_mix_red = '#422D33',
	sol_mix_violet = '#204060',
	sol_mix_yellow = '#364725',
	sol_mix_base1 = '#2C4E56',
	sol_mix_base01 = '#CCCDC2',
	sol_orange = '#CB4B16',
	sol_red = '#DC322F',
	sol_violet = '#6C71C4',
	sol_yellow = '#B58900',
}

---@return SolarizedPaletteColors
function public.palette()
	return private.palette
end

local function base()
	local p = private.palette

	local Color = require("colorize.lib.color")
	local darken = function(hex, bg)
		return Color(hex):brighten(-0.15, bg):to_hex()
	end

	--- @type Colors.P
	return {
		brightRed = p.sol_red,
		neutralRed = darken(p.sol_red, p.sol_base03_hard),
		darkRed = p.sol_mix_red,

		brightGreen = p.sol_green,
		neutralGreen = darken(p.sol_green, p.sol_base03_hard),
		darkGreen = p.sol_mix_green,

		brightYellow = p.sol_yellow,
		neutralYellow = darken(p.sol_yellow, p.sol_base03_hard),

		brightBlue = p.sol_blue,
		neutralBlue = darken(p.sol_blue, p.sol_base03_hard),

		brightPurple = p.sol_magenta,
		neutralPurple = darken(p.sol_magenta, p.sol_base03_hard),

		brightAqua = p.sol_cyan,
		neutralAqua = darken(p.sol_cyan, p.sol_base03_hard),
		darkAqua = p.sol_mix_cyan,

		brightOrange = p.sol_orange,
		neutralOrange = darken(p.sol_orange, p.sol_base03_hard),

		blend = nil,
	}
end

---@param variant "hard"|"normal"
---@return Colors
function public.dark(variant)
	local p = private.palette

	--- @type Colors
	local b = base()
	local colors = vim.tbl_deep_extend("error", b, {
		bg = variant == "hard" and p.sol_base03_hard or p.sol_base03,
		bg1 = p.sol_base02,
		bg2 = p.sol_base03,
		bg3 = p.sol_base01,

		fg = p.sol_base0,
		fg1 = p.sol_base00,
		fg2 = p.sol_base2,
	})

	return colors
end

---@return Colors
function public.light()
	local p = private.palette

	--- @type Colors
	local b = base()
	local colors = vim.tbl_deep_extend("error", b, {
		bg = p.sol_base3,
		bg1 = p.sol_base2,
		bg2 = p.sol_base3,
		bg3 = p.sol_base1,

		fg = p.sol_base00,
		fg1 = p.sol_base1,
		fg2 = p.sol_base2,
	})

	return colors
end

return public

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

---@param variant "hard"|"normal"
---@return fun(palette: PaletteColors): ThemeColors, string
function public.dark(variant)
	return function(palette_colors)
		local palette = palette_colors.solarized

		local visual = palette.sol_base02
		if variant == "hard" then
			visual = palette.sol_base03
			palette.sol_base03 = palette.sol_base03_hard
		end

		local colors = {
			ui = {
				fg = palette.sol_base0,
				fg_dim = palette.sol_base00,
				fg_reverse = palette.sol_base3,

				bg_dim = palette.sol_base01,
				bg_gutter = palette.sol_base02,

				bg_m3 = palette.sol_base01,
				bg_m2 = palette.sol_base00,
				bg_m1 = palette.sol_base01,
				bg = palette.sol_base03,
				bg_p1 = palette.sol_base02,
				bg_p2 = palette.sol_base02,

				special = palette.sol_magenta,
				nontext = palette.sol_base01,
				whitespace = palette.sol_base01,

				bg_search = palette.sol_cyan,
				bg_visual = visual,

				pmenu = {
					fg = palette.sol_base0,
					fg_sel = "none", -- This is important to make highlights pass-through
					bg = palette.sol_base02,
					bg_sel = palette.sol_base01,
					bg_sbar = palette.sol_base01,
					bg_thumb = palette.sol_cyan,
				},
				float = {
					fg = palette.sol_base0,
					bg = palette.sol_base03,
					fg_border = palette.sol_base01,
					bg_border = palette.sol_base03,
				},
			},
			syn = {
				string = palette.sol_green,
				variable = palette.sol_base0,
				number = palette.sol_base0,
				constant = palette.sol_orange,
				identifier = palette.sol_base0,
				parameter = palette.sol_base0,
				fun = palette.sol_blue,
				statement = palette.sol_violet,
				keyword = palette.sol_magenta,
				operator = palette.sol_yellow,
				preproc = palette.sol_red,
				type = palette.sol_yellow,
				regex = palette.sol_yellow,
				deprecated = palette.sol_base01,
				comment = palette.sol_orange,
				docComment = palette.sol_cyan,
				punct = palette.sol_base0,
				special1 = palette.sol_blue,
				special2 = palette.sol_red,
				special3 = palette.sol_red,
			},
			vcs = {
				added = palette.sol_green,
				removed = palette.sol_red,
				changed = palette.sol_orange,
			},
			diff = {
				add = palette.sol_mix_green,
				delete = palette.sol_mix_red,
				change = palette.sol_mix_base1,
				text = palette.sol_mix_blue,
			},
			diag = {
				ok = palette.sol_green,
				error = palette.sol_red,
				warning = palette.sol_yellow,
				info = palette.sol_blue,
				hint = palette.sol_cyan,
			},
			term = {
				palette.sol_base02, -- black
				palette.sol_red, -- red
				palette.sol_green, -- green
				palette.sol_yellow, -- yellow
				palette.sol_blue, -- blue
				palette.sol_magenta, -- magenta
				palette.sol_cyan, -- cyan
				palette.sol_base2, -- white
				palette.sol_base03, -- bright black
				palette.sol_red, -- bright red
				palette.sol_base01, -- bright green
				palette.sol_base00, -- bright yellow
				palette.sol_blue, -- bright blue
				palette.sol_violet, -- bright magenta
				palette.sol_base1, -- bright cyan
				palette.sol_base3, -- bright white
				palette.sol_orange, -- extended color 1
				palette.sol_red, -- extended color 2
			},
		}

		return colors, palette.sol_base03
	end
end

return public

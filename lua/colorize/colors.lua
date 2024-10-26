---@class PaletteColors
local palette = {
	-- Bg Shades
	dark0_hard = "#1d2021",
	dark0 = "#282828",
	dark0_soft = "#32302f",
	dark1 = "#3c3836",
	dark2 = "#504945",
	dark3 = "#665c54",
	dark4 = "#7c6f64",

	light0_hard = "#f9f5d7",
	light0 = "#fbf1c7",
	light0_soft = "#f2e5bc",
	light1 = "#ebdbb2",
	light2 = "#d5c4a1",
	light3 = "#bdae93",
	light4 = "#a89984",

	gray = "#928374",

	brightRed = "#fb4934",
	neutralRed = "#cc241d",
	fadedRed = "#9d0006",
	darkRedHard = "#792329",
	darkRed = "#722529",
	darkRedSoft = "#7b2c2f",

	brightGreen = "#b8bb26",
	neutralGreen = "#98971a",
	fadedGreen = "#79740e",
	darkGreenHard = "#5a633a",
	darkGreen = "#62693e",
	darkGreenSoft = "#686d43",

	brightYellow = "#fabd2f",
	neutralYellow = "#d79921",
	fadedYellow = "#b57614",

	brightBlue = "#83a598",
	neutralBlue = "#458588",
	fadedBlue = "#076678",

	brightPurple = "#d3869b",
	neutralPurple = "#b16286",
	fadedPurple = "#8f3f71",

	brightAqua = "#8ec07c",
	neutralAqua = "#689d6a",
	fadedAqua = "#427b58",
	darkAquaHard = "#3e4934",
	darkAqua = "#49503b",
	darkAquaSoft = "#e1dbac",

	brightOrange = "#fe8019",
	neutralOrange = "#d65d03",
	fadedOrange = "#af3a03",

	-- solarized
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

local M = {}
--- Generate colors table:
--- * opts:
---   - colors: Table of personalized colors and/or overrides of existing ones.
---     Defaults to ColroizeConfig.colors.
---   - theme: Use selected theme. Defaults to ColorizeConfig.theme
---     according to the value of 'background' option.
---@param opts? { colors?: table, theme?: string }
---@return { theme: ThemeColors, palette: PaletteColors}
function M.setup(opts)
	opts = opts or {}
	local override_colors = opts.colors or require("colorize").config.colors
	local theme = opts.theme or require("colorize")._CURRENT_THEME -- WARN: this fails if called before gruvbox.load()

	if not theme then
		error(
			"colorize.colors.setup(): Unable to infer `theme`. Either specify a theme or call this function after ':colorscheme gruvbox'"
		)
	end

	-- Add to and/or override palette_colors
	local updated_palette_colors = vim.tbl_extend("force", palette, override_colors.palette or {})

	-- Generate the theme according to the updated palette colors
	local theme_colors = require("colorize.themes")[theme](updated_palette_colors)

	-- Add to and/or override theme_colors
	local theme_overrides =
		vim.tbl_deep_extend("force", override_colors.theme["all"] or {}, override_colors.theme[theme] or {})
	local updated_theme_colors = vim.tbl_deep_extend("force", theme_colors, theme_overrides)
	-- return palette_colors AND theme_colors

	return {
		theme = updated_theme_colors,
		palette = updated_palette_colors,
	}
end

return M

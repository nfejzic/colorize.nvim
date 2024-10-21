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
	darkAqua = "#e8e5b5",
	darkAquaSoft = "#e1dbac",

	brightOrange = "#fe8019",
	neutralOrange = "#d65d03",
	fadedOrange = "#af3a03",
}

local M = {}
--- Generate colors table:
--- * opts:
---   - colors: Table of personalized colors and/or overrides of existing ones.
---     Defaults to GruvboxConfig.colors.
---   - theme: Use selected theme. Defaults to GruvboxConfig.theme
---     according to the value of 'background' option.
---@param opts? { colors?: table, theme?: string }
---@return { theme: ThemeColors, palette: PaletteColors}
function M.setup(opts)
	opts = opts or {}
	local override_colors = opts.colors or require("gruvbox").config.colors
	local theme = opts.theme or require("gruvbox")._CURRENT_THEME -- WARN: this fails if called before gruvbox.load()

	if not theme then
		error(
			"gruvbox.colors.setup(): Unable to infer `theme`. Either specify a theme or call this function after ':colorscheme gruvbox'"
		)
	end

	-- Add to and/or override palette_colors
	local updated_palette_colors = vim.tbl_extend("force", palette, override_colors.palette or {})

	-- Generate the theme according to the updated palette colors
	local theme_colors = require("gruvbox.themes")[theme](updated_palette_colors)

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

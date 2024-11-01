local gruvbox = require('colorize.themes.gruvbox')
local solarized = require('colorize.themes.solarized')
local rose_pine = require('colorize.themes.rose_pine')

---@class PaletteColors
local palette = {
	gruvbox = gruvbox.palette(),
	solarized = solarized.palette(),
	rose_pine = rose_pine.palette(),
}

local M = {}
--- Generate colors table:
--- * opts:
---   - colors: Table of personalized colors and/or overrides of existing ones.
---     Defaults to ColorizeConfig.colors.
---   - theme: Use selected theme. Defaults to ColorizeConfig.theme
---     according to the value of 'background' option.
---@param opts? { colors?: {palette: PaletteColors, theme: table<string, ThemeColors>}, theme?: string }
---@return { theme: ThemeColors, palette: PaletteColors, base_color: string }
function M.setup(opts)
	opts = opts or {}
	local override_colors = opts.colors or require("colorize").config.colors
	local theme = opts.theme or require("colorize")._CURRENT_THEME -- WARN: this fails if called before colorize.load()

	if not theme then
		error(
			"colorize.colors.setup(): Unable to infer `theme`. Either specify a theme or call this function after ':colorscheme gruvbox'"
		)
	end

	-- Add to and/or override palette_colors
	local updated_palette_colors = vim.tbl_extend("force", palette, override_colors.palette or {})

	-- Generate the theme according to the updated palette colors
	local new_theme = require("colorize.themes")[theme](updated_palette_colors)

	-- Add to and/or override theme_colors
	local theme_overrides =
		vim.tbl_deep_extend("force", override_colors.theme["all"] or {}, override_colors.theme[new_theme] or {})
	local updated_theme_colors = vim.tbl_deep_extend("force", new_theme.colors, theme_overrides)
	-- return palette_colors AND theme_colors

	return {
		theme = updated_theme_colors,
		palette = updated_palette_colors,
		base_color = new_theme.base_color,
	}
end

return M

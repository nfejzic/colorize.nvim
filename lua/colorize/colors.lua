local M = {}
--- Generate colors table:
--- * opts:
---   - colors: Table of personalized colors and/or overrides of existing ones.
---     Defaults to ColorizeConfig.colors.
---   - theme: Use selected theme. Defaults to ColorizeConfig.theme
---     according to the value of 'background' option.
---@param opts? { palette_overrides?: Colors.P, theme?: string }
---@return { theme: ThemeColors, base_color: string }
function M.setup(opts)
	opts = opts or {}
	local override_colors = opts.palette_overrides or require("colorize").config.palette_overrides
	local theme = opts.theme or require("colorize")._CURRENT_THEME -- WARN: this fails if called before colorize.load()

	if not theme then
		error(
			"colorize.colors.setup(): Unable to infer `theme`. Either specify a theme or call this function after ':colorscheme colorize-gruvbox-dark-hard'"
		)
	end

	local themes = require("colorize.themes")

	---@type Colors
	local theme_palette = themes.palettes[theme]

	local theme_palette_with_overrides = vim.tbl_extend("force", theme_palette, override_colors or {})

	-- Generate the theme according to the updated palette colors
	local new_theme = require("colorize.themes").colorize(theme_palette_with_overrides)

	return {
		theme = new_theme.colors,
		palette = theme_palette_with_overrides,
		base_color = new_theme.base_color,
	}
end

return M

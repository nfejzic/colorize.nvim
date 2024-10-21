---@class PaletteColors
local palette = {

    -- Bg Shades
    sumiInk0 = "#282828", --
    sumiInk1 = "#32302f",
    sumiInk2 = "#504945",
    sumiInk3 = "#1d2021", -- bg: dark0_hard
    sumiInk4 = "#3c3836", -- gutter color
    sumiInk5 = "#665c54",
    sumiInk6 = "#7c6f64", --fg

    -- Popup and Floats
    waveBlue1 = "#458588",
    waveBlue2 = "#3e4934",

    -- Diff and Git
    darkGreenHard = "#5a633a", -- dark_green_hard
    neutralYellow = "#d79921", -- neutral_yellow
    darkRedHard = "#792329",   -- dark_red_hard
    fadedBlue = "#076678",     -- faded_blue
    neutralGreen = "#98971a",  -- netural_*
    brightRed = "#fb4934",     -- bright_red
    brightYellow = "#fabd2f",  -- bright_yellow

    -- Diag
    brightOrange = "#fe8019", -- bright orange
    neutralAqua = "#689d6a",  -- neutral aqua
    brightAqua = "#8ec07c",   -- neutral aqua

    -- Fg and Comments
    oldWhite = "#d5c4a1",
    fujiWhite = "#ebdbb2", -- fg: light1
    fujiGray = "#a89984",

    brightPurple = "#d3869b",  -- bright_purple
    neutralPurple = "#b16286", -- neutral_purple
    brightBlue = "#83a598",    -- bright_blue
    unused = "#A3D4D5",        -- unused yet
    waveAqua2 = "#7AA89F",     -- improve lightness: desaturated greenish Aqua

    brightGreen = "#b8bb26",   -- bright_green
    fadedYellow = "#b57614",   -- faded_yellow

    dark4 = "#7c6f64",         -- dark4
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
            "gruvbox.colors.setup(): Unable to infer `theme`. Either specify a theme or call this function after ':colorscheme gruvbox'")
    end

    -- Add to and/or override palette_colors
    local updated_palette_colors = vim.tbl_extend("force", palette, override_colors.palette or {})

    -- Generate the theme according to the updated palette colors
    local theme_colors = require("gruvbox.themes")[theme](updated_palette_colors)

    -- Add to and/or override theme_colors
    local theme_overrides = vim.tbl_deep_extend("force", override_colors.theme["all"] or {},
        override_colors.theme[theme] or {})
    local updated_theme_colors = vim.tbl_deep_extend("force", theme_colors, theme_overrides)
    -- return palette_colors AND theme_colors

    return {
        theme = updated_theme_colors,
        palette = updated_palette_colors,
    }
end

return M

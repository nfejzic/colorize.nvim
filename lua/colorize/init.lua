local M = {}

---@alias ColorSpec string RGB Hex string
---@alias ColorTable PaletteColors
---@alias ColorizeColorsSpec { palette: ColorTable, theme: ColorTable }
---@alias ColorizeColors { palette: PaletteColors, theme: ThemeColors }

--- default config
---@class ColorizeConfig
M.config = {
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,
    dimInactive = false,
    terminalColors = true,
    ---@type "minimal"|"medium"|"full"|"none"
    semantic_highlighting = "full",
    colors = {
        palette = {},
        theme = {
            ["gruvbox-dark-hard"] = {}
        }
    },
    ---@type fun(colors: ColorizeColorsSpec): table<string, table>
    overrides = function()
        return {}
    end,
    ---@type { dark: ThemeChoice|nil, light: ThemeChoice|nil }
    background = { dark = nil, light = nil },
    ---@type ThemeChoice
    theme = "gruvbox-dark-hard",
    compile = false,
}

local function check_config(config)
    local err
    return not err
end

--- update global configuration with user settings
---@param config? ColorizeConfig user configuration
function M.setup(config)
    if check_config(config) then
        M.config = vim.tbl_deep_extend("force", M.config, config or {})
    else
        vim.notify("Colorize: Errors found while loading user config. Using default config.", vim.log.levels.ERROR)
    end
end

--- load the colorscheme
---@param theme? string
function M.load(theme)
    local utils = require("colorize.utils")

    theme = theme or M.config.background[vim.o.background] or M.config.theme
    M._CURRENT_THEME = theme

    if vim.g.colors_name then
        vim.cmd("hi clear")
    end

    vim.g.colors_name = "colorize"
    vim.o.termguicolors = true

    if M.config.compile then
        if utils.load_compiled(theme) then
            return
        end

        M.compile()
        utils.load_compiled(theme)
    else
        local colors = require("colorize.colors").setup({ theme = theme, colors = M.config.colors })
        local highlights = require("colorize.highlights").setup(colors, M.config, colors.base_color)
        require("colorize.highlights").highlight(
            highlights,
            M.config.terminalColors and colors.theme.term or {},
            colors.base_color
        )
    end
end

function M.compile()
    for theme_name, _ in pairs(require("colorize.themes")) do
        local theme = require("colorize.colors").setup({ theme = theme_name, colors = M.config.colors })
        local highlights = require("colorize.highlights").setup(theme, M.config, theme.base_color)
        require("colorize.utils").compile(theme_name, highlights, M.config.terminalColors and theme.theme.term or {})
    end
end

vim.api.nvim_create_user_command("ColorizeCompile", function()
    for mod, _ in pairs(package.loaded) do
        if mod:match("^colorize%.") then
            package.loaded[mod] = nil
        end
    end
    M.compile()
    vim.notify("Colorize: compiled successfully!", vim.log.levels.INFO)
    M.load(M._CURRENT_THEME)
    vim.api.nvim_exec_autocmds("ColorScheme", { modeline = false })
end, {})

vim.api.nvim_create_user_command("Colorize", function(opts)
    local theme = opts.args
    M.config.theme = theme
    vim.cmd([[colorscheme colorize]])
end, {
    nargs = 1,
    complete = function()
        return {
            "gruvbox-dark-hard",
            "gruvbox-dark-soft",
            "gruvbox-dark",
            "gruvbox-light-hard",
            "gruvbox-light-soft",
            "gruvbox-light",

            "solarized-dark-hard",
            "solarized-dark",

            "rose-pine-main",
            "rose-pine-black",
            "rose-pine-moon",
            "rose-pine-dawn",

            "kanagawa-wave",
            "kanagawa-dragon",
            "kanagawa-lotus",

            "kanso-zen",
            "kanso-ink",
            "kanso-pearl",
            "kanso-mist",

            "catppuccin-latte",
            "catppuccin-frappe",
            "catppuccin-macchiato",
            "catppuccin-mocha",

            "everforest-dark-hard",
            -- "monokai-classic",
            "monokai-light",
            "monokai-machine",
            "monokai-octagon",
            "monokai-pro",
            "monokai-ristretto",
            "monokai-spectrum",
        }
    end,
})

return M

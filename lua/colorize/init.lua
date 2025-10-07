local M = {}

---@alias ColorSpec string RGB Hex string
---@alias ColorizeColors { theme: ThemeColors }

---@class (partial) Colors.P: Colors

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
    ---@type Colors.P
    palette_overrides = {},
    ---@type fun(colors: ColorizeColors): table<string, table>
    overrides = function()
        return {}
    end,
    ---@type { dark: ThemeChoice|nil, light: ThemeChoice|nil }
    background = { dark = nil, light = nil },
    ---@type ThemeChoice
    theme = "gruvbox-dark-hard",
    compile = false,
}

--- update global configuration with user settings
---@param config? ColorizeConfig user configuration
function M.setup(config)
    M.config = vim.tbl_deep_extend("force", M.config, config or {})
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
        local colors = require("colorize.colors").setup({
            theme = theme,
            palette_overrides = M.config.palette_overrides
        })
        local highlights = require("colorize.highlights").setup(
            colors,
            M.config
        )
        require("colorize.highlights").highlight(
            highlights,
            M.config.terminalColors and colors.theme.term or {},
            colors.base_color
        )
    end
end

function M.compile()
    for theme_name, _ in pairs(require("colorize.themes").palettes) do
        local theme = require("colorize.colors").setup({
            theme = theme_name,
            palette_overrides = M.config.palette_overrides
        })
        local highlights = require("colorize.highlights").setup(theme, M.config)
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

return M

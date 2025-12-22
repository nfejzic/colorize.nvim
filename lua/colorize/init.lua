local private = {
    file_path = vim.fn.stdpath("data") .. "/.nvim.colorize.lua",

    --- @type table<ThemeChoice>
    theme_choice = {
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

        "two-firewatch-dark",

        "vague",
    },
}

local M = {}

---@alias ColorSpec string RGB Hex string
---@alias ColorTable PaletteColors
---@alias ColorizeColorsSpec { palette: ColorTable, theme: ThemeColors }
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
    -- ---@type { dark: ThemeChoice|nil, light: ThemeChoice|nil }
    -- background = { dark = nil, light = nil },
    -- -@type ThemeChoice
    -- theme = "gruvbox-dark-hard",
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

    theme = theme or private.load_theme() or "kanagawa-wave"
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
        local highlights = require("colorize.highlights").setup(colors, M.config)
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

--- @param theme string
--- @return boolean true if theme name is supported, false otherwise
function private.is_supported_theme_name(theme)
    for _, name in ipairs(private.theme_choice) do
        if name == theme then
            return true
        end
    end
    return false
end

--- @return string|nil either loaded colorscheme, or nil if not yet persisted
function private.load_theme()
    local ok, colorscheme = pcall(dofile, private.file_path)

    if ok then
        return colorscheme
    else
        return nil
    end
end

--- @param theme ThemeChoice
local function persist_theme(theme)
    vim.uv.fs_open(private.file_path, "w", 432, function(_, fd)
        local string_to_write = "return " .. "'" .. theme .. "'"
        vim.uv.fs_write(fd, string_to_write, nil, function()
            vim.loop.fs_close(fd)
        end)
    end)
end

vim.api.nvim_create_user_command("Colorize", function(opts)
    local theme = opts.args

    if not private.is_supported_theme_name(theme) then
        vim.notify("Colorize: unsupported theme name provided: '" .. theme .. "'", vim.log.levels.ERROR)
        return
    end

    persist_theme(theme)

    vim.cmd([[colorscheme colorize]])
end, {
    nargs = 1,
    complete = function()
        return private.theme_choice
    end,
})

return M

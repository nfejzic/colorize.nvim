local M = {}

---@param color string
local function color_to_rgb(color)
    local function byte(value, offset)
        return bit.band(bit.rshift(value, offset), 0xFF)
    end

    local new_color = vim.api.nvim_get_color_by_name(color)
    if new_color == -1 then
        new_color = vim.opt.background:get() == "dark" and 000 or 255255255
    end

    return { byte(new_color, 16), byte(new_color, 8), byte(new_color, 0) }
end
---@param fg string Foreground color
---@param bg string Background color
---@param alpha number Between 0 (background) and 1 (foreground)
local function blend(fg, bg, alpha)
    local fg_rgb = color_to_rgb(fg)
    local bg_rgb = color_to_rgb(bg)

    local function blend_channel(i)
        local ret = (alpha * fg_rgb[i] + ((1 - alpha) * bg_rgb[i]))
        return math.floor(math.min(math.max(0, ret), 255) + 0.5)
    end

    return string.format("#%02X%02X%02X", blend_channel(1), blend_channel(2), blend_channel(3))
end

---@param highlights table
---@param termcolors table
---@param base_color string
function M.highlight(highlights, termcolors, base_color)
    for highlight, spec in pairs(highlights) do
        if spec ~= nil and spec.blend ~= nil and (spec.blend >= 0 and spec.blend <= 100) and spec.bg ~= nil then
            spec.bg = blend(spec.bg, spec.blend_on or base_color, spec.blend / 100)
        end

        vim.api.nvim_set_hl(0, highlight, spec)
    end
    for i, tcolor in ipairs(termcolors) do
        vim.g["terminal_color_" .. i - 1] = tcolor
    end
end

---@param colors ColorizeColors
---@param config? ColorizeConfig
function M.setup(colors, config)
    config = config or require("colorize").config

    local highlights = {}
    for _, highlight in ipairs({ "editor", "syntax", "treesitter", "lsp", "plugins" }) do
        local mod = require("colorize.highlights." .. highlight)
        for hl, spec in pairs(mod.setup(colors, config)) do
            highlights[hl] = spec
        end
    end

    for hl, spec in pairs(config.overrides(colors)) do
        if highlights[hl] and next(spec) then
            highlights[hl].link = nil
        end
        highlights[hl] = vim.tbl_extend("force", highlights[hl] or {}, spec)
    end

    return highlights
end

return M

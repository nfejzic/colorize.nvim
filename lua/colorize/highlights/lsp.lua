local M = {}

---@param colors ColorizeColors
local function minimal(colors)
    local theme = colors.theme

    return {
        -- ["@lsp.type.class"] = { link = "Structure" },
        ["@lsp.type.decorator"] = { link = "@lsp" },
        ["@lsp.type.enum"] = { link = "@lsp" },
        ["@lsp.type.enumMember"] = { link = "@lsp" },
        ["@lsp.type.function"] = { link = "@lsp" },
        -- ["@lsp.type.interface"] = { link = "Structure" },
        ["@lsp.type.macro"] = { link = "@lsp" },
        ["@lsp.type.method"] = { link = "@lsp" },                   -- Function - use treesitter
        ["@lsp.type.namespace"] = { link = "@lsp" },                -- Structure
        ["@lsp.type.parameter"] = { link = "@variable.parameter" }, -- Identifier
        ["@lsp.type.formatSpecifier"] = { link = "Constant" },
        ["@lsp.type.lifetime"] = { link = "@attribute" },
        ["@lsp.type.keyword"] = { link = "@lsp" },
        -- ["@lsp.type.property"] = { link = "Identifier" },
        -- ["@lsp.type.struct"] = { link = "Structure" },
        -- ["@lsp.type.type"] = { link = "Type" },
        -- ["@lsp.type.typeParameter"] = { link = "TypeDef" },
        ["@lsp.type.variable"] = { link = '@variable' }, -- Identifier
        ["@lsp.type.comment"] = { link = '@lsp' },       -- Comment
        ["@lsp.mod.documentation"] = { link = '@lsp' },
        ["@lsp.type.typeAlias"] = { link = "@lsp" },
        ["@lsp.type.selfKeyword"] = { link = "@lsp" },

        ["@lsp.type.selfParameter"] = { link = "@lsp" },
        -- ["@lsp.type.builtinConstant"] = { link = "@constant.builtin" },
        ["@lsp.type.builtinConstant"] = { link = "@lsp" },
        ["@lsp.type.magicFunction"] = { link = "@lsp" },


        ["@lsp.mod.readonly"] = { link = "Constant" },
        ["@lsp.mod.typeHint"] = { link = "Type" },
        -- ["@lsp.mod.attribute"] = { link = "@attribute" },
        -- ["@lsp.mod.defaultLibrary"] = { link = "Special" },
        -- ["@lsp.mod.builtin"] = { link = "Special" },

        ["@lsp.typemod.deriveHelper"] = { link = "Macro" },
        ["@lsp.typemod.comment.injected"] = { link = "Comment" },
        ["@lsp.typemod.comment.documentation"] = { link = "@lsp" },

        ["@lsp.typemod.operator.controlFlow"] = { link = "@lsp" },
        ["@lsp.typemod.keyword.documentation"] = { link = "@lsp" },

        ["@lsp.typemod.variable.global"] = { link = "@lsp" },
        ["@lsp.typemod.variable.static"] = { link = "@lsp" },
        ["@lsp.typemod.variable.defaultLibrary"] = { link = "@lsp" },

        ["@lsp.typemod.function.builtin"] = { link = "@lsp" },
        ["@lsp.typemod.function.defaultLibrary"] = { link = "@lsp" },
        ["@lsp.typemod.method.defaultLibrary"] = { link = "@lsp" },

        ["@lsp.typemod.operator.injected"] = { link = "Operator" },
        ["@lsp.typemod.string.injected"] = { link = "String" },
        ["@lsp.typemod.variable.injected"] = { link = "@variable" },
        ["@lsp.typemod.keyword.injected"] = { link = "@keyword" },
        ["@lsp.typemod.punctuation.injected"] = { link = "@punctuation" },
        ["@lsp.typemod.namespace.injected"] = { link = "@module" },
        ["@lsp.typemod.function.injected"] = { link = "Function" },
        ["@lsp.typemod.macro.injected"] = { link = "Macro" },
        ["@lsp.typemod.const.injected"] = { link = "@constant" },
        ["@lsp.typemod.method.injected"] = { link = "Function" },
        ["@lsp.type.generic"] = { link = "@variable" },
        ["@lsp.typemod.generic.injected"] = { link = "@lsp.type.generic" },

        ["@lsp.typemod.function.readonly"] = { fg = theme.syn.fun, bold = true }
    }
end

---@param colors ColorizeColors
local function full(colors)
    local theme = colors.theme

    return {
        -- ["@lsp.type.class"] = { link = "Structure" },
        -- ["@lsp.type.decorator"] = { link = "Function" },
        -- ["@lsp.type.enum"] = { link = "Structure" },
        -- ["@lsp.type.enumMember"] = { link = "Constant" },
        -- ["@lsp.type.function"] = { link = "Function" },
        -- ["@lsp.type.interface"] = { link = "Structure" },
        ["@lsp.type.macro"] = { link = "Macro" },
        ["@lsp.type.method"] = { link = "none" },                   -- Function - use treesitter
        ["@lsp.type.namespace"] = { link = "@module" },             -- Structure
        ["@lsp.type.parameter"] = { link = "@variable.parameter" }, -- Identifier
        ["@lsp.type.formatSpecifier"] = { link = "Constant" },
        ["@lsp.type.lifetime"] = { link = "@attribute" },
        ["@lsp.type.keyword"] = { link = "@keyword" },
        -- ["@lsp.type.property"] = { link = "Identifier" },
        ["@lsp.type.struct"] = { link = "@lsp" },
        -- ["@lsp.type.type"] = { link = "Type" },
        -- ["@lsp.type.typeParameter"] = { link = "TypeDef" },
        ["@lsp.type.variable"] = { link = '@variable' }, -- Identifier
        ["@lsp.type.comment"] = { link = '@lsp' },       -- Comment
        ["@lsp.mod.documentation"] = { link = '@lsp' },
        ["@lsp.type.typeAlias"] = { link = "@lsp" },
        ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },

        ["@lsp.type.selfParameter"] = { link = "@variable.builtin" },
        -- ["@lsp.type.builtinConstant"] = { link = "@constant.builtin" },
        ["@lsp.type.builtinConstant"] = { link = "@constant.builtin" },
        ["@lsp.type.magicFunction"] = { link = "@function.builtin" },


        ["@lsp.mod.readonly"] = { link = "Constant" },
        ["@lsp.mod.typeHint"] = { link = "Type" },
        -- ["@lsp.mod.attribute"] = { link = "@attribute" },
        -- ["@lsp.mod.defaultLibrary"] = { link = "Special" },
        -- ["@lsp.mod.builtin"] = { link = "Special" },

        ["@lsp.typemod.deriveHelper"] = { link = "Macro" },
        ["@lsp.typemod.comment.injected"] = { link = "Comment" },
        ["@lsp.typemod.comment.documentation"] = { link = "@comment.documentation" },

        ["@lsp.typemod.operator.controlFlow"] = { link = "Operator" },
        ["@lsp.typemod.keyword.documentation"] = { link = "Special" },

        ["@lsp.typemod.variable.global"] = { link = "Constant" },
        ["@lsp.typemod.variable.static"] = { link = "Constant" },
        ["@lsp.typemod.variable.defaultLibrary"] = { link = "@lsp" },

        ["@lsp.typemod.function.builtin"] = { link = "@function.builtin" },
        ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
        ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },

        ["@lsp.typemod.operator.injected"] = { link = "Operator" },
        ["@lsp.typemod.string.injected"] = { link = "String" },
        ["@lsp.typemod.variable.injected"] = { link = "@variable" },
        ["@lsp.typemod.keyword.injected"] = { link = "@keyword" },
        ["@lsp.typemod.punctuation.injected"] = { link = "@punctuation" },
        ["@lsp.typemod.namespace.injected"] = { link = "@module" },
        ["@lsp.typemod.function.injected"] = { link = "Function" },
        ["@lsp.typemod.macro.injected"] = { link = "Macro" },

        ["@lsp.typemod.function.readonly"] = { fg = theme.syn.fun, bold = true }
    }
end

---@param colors ColorizeColors
---@param config? ColorizeConfig
function M.setup(colors, config)
    config = config or require("colorize").config

    if config.semantic_highlighting == "minimal" then
        return minimal(colors)
    elseif config.semantic_highlighting == "full" then
        return full(colors)
    else
        return {}
    end
end

return M

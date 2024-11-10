local M = {}
---@param colors ColorizeColors
---@param config? ColorizeConfig
function M.setup(colors, config)
    config = config or require("colorize").config
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
        -- ["@lsp.type.struct"] = { link = "Structure" },
        -- ["@lsp.type.type"] = { link = "Type" },
        -- ["@lsp.type.typeParameter"] = { link = "TypeDef" },
        ["@lsp.type.variable"] = { link = '@variable' }, -- Identifier
        ["@lsp.type.comment"] = { link = '@lsp' },       -- Comment
        ["@lsp.mod.documentation"] = { link = '@lsp' },
        ["@lsp.type.typeAlias"] = { link = '@lsp' },

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
        ["@lsp.typemod.variable.defaultLibrary"] = { link = "Special" },

        ["@lsp.typemod.function.builtin"] = { link = "@function.builtin" },
        ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
        ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },

        ["@lsp.typemod.operator.injected"] = { link = "Operator" },
        ["@lsp.typemod.string.injected"] = { link = "String" },
        ["@lsp.typemod.variable.injected"] = { link = "@variable" },
        ["@lsp.typemod.keyword.injected"] = { link = "@keyword" },
        ["@lsp.typemod.punctuation.injected"] = { link = "@punctuation" },
        ["@lsp.typemod.namespace.injected"] = { link = "@module" },

        ["@lsp.typemod.function.readonly"] = { fg = theme.syn.fun, bold = true }
    }
end

return M

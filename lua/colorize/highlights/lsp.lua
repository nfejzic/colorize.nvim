local M = {}

---@param colors ColorizeColors
local function minimal(colors)
    local theme = colors.theme

    return {
        ["@lsp.type"] = { link = "Type" },
        ["@lsp.type.attributeBracket"] = { link = "@punctuation" },

        -- -- ["@lsp.type.class"] = { link = "Structure" },
        ["@lsp.type.decorator"] = { link = "PreProc" },
        ["@lsp.type.enum"] = { link = "Type" },

        -- ["@lsp.type.interface"] = { link = "Structure" },
        ["@lsp.type.macro"] = { link = "PreProc" },
        ["@lsp.type.procMacro"] = { link = "PreProc" },

        ["@lsp.type.method"] = { link = "Function" },               -- Function - use treesitter
        ["@lsp.type.namespace"] = { link = "@module" },             -- Structure
        ["@lsp.type.parameter"] = { link = "@variable.parameter" }, -- Identifier
        ["@lsp.type.formatSpecifier"] = { link = "Constant" },
        ["@lsp.type.lifetime"] = { link = "@attribute" },
        ["@lsp.type.builtinAttribute"] = { link = "PreProc" },

        ["@lsp.type.selfTypeKeyword"] = { link = "Type" },

        ["@lsp.type.unresolvedReference.rust"] = { link = "DiagnosticUnderlineError" },

        -- ["@lsp.type.property"] = { link = "Identifier" },
        -- ["@lsp.type.struct"] = { link = "Structure" },
        -- ["@lsp.type.type"] = { link = "Type" },
        -- ["@lsp.type.typeParameter"] = { link = "TypeDef" },
        ["@lsp.type.variable"] = { link = '@variable' }, -- Identifier
        ["@lsp.mod.callable"] = { fg = theme.syn.special1 },
        ["@lsp.type.comment"] = { link = '@lsp' },       -- Comment
        -- ["@lsp.mod.documentation"] = { link = '@comment.documentation' },

        ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },

        -- ["@lsp.type.builtinConstant"] = { link = "@constant.builtin" },

        ["@lsp.mod.readonly"] = { link = "Type" },
        ["@lsp.mod.typeHint"] = { link = "Type" },

        -- ["@lsp.mod.attribute"] = { link = "@attribute" },
        -- ["@lsp.mod.defaultLibrary"] = { link = "Special" },
        -- ["@lsp.mod.builtin"] = { link = "Special" },

        ["@lsp.typemod.deriveHelper"] = { link = "Macro" },
        ["@lsp.typemod.comment.injected"] = { link = "Comment" },

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
        ["@lsp.typemod.function.readonly"] = { link = "Function" },

        ["@lsp.typemod.generic.injected"] = { link = "@lsp.type.generic" },
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

        -- ["@lsp.type.type"] = { link = "Type" },
        -- ["@lsp.type.typeParameter"] = { link = "TypeDef" },
        ["@lsp.type.variable"] = { link = '@variable' }, -- Identifier
        ["@lsp.type.comment"] = { link = '@lsp' },       -- Comment
        ["@lsp.mod.documentation"] = { link = '@lsp' },

        ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
        ["@lsp.type.selfTypeKeyword"] = { link = "Type" },

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

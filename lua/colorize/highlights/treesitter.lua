local M = {}

---@param colors ColorizeColors
---@param config? ColorizeConfig
function M.setup(colors, config)
    config = config or require("colorize").config
    local theme = colors.theme
    return {
        -- @variable                       various variable names
        ["@variable"] = { fg = theme.ui.fg },
        -- @variable.builtin (Special)     built-in variable names (e.g. `this`, `self`)
        ["@variable.builtin"] = { fg = theme.syn.constant, italic = false },
        -- @variable.parameter             parameters of a function
        ["@variable.parameter"] = { fg = theme.syn.parameter },
        -- @variable.parameter.builtin     special parameters (e.g. `_`, `it`)
        -- @variable.member                object and struct fields
        ["@variable.member"] = { fg = theme.syn.identifier },
        --
        -- @constant (Constant)              constant identifiers
        ["@constant"] = { link = "Constant" },
        -- @constant.builtin       built-in constant values
        -- @constant.macro         constants defined by the preprocessor
        ["@constant.comment"] = { link = "Keyword" },
        ["@constant.builtin"] = { link = "@constant" },
        --
        -- @module (Structure)      modules or namespaces
        ["@module"] = { link = "@variable" },
        -- @module.builtin         built-in modules or namespaces
        -- @label                  `GOTO` and other labels (e.g. `label:` in C), including heredoc labels
        ["@label"] = { fg = theme.syn.identifier },
        --
        -- @string                 string literals
        -- @string.documentation   string documenting code (e.g. Python docstrings)
        ["@string.documentation"] = { link = "@comment.documentation" },
        -- @string.regexp          regular expressions
        ["@string.regexp"] = { fg = theme.syn.regex },
        -- @string.escape          escape sequences
        ["@string.escape"] = { fg = theme.syn.regex, bold = true },
        -- @string.special         other special strings (e.g. dates)
        -- @string.special.symbol  symbols or atoms
        ["@string.special.symbol"] = { fg = theme.syn.identifier },
        -- @string.special.path    filenames
        -- @string.special.url (Underlined)     URIs (e.g. hyperlinks)
        ["@string.special.url"] = { fg = theme.syn.special1, undercurl = true },
        -- @character              character literals
        -- @character.special      special characters (e.g. wildcards)
        ["@character.special"] = { link = "Variable" },
        --
        -- @boolean                boolean literals
        -- @number                 numeric literals
        -- @number.float           floating-point number literals
        --
        -- @type                   type or class definitions and annotations
        -- @type.builtin           built-in types
        ["@type.builtin"] = { link = "Type" },
        -- @type.definition        identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)
        --
        -- @attribute              attribute annotations (e.g. Python decorators, Rust lifetimes)
        ["@attribute"] = { fg = theme.syn.special1 },
        -- @attribute.builtin      builtin annotations (e.g. `@property` in Python)
        ["@attribute.builtin"] = { link = "@attribute" },
        -- @property               the key in key/value pairs
        --
        -- @function               function definitions
        ["@function.builtin"] = { link = "@function" },
        -- @function.call          function calls
        ["@function.macro"] = { link = "Macro" },           --         preprocessor macros
        ["@macro_invocation"] = { fg = theme.syn.keyword }, --         preprocessor macros
        ["@assert_macro"] = { link = "Macro" },
        ["@superimportant"] = { fg = theme.syn.operator },
        --
        -- @function.method        method definitions
        -- @function.method.call   method calls
        --
        -- @constructor            constructor calls and definitions
        ["@constructor"] = { fg = theme.syn.special1 },
        ["@constructor.lua"] = { fg = theme.syn.punct },
        -- @operator               symbolic operators (e.g. `+`, `*`)
        ["@operator"] = { link = "Operator" },
        --
        -- @keyword                keywords not fitting into specific categories
        -- @keyword.coroutine      keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
        -- @keyword.function       keywords that define a function (e.g. `func` in Go, `def` in Python)
        -- @keyword.operator       operators that are English words (e.g. `and`, `or`)
        -- ["@keyword.operator"] = { fg = theme.syn.special2, bold = true },
        -- @keyword.import         keywords for including modules (e.g. `import`, `from` in Python)
        ["@keyword.import"] = { link = "PreProc" },
        -- @keyword.type           keywords defining composite types (e.g. `struct`, `enum`)
        -- @keyword.modifier       keywords defining type modifiers (e.g. `const`, `static`, `public`)
        ["@keyword.modifier"] = { link = "Keyword" },

        ["@unsafe_specifier"] = { link = "Exception" },
        ["@mutable_specifier"] = { link = "Type" },

        -- @keyword.repeat         keywords related to loops (e.g. `for`, `while`)
        -- @keyword.return         keywords like `return` and `yield`
        ["@keyword.return"] = vim.tbl_extend("force", { fg = theme.syn.special2 }, config.keywordStyle),
        -- @keyword.debug          keywords related to debugging
        ["@keyword.debug.rust"] = { link = "PreProc" },
        -- @keyword.exception      keywords related to exceptions (e.g. `throw`, `catch`)
        ["@keyword.exception"] = vim.tbl_extend("force", { fg = theme.syn.special2 }, config.statementStyle),

        ["@keyword.luap"] = { link = "@string.regex" },
        --
        -- @keyword.conditional         keywords related to conditionals (e.g. `if`, `else`)
        -- @keyword.conditional.ternary ternary operator (e.g. `?`, `:`)
        --
        -- @keyword.directive           various preprocessor directives and shebangs
        -- @keyword.directive.define    preprocessor definition directives
        --
        -- @punctuation.delimiter  delimiters (e.g. `;`, `.`, `,`)
        ["@punctuation.delimiter"] = { fg = theme.syn.punct },
        -- @punctuation.bracket    brackets (e.g. `()`, `{}`, `[]`)
        ["@punctuation.bracket"] = { fg = theme.syn.punct },
        -- @punctuation.special    special symbols (e.g. `{}` in string interpolation)
        ["@punctuation.special"] = { fg = theme.syn.operator },
        --
        -- @comment                line and block comments
        -- @comment.documentation  comments documenting code
        ["@comment.documentation"] = { fg = theme.syn.docComment },
        --
        -- @comment.error          error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED`)
        ["@comment.error"] = { fg = theme.diag.error, reverse = false, bold = true },
        -- @comment.warning        warning-type comments (e.g. `WARNING`, `FIX`, `HACK`)
        ["@comment.warning"] = { fg = theme.diag.warning, reverse = false, bold = true },
        -- @comment.todo           todo-type comments (e.g. `TODO`, `WIP`)
        -- @comment.note           note-type comments (e.g. `NOTE`, `INFO`, `XXX`)
        ["@comment.note"] = { fg = theme.diag.hint, reverse = false, bold = true },
        --
        -- @markup.strong          bold text
        ["@markup.strong"] = { bold = true },
        -- @markup.italic          italic text
        ["@markup.italic"] = { italic = true },
        -- @markup.strikethrough   struck-through text
        ["@markup.strikethrough"] = { strikethrough = true },
        -- @markup.underline       underlined text (only for literal underline markup!)
        ["@markup.underline"] = { underline = true },
        --
        -- @markup.heading         headings, titles (including markers)
        ["@markup.heading"] = { link = "Function" },
        ["@markup.heading.gitcommit"] = { fg = theme.syn.variable },
        -- @markup.heading.1       top-level heading
        -- @markup.heading.2       section heading
        -- @markup.heading.3       subsection heading
        -- @markup.heading.4       and so on
        -- @markup.heading.5       and so forth
        -- @markup.heading.6       six levels ought to be enough for anybody
        --
        -- @markup.quote           block quotes
        ["@markup.quote"] = { link = "@variable.parameter" },
        -- @markup.math            math environments (e.g. `$ ... $` in LaTeX)
        ["@markup.math"] = { link = "Constant" },
        -- @markup.environment     environments (e.g. in LaTeX)
        ["@markup.environment"] = { link = "Keyword" },
        --
        -- @markup.link            text references, footnotes, citations, etc.
        -- @markup.link.label      link, reference descriptions
        -- @markup.link.url        URL-style links
        ["@markup.link.url"] = { link = "@string.special.url" },
        -- @markup.raw             literal or verbatim text (e.g. inline code)
        ["@markup.raw"] = { link = "String" },
        -- @markup.raw.block       literal or verbatim text as a stand-alone block
        --
        -- @markup.list            list markers
        -- @markup.list.checked    checked todo-style list markers
        -- @markup.list.unchecked  unchecked todo-style list markers
        --
        -- @diff.plus              added text (for diff files)
        ["@diff.plus"] = { fg = theme.vcs.added },
        -- @diff.minus             deleted text (for diff files)
        ["@diff.minus"] = { fg = theme.vcs.removed },
        -- @diff.delta             changed text (for diff files)
        ["@diff.delta"] = { fg = theme.vcs.changed },
        --
        -- @tag                    XML-style tag names (e.g. in XML, HTML, etc.)
        -- @tag.builtin            XML-style tag names (e.g. HTML5 tags)
        -- @tag.attribute          XML-style tag attributes
        ["@tag"] = { link = "Type" },
        ["@tag.attribute"] = { fg = theme.syn.identifier },
        -- @tag.delimiter          XML-style tag delimiters
        ["@tag.delimiter"] = { fg = theme.syn.punct },
    }
end

return M
--vim: fdm=marker

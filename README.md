<p align="center">
  <h2 align="center">GRUVBOX.nvim</h2>
</p>

<p align="center">
  <h2 align="center"><img alt="Preview" src="https://user-images.githubusercontent.com/36300441/222913073-22b95f11-8c08-4b2b-867c-19072c921de1.png" width=1000></h2>
</p>

## Features

- Extensive support for `TreeSitter` syntax highlighting, and _many_ popular plugins
- Compilation to lua byte code for super fast startup times

## Installation

Download with your favorite package manager.

```lua
use "nfejzic/gruvbox.nvim"
```

## Requirements

- neovim latest
- truecolor terminal support
- undercurl terminal support (optional)

## Usage

As simple as writing (pasting)

```vim
colorscheme gruvbox
```

```lua
vim.cmd("colorscheme gruvbox")
```

## Configuration

There is no need to call setup if you are ok with the defaults.

```lua
-- Default options:
require('gruvbox').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})

-- setup must be called before loading
vim.cmd("colorscheme gruvbox")
```

**_NOTE 1:_** If you enable compilation, make sure to run `:GruvboxCompile` command every time you make changes to your config.

```vim
" 1. Modify your config
" 2. Restart nvim
" 3. Run this command:
:GruvboxCompile
```

**_NOTE 2:_** Gruvbox adjusts to the value of some options. Make sure that the options `'laststatus'` and `'cmdheight'` are set **_before_** calling `setup`.

## Themes

Gruvbox comes in three variants:

- `wave` the default heart-warming theme,
- `dragon` for those late-night sessions
- `lotus` for when you're out in the open.

Themes can be changed in three ways:

- Setting `config.theme` to the desired theme. Note that `vim.o.background` **must** be unset.
- Using the `background` option:
  Any change to the value of `vim.o.background` will select the theme mapped by `config.background`.
  Use `vim.o.background = ""` to unset this option.
- Loading the colorscheme directly with:
  ```lua
  vim.cmd("colorscheme gruvbox-wave")
  vim.cmd("colorscheme gruvbox-dragon")
  vim.cmd("colorscheme gruvbox-lotus")
  ```
  or
  ```lua
  require("gruvbox").load("wave")
  ```

## Customization

In gruvbox, there are _two_ kinds of colors: `PaletteColors` and `ThemeColors`;
`PaletteColors` are defined directly as RGB Hex strings, and have arbitrary names
that recall their actual color. Conversely, `ThemeColors` are named and grouped _semantically_
on the basis of their actual function.

In short, a `palette` defines all the available colors, while a `theme` maps the `PaletteColors`
to specific `ThemeColors` and the same palette color may be assigned to multiple theme colors.

You can change _both_ theme or palette colors using `config.colors`.
All the palette color names can be found [here](lua/gruvbox/colors.lua),
while their usage by each theme can be found [here](lua/gruvbox/themes.lua).

```lua
require('gruvbox').setup({
    ...,
    colors = {
        palette = {
            -- change all usages of these colors
            sumiInk0 = "#000000",
            fujiWhite = "#FFFFFF",
        },
        theme = {
            -- change specific usages for a certain theme, or for all of them
            wave = {
                ui = {
                    float = {
                        bg = "none",
                    },
                },
            },
            dragon = {
                syn = {
                    parameter = "yellow",
                },
            },
            all = {
                ui = {
                    bg_gutter = "none"
                }
            }
        }
    },
    ...
})
```

You can also conveniently add/modify `hlgroups` using the `config.overrides` option.
Supported keywords are the same for `:h nvim_set_hl` `{val}` parameter.

```lua
require('gruvbox').setup({
    ...,
    overrides = function(colors)
        return {
            -- Assign a static color to strings
            String = { fg = colors.palette.carpYellow, italic = true },
            -- theme colors will update dynamically when you change theme!
            SomePluginHl = { fg = colors.theme.syn.type, bold = true },
        }
    end,
    ...
})
```

### Common customizations

#### Remove _gutter_ background

Remove the background of `LineNr`, `{Sign,Fold}Column` and friends

```lua
colors = {
    theme = {
        all = {
            ui = {
                bg_gutter = "none"
            }
        }
    }
}
```

#### Transparent Floating Windows

This will make floating windows look nicer with default borders.

```lua
overrides = function(colors)
    local theme = colors.theme
    return {
        NormalFloat = { bg = "none" },
        FloatBorder = { bg = "none" },
        FloatTitle = { bg = "none" },

        -- Save an hlgroup with dark background and dimmed foreground
        -- so that you can use it where your still want darker windows.
        -- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
        NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

        -- Popular plugins that open floats will link to NormalFloat by default;
        -- set their background accordingly if you wish to keep them dark and borderless
        LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
        MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
    }
end,
```

If you'd like to keep the floating windows darker, but you're unhappy with how
borders are rendered, consider using characters that are drawn at the edges of
the box:

```lua
{ "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }
```

#### Borderless Telescope

Block-like _modern_ Telescope UI

```lua
overrides = function(colors)
    local theme = colors.theme
    return {
        TelescopeTitle = { fg = theme.ui.special, bold = true },
        TelescopePromptNormal = { bg = theme.ui.bg_p1 },
        TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
        TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
        TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
        TelescopePreviewNormal = { bg = theme.ui.bg_dim },
        TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
    }
end,
```

#### Dark completion (popup) menu

More uniform colors for the popup menu.

```lua
overrides = function(colors)
    local theme = colors.theme
    return {
        Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },  -- add `blend = vim.o.pumblend` to enable transparency
        PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
        PmenuSbar = { bg = theme.ui.bg_m1 },
        PmenuThumb = { bg = theme.ui.bg_p2 },
    }
end,
```

## Integration

### Get palette and theme colors

```lua
-- Get the colors for the current theme
local colors = require("gruvbox.colors").setup()
local palette_colors = colors.palette
local theme_colors = colors.theme

-- Get the colors for a specific theme
local wave_colors = require("gruvbox.colors").setup({ theme = 'wave' })
```

## Accessibility

The colors maintain a `4.5:1` contrast ratio, complying with [WCAG 2.1 | Level AA](https://www.w3.org/TR/WCAG21/#contrast-minimum).  

## Acknowledgements

- [Tokyonight](https://github.com/folke/tokyonight.nvim)
- [Gruvbox](https://github.com/morhetz/gruvbox)
- [Kanagawa](https://github.com/rebelot/kanagawa.nvim)
- [Catppuccin](https://github.com/catppuccin/nvim)
- [Affinity Designer](https://affinity.serif.com/designer/)

### Donate

Buy me coffee and support my work ;)

[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.com/donate/?business=VNQPHGW4JEM3S&no_recurring=0&item_name=Buy+me+coffee+and+support+my+work+%3B%29&currency_code=EUR)

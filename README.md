# 🏔️ onenord.nvim

![Screenshot of the onenord theme](https://user-images.githubusercontent.com/52933714/138731499-c4092892-46cf-45e6-8947-edb5dfe32c06.png)

![Screenshot of the onenordlight theme](https://user-images.githubusercontent.com/52933714/144966905-4b17902b-53bb-4de7-8bd8-bb7d72603ca6.png)

## Features

OneNord is a Neovim theme written in Lua that combines the [Nord](https://www.nordtheme.com) and [Atom One Dark](https://github.com/atom/atom/tree/master/packages/one-dark-ui) color palettes. More specifically, it seeks to add more vibrance to the Nord theme and provide a great programming experience by leveraging [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)!

### Plugin Support

- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Treesitter Context](https://github.com/nvim-treesitter/nvim-treesitter-context)
- [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
- [Trouble](https://github.com/folke/trouble.nvim)
- [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
- [Git Gutter](https://github.com/airblade/vim-gitgutter)
- [Neogit](https://github.com/TimUntersberger/neogit)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Cmp](https://github.com/hrsh7th/nvim-cmp)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [NeoTree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [WhichKey](https://github.com/folke/which-key.nvim)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Dashboard](https://github.com/glepnir/dashboard-nvim)
- [BufferLine](https://github.com/akinsho/nvim-bufferline.lua)
- [Lualine](https://github.com/hoob3rt/lualine.nvim)
- [Notify](https://github.com/rcarriga/nvim-notify)
- [Lightspeed](https://github.com/ggandor/lightspeed.nvim)
- [Sneak](https://github.com/justinmk/vim-sneak)
- [flash.nvim](https://github.com/folke/flash.nvim)
- [Hop](https://github.com/phaazon/hop.nvim)
- [Fern](https://github.com/lambdalisue/fern.vim)
- [Barbar](https://github.com/romgrk/barbar.nvim)
- [LSP Saga](https://github.com/glepnir/lspsaga.nvim)
- [Dap](https://github.com/mfussenegger/nvim-dap)
- [Navic](https://github.com/SmiteshP/nvim-navic)
- [nvim-ts-rainbow](https://sr.ht/~p00f/nvim-ts-rainbow/)

## Requirements

- Neovim >= 0.8.0

## Installation

Install via your favourite package manager:
```vim
" If you are using Vim Plug
Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
```

```lua
-- If you are using Packer
use 'rmehri01/onenord.nvim'
```

## Usage

For the defaults, simply enable the colorscheme:
```vim
" Vim Script
colorscheme onenord
```

```lua
-- Lua
require('onenord').setup()
```

To enable the `onenord` theme for `Lualine`, specify it in your lualine settings:

```lua
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'onenord'
    -- ... your lualine config
  }
}
```

## Configuration

The configuration of different options is done through a setup function which will handle setting the colors, so there's no need to set `colorscheme` yourself! This is an example of the function with the default values:
```lua
require('onenord').setup({
  theme = nil, -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
  borders = true, -- Split window borders
  fade_nc = false, -- Fade non-current windows, making them more distinguishable
  -- Style that is applied to various groups: see `highlight-args` for options
  styles = {
    comments = "NONE",
    strings = "NONE",
    keywords = "NONE",
    functions = "NONE",
    variables = "NONE",
    diagnostics = "underline",
  },
  disable = {
    background = false, -- Disable setting the background color
    float_background = false, -- Disable setting the background color for floating windows
    cursorline = false, -- Disable the cursorline
    eob_lines = true, -- Hide the end-of-buffer lines
  },
  -- Inverse highlight for different groups
  inverse = {
    match_paren = false,
  },
  custom_highlights = {}, -- Overwrite default highlight groups
  custom_colors = {}, -- Overwrite default colors
})
```

Here is an example of overwriting the default highlight groups and colors:

```lua
local colors = require("onenord.colors").load()

require("onenord").setup({
  custom_highlights = {
  ["@constructor"] = { fg = colors.dark_blue, style = 'bold' },
  },
  custom_colors = {
    red = "#ffffff",
  },
})
```

If you use the `light` and `dark` keys, the override will be specific to those themes, otherwise they apply to both:

```lua
local colors = require("onenord.colors").load()

require("onenord").setup({
  custom_highlights = {
    light = {
      ["@constructor"] = { fg = colors.dark_blue, style = 'bold' }, -- only applies in light theme
    },
  },
  custom_colors = {
    blue = "#0000ff", -- applies in both themes
    light = {
      red = "#000000", -- only applies in light theme
    },
    dark = {
      red = "#ffffff", -- only applies in dark theme
    },
  },
})
```

You can also use the OneNord color palette for other plugins using `local colors = require("onenord.colors").load()`!

## Extras

Extra color configs for [Kitty](extras/kitty/), [Alacritty](extras/alacritty/), [iTerm](extras/iterm/), [Warp](extras/warp/), [Xresources](extras/xresources/), [Wezterm](extras/wezterm/), and [Ghostty](extras/ghostty/) can be found in [extras](https://github.com/rmehri01/onenord.nvim/blob/main/extras). To use them, refer to their respective documentation.

![An example of the Kitty onenord theme](https://user-images.githubusercontent.com/52933714/139562438-d05ceebe-cf01-4948-bdab-6d0969f22087.png)

There is also a version for [JetBrains IDEs](https://github.com/rmehri01/onenord-jetbrains) if you are interested!

## Credits

I was highly inspired by these other awesome themes, check them out!

- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
- [onedark.nvim](https://github.com/navarasu/onedark.nvim)
- [NvChad's Nord Theme](https://github.com/NvChad/NvChad#theme-showcase)
- [material.nvim](https://github.com/marko-cerovac/material.nvim)
- [nord.nvim](https://github.com/shaunsingh/nord.nvim)

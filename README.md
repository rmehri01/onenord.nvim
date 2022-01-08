# 🏔️ onenord.nvim

![Screenshot of the onenord theme](https://user-images.githubusercontent.com/52933714/138731499-c4092892-46cf-45e6-8947-edb5dfe32c06.png)

![Screenshot of the onenordlight theme](https://user-images.githubusercontent.com/52933714/144966905-4b17902b-53bb-4de7-8bd8-bb7d72603ca6.png)

## Features

Onenord is a Neovim theme written in Lua that combines the [Nord](https://www.nordtheme.com) and [Atom One Dark](https://github.com/atom/atom/tree/master/packages/one-dark-ui) color palettes. More specifically, it seeks to add more vibrance to the Nord theme and provide a great programming experience by leveraging [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)!

### Plugin Support

- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
- [Trouble](https://github.com/folke/trouble.nvim)
- [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
- [Git Gutter](https://github.com/airblade/vim-gitgutter)
- [Neogit](https://github.com/TimUntersberger/neogit)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Cmp](https://github.com/hrsh7th/nvim-cmp)
- [NvimTree](https://github.com/kyazdani42/nvim-tree.lua)
- [WhichKey](https://github.com/folke/which-key.nvim)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Dashboard](https://github.com/glepnir/dashboard-nvim)
- [BufferLine](https://github.com/akinsho/nvim-bufferline.lua)
- [Lualine](https://github.com/hoob3rt/lualine.nvim)
- [Notify](https://github.com/rcarriga/nvim-notify)
- [Lightspeed](https://github.com/ggandor/lightspeed.nvim)
- [Sneak](https://github.com/justinmk/vim-sneak)
- [Hop](https://github.com/phaazon/hop.nvim)
- [Fern](https://github.com/lambdalisue/fern.vim)
- [Barbar](https://github.com/romgrk/barbar.nvim)
- [LSP Saga](https://github.com/glepnir/lspsaga.nvim)
- [Dap](https://github.com/mfussenegger/nvim-dap)

## Requirements

- Neovim >= 0.5.0

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
  styles = {
    comments = "NONE", -- Style that is applied to comments: see `highlight-args` for options
    strings = "NONE", -- Style that is applied to strings: see `highlight-args` for options
    keywords = "NONE", -- Style that is applied to keywords: see `highlight-args` for options
    functions = "NONE", -- Style that is applied to functions: see `highlight-args` for options
    variables = "NONE", -- Style that is applied to variables: see `highlight-args` for options
    diagnostics = "underline", -- Style that is applied to diagnostics: see `highlight-args` for options
  },
  disable = {
    background = false, -- Disable setting the background color
    cursorline = false, -- Disable the cursorline
    eob_lines = true, -- Hide the end-of-buffer lines
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
    TSConstructor = { fg = colors.dark_blue },
  },
  custom_colors = {
    red = "#ffffff",
  },
})
```

You can also use the onenord color palette for other plugins using `local colors = require("onenord.colors").load()`!

## Extras

Extra color configs for Kitty, Alacritty, iTerm, and Xresources can be found in [extras](https://github.com/rmehri01/onenord.nvim/blob/main/extras). To use them, refer to their respective documentation.

![An example of the Kitty onenord theme](https://user-images.githubusercontent.com/52933714/139562438-d05ceebe-cf01-4948-bdab-6d0969f22087.png)

## Credits

I was highly inspired by these other awesome themes, check them out!

- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
- [onedark.nvim](https://github.com/navarasu/onedark.nvim)
- [NvChad's Nord Theme](https://github.com/NvChad/NvChad#theme-showcase)
- [material.nvim](https://github.com/marko-cerovac/material.nvim)
- [nord.nvim](https://github.com/shaunsingh/nord.nvim)

# 🏔️ onenord.nvim

![Screenshot of the onenord theme](https://user-images.githubusercontent.com/52933714/138731499-c4092892-46cf-45e6-8947-edb5dfe32c06.png)

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

Enable the colorscheme:
```vim
" Vim Script
colorscheme onenord
```

```lua
-- Lua
vim.cmd [[colorscheme onenord]]
```

To enable the `onenord` theme for `Lualine`, simply specify it in your lualine settings:

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

The configuration of different options is done through a setup function:
```lua
require('onenord').setup()
```

This is an example of the function with the default values:
```lua
require('onenord').setup({
  borders = true, -- Split window borders
  italics = {
    comments = false, -- Italic comments
    strings = false, -- Italic strings
    keywords = true, -- Italic keywords
    functions = false, -- Italic functions
    variables = false, -- Italic variables
  },
  disable = {
    background = false, -- Disable setting the background color
    cursorline = false, -- Disable the cursorline
    eob_lines = true, -- Hide the end-of-buffer lines
  },
  custom_highlights = {}, -- Overwrite default highlight groups
})
```

Here is an example of overwriting the default highlight groups:

```lua
local colors = require("onenord.colors")

require("onenord").setup({
  custom_highlights = {
    TSConstructor = { fg = colors.dark_blue },
  },
})
```

You can also use the onenord color palette for other plugins using `local colors = require("onenord.colors")`!

## Extras

Extra color configs for Kitty, Alacritty, and iTerm can be found in [extras](https://github.com/rmehri01/onenord.nvim/blob/main/extras). To use them, refer to their respective documentation.

![An example of the Kitty onenord theme](https://user-images.githubusercontent.com/52933714/139562438-d05ceebe-cf01-4948-bdab-6d0969f22087.png)

## Credits

I was highly inspired by these other awesome themes, check them out!

- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
- [onedark.nvim](https://github.com/navarasu/onedark.nvim)
- [NvChad's Nord Theme](https://github.com/NvChad/NvChad#theme-showcase)
- [material.nvim](https://github.com/marko-cerovac/material.nvim)
- [nord.nvim](https://github.com/shaunsingh/nord.nvim)

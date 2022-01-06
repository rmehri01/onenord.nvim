-- Colorscheme name:        onenord.nvim
-- Description:             A Neovim theme that combines the Nord and Atom One Dark color palettes.
-- Author:                  Ryan Mehri
-- Website:                 https://github.com/rmehri01/onenord.nvim

local config = require("onenord.config")
local util = require("onenord.util")

local onenord = {}

function onenord.setup(options)
  config.set_options(options)
  onenord.load(true)
end

function onenord.load(exec_autocmd)
  local colors = require("onenord.colors").load()

  util.load(colors, exec_autocmd)
end

return onenord

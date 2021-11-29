-- Colorscheme name:        onenord.nvim
-- Description:             A Neovim theme that combines the Nord and Atom One Dark color palettes.
-- Author:                  Ryan Mehri
-- Website:                 https://github.com/rmehri01/onenord.nvim

local config = require("onenord.config")
local util = require("onenord.util")

local function setup(options)
  config.set_options(options)
  util.load(true)
end

return {
  setup = setup,
}

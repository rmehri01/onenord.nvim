-- Colorscheme name:        onenord.nvim
-- Description:             A Neovim theme that combines the Nord and Atom One Dark color palettes.
-- Author:                  Ryan Mehri
-- Website:                 https://github.com/rmehri01/onenord.nvim

local config = require("onenord.config")
local util = require("onenord.util")

local function setup(options)
  local user_config = config.make_config(options)
  util.load(user_config, true)
end

return {
  setup = setup,
}

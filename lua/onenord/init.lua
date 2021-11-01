-- Colorscheme name:        onenord.nvim
-- Description:             A Neovim theme that combines the Nord and Atom One Dark color palettes.
-- Author:                  Ryan Mehri
-- Website:                 https://github.com/rmehri01/onenord.nvim

local function setup(options)
  require("onenord.config").setup(options)
end

return {
  setup = setup,
}

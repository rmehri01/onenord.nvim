local light_colors = require("onenord.colors.onenordlight")
local dark_colors = require("onenord.colors.onenord")

local colors = {}

function colors.load()
  local config = require("onenord.config")

  -- if style is set, it takes priority
  -- otherwise, use vim.o.background
  if not config.options.theme then
    config.set_options({ theme = vim.o.background })
  end

  if config.options.theme == "light" then
    return light_colors
  else
    return dark_colors
  end
end

return colors

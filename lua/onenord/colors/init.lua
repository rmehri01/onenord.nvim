local light_colors = require("onenord.colors.onenordlight")
local dark_colors = require("onenord.colors.onenord")

local function load()
  local theme = require("onenord.config").options.theme

  -- if style is set, it takes priority
  -- otherwise, use vim.o.background
  if not theme then
    theme = vim.o.background
  end

  local base_colors = theme == "light" and light_colors or dark_colors
  return vim.tbl_deep_extend("force", base_colors, require("onenord.config").options.custom_colors)
end

return { load = load }

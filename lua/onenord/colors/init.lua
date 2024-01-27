local light_colors = require("onenord.colors.onenordlight")
local dark_colors = require("onenord.colors.onenord")
local util = require("onenord.util")

local function get_theme()
  local theme = require("onenord.config").options.theme

  -- if style is set, it takes priority
  -- otherwise, use vim.o.background
  if not theme then
    theme = vim.o.background
  end

  return theme
end

local function load()
  local theme = get_theme()

  local base_colors = theme == "light" and light_colors or dark_colors
  return util.deep_extend_by_theme(base_colors, require("onenord.config").options.custom_colors)
end

return { get_theme = get_theme, load = load }

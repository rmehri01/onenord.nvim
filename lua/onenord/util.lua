local theme = require("onenord.theme")

local util = {}

-- Highlight the given group according to the color values
function util.highlight(group, colors)
  local style = colors.style and "gui=" .. colors.style or "gui=NONE"
  local fg = colors.fg and "guifg=" .. colors.fg or "guifg=NONE"
  local bg = colors.bg and "guibg=" .. colors.bg or "guibg=NONE"
  local sp = colors.sp and "guisp=" .. colors.sp or ""

  local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp

  vim.cmd(hl)
  if colors.link then
    vim.cmd("highlight! link " .. group .. " " .. colors.link)
  end
end

function util.deep_extend_by_theme(base, custom)
  local color_theme = require("onenord.colors").get_theme()

  local dark_specific = custom["dark"]
  local light_specific = custom["light"]
  custom["light"] = nil
  custom["dark"] = nil

  base = vim.tbl_deep_extend("force", base, custom)
  if color_theme == "light" and light_specific then
    base = vim.tbl_deep_extend("force", base, light_specific)
  elseif color_theme == "dark" and dark_specific then
    base = vim.tbl_deep_extend("force", base, dark_specific)
  end

  custom["light"] = light_specific
  custom["dark"] = dark_specific
  return base
end

-- Load the theme
function util.load(colors, exec_autocmd)
  local config = require("onenord.config").options

  -- Set the theme environment
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "onenord"

  -- Load highlights
  local base_highlights = theme.highlights(colors, config)
  local highlights = util.deep_extend_by_theme(base_highlights, config.custom_highlights)

  for group, color in pairs(highlights) do
    util.highlight(group, color)
  end

  theme.load_terminal()

  if exec_autocmd then
    vim.cmd("doautocmd ColorScheme")
  end
end

return util

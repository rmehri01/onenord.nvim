local util = {}
local onenord = require("onenord.theme")
local config = require("onenord.config").options

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

-- Load the theme
function util.load()
  -- Set the theme environment
  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "onenord"

  -- Load highlights
  local highlights = {
    onenord.load_editor,
    onenord.load_syntax,
    onenord.load_treesitter,
    onenord.load_plugins,
    onenord.load_lsp,
  }

  for _, load_hl in ipairs(highlights) do
    for group, colors in pairs(load_hl()) do
      util.highlight(group, colors)
    end
  end

  onenord.load_terminal()

  if type(config.custom_highlights) == "table" then
    for group, colors in pairs(config.custom_highlights) do
      util.highlight(group, colors)
    end
  end
end

return util

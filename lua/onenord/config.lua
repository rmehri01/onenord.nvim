local config = {}

local defaults = {
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
}

function config.make_config(opts)
  return vim.tbl_deep_extend("force", defaults, opts or {})
end

return config

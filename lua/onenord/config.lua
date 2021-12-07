local config = {}

local defaults = {
  style = nil, -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
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
  custom_colors = {}, -- Overwrite default colors
}

config.options = {}

function config.set_options(opts)
  config.options = vim.tbl_deep_extend("force", config.options, opts or {})
end

config.set_options(defaults)

return config

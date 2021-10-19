local config = {}

local defaults = {
	italics = {
		comments = true, -- Italic comments
		strings = false, -- Italic strings
		keywords = true, -- Italic keywords
		functions = false, -- Italic functions
		variables = false, -- Italic variables
	},
}

config.options = {}

config.setup = function(options)
	config.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
end

config.setup()

return config

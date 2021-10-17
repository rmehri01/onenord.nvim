local Config = {}

local defaults = {}

Config.options = {}

Config.setup = function(options)
	Config.options = vim.tbl_deep_extend("force", {}, defaults, options or {})
end

Config.setup()

return Config

local onenord = require("onenord.colors")
local config = require("onenord.config").options

local function italicize(group)
	group["style"] = "italic"
end

local theme = {}

theme.loadSyntax = function()
	-- Syntax highlight groups

	local syntax = {}

	return syntax
end

theme.loadEditor = function()
	-- Editor highlight groups

	local editor = {}

	return editor
end

theme.loadTerminal = function() end

theme.loadTreeSitter = function()
	-- TreeSitter highlight groups

	local treesitter = {
		TSAttribute = { fg = onenord.cyan },
		TSBoolean = { fg = onenord.orange },
		TSCharacter = { fg = onenord.green },
		TSComment = { fg = onenord.light_gray },
		TSConditional = { fg = onenord.purple },
		TSConstant = { fg = onenord.orange },
		TSConstBuiltin = { fg = onenord.orange },
		TSConstMacro = { fg = onenord.cyan },
		TSConstructor = { fg = onenord.yellow },
		TSError = { fg = onenord.error_red },
		TSException = { fg = onenord.purple },
		TSField = { fg = onenord.blue },
		TSFloat = { fg = onenord.orange },
		TSFunction = { fg = onenord.blue },
		TSFuncBuiltin = { fg = onenord.blue },
		TSFuncMacro = { fg = onenord.blue },
		TSInclude = { fg = onenord.purple },
		TSKeyword = { fg = onenord.purple },
		TSKeywordFunction = { fg = onenord.purple },
		TSKeywordOperator = { fg = onenord.purple },
		TSKeywordReturn = { fg = onenord.purple },
		TSLabel = { fg = onenord.blue },
		TSMethod = { fg = onenord.blue },
		TSNamespace = { fg = onenord.purple },
		TSNone = { fg = onenord.fg },
		TSNumber = { fg = onenord.orange },
		TSOperator = { fg = onenord.purple },
		TSParameter = { fg = onenord.red },
		TSParameterReference = { fg = onenord.red },
		TSProperty = { fg = onenord.cyan },
		TSPunctDelimiter = { fg = onenord.fg },
		TSPunctBracket = { fg = onenord.fg },
		TSPunctSpecial = { fg = onenord.fg },
		TSRepeat = { fg = onenord.purple },
		TSString = { fg = onenord.green },
		TSStringRegex = { fg = onenord.orange },
		TSStringEscape = { fg = onenord.orange },
		TSSymbol = { fg = onenord.cyan },
		TSTag = { fg = onenord.blue },
		TSTagAttribute = { fg = onenord.orange },
		TSTagDelimiter = { fg = onenord.gray },
		TSText = { fg = onenord.fg },
		TSStrong = { fg = onenord.yellow_orange },
		TSEmphasis = { style = "italic" },
		TSUnderline = { style = "underline" },
		TSTitle = { fg = onenord.blue, style = "bold" },
		TSLiteral = { fg = onenord.green },
		TSURI = { fg = onenord.blue, style = "underline" },
		TSMath = { fg = onenord.fg },
		TSTextReference = { fg = onenord.red },
		TSEnvironment = { fg = onenord.fg },
		TSEnvironmentName = { fg = onenord.fg },
		TSNote = { fg = onenord.info_yellow, style = "bold" },
		TSWarning = { fg = onenord.warning_orange, style = "bold" },
		TSDanger = { fg = onenord.error_red, style = "bold" },
		TSType = { fg = onenord.yellow },
		TSTypeBuiltin = { fg = onenord.yellow },
		TSVariable = { fg = onenord.fg },
		TSVariableBuiltin = { fg = onenord.red },
	}

	-- Options:

	if config.italics.comments then
		italicize(treesitter.TSComment)
	end

	if config.italics.strings then
		italicize(treesitter.TSString)
	end

	if config.italics.keywords then
		italicize(treesitter.TSConditional)
		italicize(treesitter.TSKeyword)
		italicize(treesitter.TSRepeat)
		italicize(treesitter.TSKeywordFunction)
	end

	if config.italics.functions then
		italicize(treesitter.TSFunction)
		italicize(treesitter.TSMethod)
		italicize(treesitter.TSFuncBuiltin)
	end

	if config.italics.variables then
		italicize(treesitter.TSVariable)
		italicize(treesitter.TSVariableBuiltin)
	end

	return treesitter
end

theme.loadLSP = function()
	-- Lsp highlight groups

	local lsp = {}

	return lsp
end

theme.loadPlugins = function()
	-- Plugins highlight groups

	local plugins = {}

	return plugins
end

return theme

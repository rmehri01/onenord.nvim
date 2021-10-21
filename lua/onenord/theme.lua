local onenord = require("onenord.colors")
local config = require("onenord.config").options

local function italicize(group)
	group["style"] = "italic"
end

local function removeBackground(group)
	group["bg"] = onenord.none
end

local theme = {}

theme.loadSyntax = function()
	-- Syntax highlight groups

	local syntax = {
		-- int, long, char, etc.
		Type = { fg = onenord.purple },
		-- static, register, volatile, etc.
		StorageClass = { fg = onenord.cyan },
		-- struct, union, enum, etc.
		Structure = { fg = onenord.puple },
		-- any constant
		Constant = { fg = onenord.yellow },
		-- any character constant: 'c', '\n'
		Character = { fg = onenord.orange },
		-- a number constant: 5
		Number = { fg = onenord.orange },
		-- a boolean constant: TRUE, false
		Boolean = { fg = onenord.orange },
		-- a floating point constant: 2.3e10
		Float = { fg = onenord.orange },
		-- any statement
		Statement = { fg = onenord.pink },
		-- case, default, etc.
		Label = { fg = onenord.purple },
		-- sizeof", "+", "*", etc.
		Operator = { fg = onenord.cyan },
		-- try, catch, throw
		Exception = { fg = onenord.cyan },
		-- generic Preprocessor
		PreProc = { fg = onenord.purple },
		-- preprocessor #include
		Include = { fg = onenord.blue },
		-- preprocessor #define
		Define = { fg = onenord.pink },
		-- same as Define
		Macro = { fg = onenord.cyan },
		-- A typedef
		Typedef = { fg = onenord.red },
		-- preprocessor #if, #else, #endif, etc.
		PreCondit = { fg = onenord.cyan },
		-- any special symbol
		Special = { fg = onenord.red },
		-- special character in a constant
		SpecialChar = { fg = onenord.pink },
		-- you can use CTRL-] on this
		Tag = { fg = onenord.red },
		-- character that needs attention like , or .
		Delimiter = { fg = onenord.cyan },
		-- special things inside a comment
		SpecialComment = { fg = onenord.gray },
		-- debugging statements
		Debug = { fg = onenord.red },
		-- text that stands out, HTML links
		Underlined = { fg = onenord.link, bg = onenord.none, style = "underline" },
		-- left blank, hidden
		Ignore = { fg = onenord.disabled },
		-- any erroneous construct
		Error = { fg = onenord.error, bg = onenord.none, style = "bold,underline" },
		-- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
		Todo = { fg = onenord.yellow, bg = onenord.none, style = "bold,italic" },
		Comment = { fg = onenord.comments }, -- normal comments
		-- normal if, then, else, endif, switch, etc.
		Conditional = { fg = onenord.purple },
		-- normal for, do, while, etc.
		Keyword = { fg = onenord.purple },
		-- normal any other keyword
		Repeat = { fg = onenord.purple },
		-- normal function names
		Function = { fg = onenord.blue },
		-- any variable name
		Identifier = { fg = onenord.fg },
		-- any string
		String = { fg = onenord.green },

		htmlLink = { fg = onenord.link, style = "underline" },
		htmlH1 = { fg = onenord.cyan, style = "bold" },
		htmlH2 = { fg = onenord.red, style = "bold" },
		htmlH3 = { fg = onenord.green, style = "bold" },
		htmlH4 = { fg = onenord.yellow, style = "bold" },
		htmlH5 = { fg = onenord.purple, style = "bold" },

		markdownBlockquote = { fg = onenord.accent },
		markdownBold = { fg = onenord.yellow, style = "bold" },
		markdownCode = { fg = onenord.green },
		markdownCodeBlock = { fg = onenord.green },
		markdownCodeDelimiter = { fg = onenord.green },
		markdownH1 = { fg = onenord.cyan, style = "bold" },
		markdownH2 = { fg = onenord.red, style = "bold" },
		markdownH3 = { fg = onenord.green, style = "bold" },
		markdownH1Delimiter = { fg = onenord.cyan },
		markdownH2Delimiter = { fg = onenord.red },
		markdownH3Delimiter = { fg = onenord.green },
		markdownH4 = { fg = onenord.blue },
		markdownH5 = { fg = onenord.blue },
		markdownH6 = { fg = onenord.blue },
		markdownHeadingDelimiter = { fg = onenord.blue },
		markdownHeadingRule = { fg = onenord.accent },
		markdownId = { fg = onenord.purple },
		markdownIdDeclaration = { fg = onenord.blue },
		markdownIdDelimiter = { fg = onenord.light_gray },
		markdownLinkDelimiter = { fg = onenord.light_gray },
		markdownItalic = { style = "italic" },
		markdownLinkText = { fg = onenord.blue },
		markdownListMarker = { fg = onenord.red },
		markdownOrderedListMarker = { fg = onenord.red },
		markdownRule = { fg = onenord.accent },
		markdownUrl = { fg = onenord.cyan, style = "underline" },
	}

	-- Options:

	-- Italic comments
	if config.italics.comments then
		italicize(syntax.Comment)
	end

	-- Italic Keywords
	if config.italics.keywords then
		italicize(syntax.Conditional)
		italicize(syntax.Keyword)
		italicize(syntax.Repeat)
	end

	-- Italic Function names
	if config.italics.functions then
		italicize(syntax.Function)
	end

	if config.italics.variables then
		italicize(syntax.Identifier)
	end

	if config.italics.strings then
		italicize(syntax.String)
	end

	return syntax
end

theme.loadEditor = function()
	-- Editor highlight groups

	local editor = {
		-- normal text and background color for floating windows
		NormalFloat = { fg = onenord.fg, bg = onenord.float },
		-- floating window border
		FloatBorder = { fg = onenord.text },
		--  used for the columns set with 'colorcolumn'
		ColorColumn = { fg = onenord.none, bg = onenord.active },
		-- placeholder characters substituted for concealed text (see 'conceallevel')
		Conceal = { fg = onenord.disabled },
		-- the character under the cursor
		Cursor = { fg = onenord.cursor, bg = onenord.none, style = "reverse" },
		-- like Cursor, but used when in IME mode
		CursorIM = { fg = onenord.cursor, bg = onenord.none, style = "reverse" },
		-- directory names (and other special names in listings)
		Directory = { fg = onenord.blue, bg = onenord.none },
		-- diff mode: Added line
		DiffAdd = { fg = onenord.green, bg = onenord.none, style = "reverse" },
		--  diff mode: Changed line
		DiffChange = { fg = onenord.blue, bg = onenord.none, style = "reverse" },
		-- diff mode: Deleted line
		DiffDelete = { fg = onenord.red, bg = onenord.none, style = "reverse" },
		-- diff mode: Changed text within a changed line
		DiffText = { fg = onenord.fg, bg = onenord.none, style = "reverse" },
		-- error messages
		ErrorMsg = { fg = onenord.error },
		-- line used for closed folds
		Folded = { fg = onenord.disabled, bg = onenord.none, style = "italic" },
		-- 'foldcolumn'
		FoldColumn = { fg = onenord.blue },
		-- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		IncSearch = { fg = onenord.title, bg = onenord.selection, style = "underline" },
		-- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		LineNr = { fg = onenord.light_gray },
		-- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		CursorLineNr = { fg = onenord.accent },
		-- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		MatchParen = { fg = onenord.yellow, bg = onenord.none, style = "bold" },
		-- 'showmode' message (e.g., "-- INSERT -- ")
		ModeMsg = { fg = onenord.accent },
		-- |more-prompt|
		MoreMsg = { fg = onenord.accent },
		-- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist
		-- in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
		-- See also |hl-EndOfBuffer|.
		NonText = { fg = onenord.disabled },
		-- |hit-enter| prompt and yes/no questions
		Question = { fg = onenord.green },
		-- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		QuickFixLine = { fg = onenord.highlight, bg = onenord.title, style = "reverse" },
		-- Line numbers for quickfix lists
		qfLineNr = { fg = onenord.highlight, bg = onenord.title, style = "reverse" },
		-- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
		Search = { fg = onenord.title, bg = onenord.selection, style = "bold" },
		-- Unprintable characters: text displayed differently from what it really is.
		-- But not 'listchars' whitespace. |hl-Whitespace|
		SpecialKey = { fg = onenord.purple },
		-- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellBad = { fg = onenord.red, bg = onenord.none, style = "italic,undercurl" },
		-- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellCap = { fg = onenord.blue, bg = onenord.none, style = "italic,undercurl" },
		-- Word that is recognized by the spellchecker as one that is used in another region.
		-- |spell| Combined with the highlighting used otherwise.
		SpellLocal = { fg = onenord.cyan, bg = onenord.none, style = "italic,undercurl" },
		-- Word that is recognized by the spellchecker as one that is hardly ever used.
		-- |spell| Combined with the highlighting used otherwise.
		SpellRare = { fg = onenord.purple, bg = onenord.none, style = "italic,undercurl" },
		-- status line of current window
		StatusLine = { fg = onenord.accent, bg = onenord.active },
		-- status lines of not-current windows Note: if this is equal to "StatusLine"
		-- Vim will use "^^^" in the status line of the current window.
		StatusLineNC = { fg = onenord.fg, bg = onenord.bg },
		-- status line of current terminal window
		StatusLineTerm = { fg = onenord.fg, bg = onenord.active },
		-- status lines of not-current terminal windows Note: if this is equal to "StatusLine"
		-- Vim will use "^^^" in the status line of the current window.
		StatusLineTermNC = { fg = onenord.text, bg = onenord.bg },
		-- tab pages line, where there are no labels
		TabLineFill = { fg = onenord.fg },
		-- tab pages line, active tab page label
		TablineSel = { fg = onenord.bg, bg = onenord.accent },
		Tabline = { fg = onenord.fg },
		-- titles for output from ":set all", ":autocmd" etc.
		Title = { fg = onenord.title, bg = onenord.none, style = "bold" },
		-- Visual mode selection
		Visual = { fg = onenord.none, bg = onenord.selection },
		-- Visual mode selection when vim is "Not Owning the Selection".
		VisualNOS = { fg = onenord.none, bg = onenord.selection },
		-- warning messages
		WarningMsg = { fg = onenord.yellow },
		-- "nbsp", "space", "tab" and "trail" in 'listchars'
		Whitespace = { fg = onenord.selection },
		-- current match in 'wildmenu' completion
		WildMenu = { fg = onenord.orange, bg = onenord.none, style = "bold" },
		-- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorColumn = { fg = onenord.none, bg = onenord.active },
		-- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
		CursorLine = { fg = onenord.none, bg = onenord.active },
		-- Normal mode message in the cmdline
		NormalMode = { fg = onenord.accent, bg = onenord.none, style = "reverse" },
		-- Insert mode message in the cmdline
		InsertMode = { fg = onenord.green, bg = onenord.none, style = "reverse" },
		-- Replace mode message in the cmdline
		ReplacelMode = { fg = onenord.red, bg = onenord.none, style = "reverse" },
		-- Visual mode message in the cmdline
		VisualMode = { fg = onenord.purple, bg = onenord.none, style = "reverse" },
		-- Command mode message in the cmdline
		CommandMode = { fg = onenord.gray, bg = onenord.none, style = "reverse" },
		Warnings = { fg = onenord.yellow },

		ToolbarLine = { fg = onenord.fg, bg = onenord.bg_alt },
		ToolbarButton = { fg = onenord.fg, bg = onenord.none, style = "bold" },

		healthError = { fg = onenord.error },
		healthSuccess = { fg = onenord.green },
		healthWarning = { fg = onenord.yellow },

		-- Dashboard
		DashboardShortCut = { fg = onenord.cyan },
		DashboardHeader = { fg = onenord.blue },
		DashboardCenter = { fg = onenord.purple },
		DashboardFooter = { fg = onenord.green, style = "italic" },

		-- normal text and background color
		Normal = { fg = onenord.fg, bg = onenord.bg },
		SignColumn = { fg = onenord.fg, bg = onenord.bg },

		-- the column separating vertically split windows
		VertSplit = { fg = onenord.bg },

		EndOfBuffer = { fg = onenord.bg },
	}

	-- Options:

	--Set transparent background
	if config.disable.background then
		removeBackground(editor.Normal)
		removeBackground(editor.SignColumn["bg"])
	end

	-- Remove window split borders
	if config.borders then
		editor.VertSplit["fg"] = onenord.border
	end

	return editor
end

theme.loadTerminal = function()
	-- dark
	vim.g.terminal_color_0 = onenord.dark
	vim.g.terminal_color_8 = onenord.dark_blue

	-- light
	vim.g.terminal_color_7 = onenord.fg_dark
	vim.g.terminal_color_15 = onenord.fg

	-- colors
	vim.g.terminal_color_1 = onenord.red
	vim.g.terminal_color_9 = onenord.red

	vim.g.terminal_color_2 = onenord.green
	vim.g.terminal_color_10 = onenord.green

	vim.g.terminal_color_3 = onenord.yellow
	vim.g.terminal_color_11 = onenord.yellow

	vim.g.terminal_color_4 = onenord.blue
	vim.g.terminal_color_12 = onenord.blue

	vim.g.terminal_color_5 = onenord.magenta
	vim.g.terminal_color_13 = onenord.magenta

	vim.g.terminal_color_6 = onenord.cyan
	vim.g.terminal_color_14 = onenord.cyan
end

theme.loadTreeSitter = function()
	-- TreeSitter highlight groups

	local treesitter = {
		-- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
		TSAttribute = { fg = onenord.purple },
		-- Boolean literals: `True` and `False` in Python.
		TSBoolean = { fg = onenord.orange },
		-- Character literals: `'a'` in C.
		TSCharacter = { fg = onenord.green },
		-- Line comments and block comments.
		TSComment = { fg = onenord.light_gray },
		-- Keywords related to conditionals: `if`, `when`, `cond`, etc.
		TSConditional = { fg = onenord.purple },
		-- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
		TSConstant = { fg = onenord.cyan },
		-- Built-in constant values: `nil` in Lua.
		TSConstBuiltin = { fg = onenord.orange },
		-- Constants defined by macros: `NULL` in C.
		TSConstMacro = { fg = onenord.red },
		-- Constructor calls and definitions: `{}` in Lua, and Java constructors.
		TSConstructor = { fg = onenord.yellow },
		-- Syntax/parser errors. This might highlight large sections of code while the user is typing
		-- still incomplete code, use a sensible highlight.
		TSError = { fg = onenord.error },
		-- Exception related keywords: `try`, `except`, `finally` in Python.
		TSException = { fg = onenord.purple },
		-- Object and struct fields.
		TSField = { fg = onenord.blue },
		-- Floating-point number literals.
		TSFloat = { fg = onenord.orange },
		-- Function calls and definitions.
		TSFunction = { fg = onenord.blue },
		-- Built-in functions: `print` in Lua.
		TSFuncBuiltin = { fg = onenord.cyan },
		-- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
		TSFuncMacro = { fg = onenord.blue },
		-- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
		TSInclude = { fg = onenord.blue },
		-- Keywords that don't fit into other categories.
		TSKeyword = { fg = onenord.purple },
		-- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
		TSKeywordFunction = { fg = onenord.purple },
		-- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
		TSKeywordOperator = { fg = onenord.purple },
		-- Keywords like `return` and `yield`.
		TSKeywordReturn = { fg = onenord.purple },
		-- GOTO labels: `label:` in C, and `::label::` in Lua.
		TSLabel = { fg = onenord.red },
		-- Method calls and definitions.
		TSMethod = { fg = onenord.blue },
		-- Identifiers referring to modules and namespaces.
		TSNamespace = { fg = onenord.yellow },
		-- Numeric literals that don't fit into other categories.
		TSNumber = { fg = onenord.orange },
		-- Binary or unary operators: `+`, and also `->` and `*` in C.
		TSOperator = { fg = onenord.purple },
		-- Parameters of a function.
		TSParameter = { fg = onenord.red },
		-- References to parameters of a function.
		TSParameterReference = { fg = onenord.red },
		-- Same as `TSField`.
		TSProperty = { fg = onenord.blue },
		-- Punctuation delimiters: Periods, commas, semicolons, etc.
		TSPunctDelimiter = { fg = onenord.dark_blue },
		-- Brackets, braces, parentheses, etc.
		TSPunctBracket = { fg = onenord.dark_blue },
		-- Special punctuation that doesn't fit into the previous categories.
		TSPunctSpecial = { fg = onenord.dark_blue },
		-- Keywords related to loops: `for`, `while`, etc.
		TSRepeat = { fg = onenord.purple },
		-- String literals.
		TSString = { fg = onenord.green },
		-- Regular expression literals.
		TSStringRegex = { fg = onenord.orange },
		-- Escape characters within a string: `\n`, `\t`, etc.
		TSStringEscape = { fg = onenord.orange },
		-- Identifiers referring to symbols or atoms.
		TSSymbol = { fg = onenord.cyan },
		-- Tags like HTML tag names.
		TSTag = { fg = onenord.dark_blue },
		-- HTML tag attributes.
		TSTagAttribute = { fg = onenord.blue },
		-- Tag delimiters like `<` `>` `/`.
		TSTagDelimiter = { fg = onenord.dark_blue },
		-- Non-structured text. Like text in a markup language.
		TSText = { fg = onenord.fg },
		-- Text to be represented in bold.
		TSStrong = { fg = onenord.yellow_orange },
		-- Text to be represented with emphasis.
		TSEmphasis = { style = "italic" },
		-- Text to be represented with an underline.
		TSUnderline = { style = "underline" },
		-- Text that is part of a title.
		TSTitle = { fg = onenord.blue, style = "bold" },
		-- Literal or verbatim text.
		TSLiteral = { fg = onenord.green },
		-- URIs like hyperlinks or email addresses.
		TSURI = { fg = onenord.blue, style = "underline" },
		-- Math environments like LaTeX's `$ ... $`
		TSMath = { fg = onenord.fg },
		-- Footnotes, text references, citations, etc.
		TSTextReference = { fg = onenord.red },
		-- Text environments of markup languages.
		TSEnvironment = { fg = onenord.fg },
		-- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
		TSEnvironmentName = { fg = onenord.fg },
		-- Text representation of an informational note.
		TSNote = { fg = onenord.info_yellow, style = "bold" },
		-- Text representation of a warning note.
		TSWarning = { fg = onenord.warning_orange, style = "bold" },
		-- Text representation of a danger note.
		TSDanger = { fg = onenord.error, style = "bold" },
		-- Type (and class) definitions and annotations.
		TSType = { fg = onenord.yellow },
		-- Built-in types: `i32` in Rust.
		TSTypeBuiltin = { fg = onenord.orange },
		-- Variable names that don't fit into other categories.
		TSVariable = { fg = onenord.fg },
		-- Variable names defined by the language: `this` or `self` in Javascript.
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

	local lsp = {
		-- used for "Error" diagnostic virtual text
		LspDiagnosticsDefaultError = { fg = onenord.error },
		-- used for "Error" diagnostic signs in sign column
		LspDiagnosticsSignError = { fg = onenord.error },
		-- used for "Error" diagnostic messages in the diagnostics float
		LspDiagnosticsFloatingError = { fg = onenord.error },
		-- Virtual text "Error"
		LspDiagnosticsVirtualTextError = { fg = onenord.error },
		-- used to underline "Error" diagnostics.
		LspDiagnosticsUnderlineError = { style = "underline", sp = onenord.error },
		-- used for "Warning" diagnostic signs in sign column
		LspDiagnosticsDefaultWarning = { fg = onenord.orange },
		-- used for "Warning" diagnostic signs in sign column
		LspDiagnosticsSignWarning = { fg = onenord.orange },
		-- used for "Warning" diagnostic messages in the diagnostics float
		LspDiagnosticsFloatingWarning = { fg = onenord.orange },
		-- Virtual text "Warning"
		LspDiagnosticsVirtualTextWarning = { fg = onenord.orange },
		-- used to underline "Warning" diagnostics.
		LspDiagnosticsUnderlineWarning = { style = "underline", sp = onenord.orange },
		-- used for "Information" diagnostic virtual text
		LspDiagnosticsDefaultInformation = { fg = onenord.yellow },
		-- used for "Information" diagnostic signs in sign column
		LspDiagnosticsSignInformation = { fg = onenord.yellow },
		-- used for "Information" diagnostic messages in the diagnostics float
		LspDiagnosticsFloatingInformation = { fg = onenord.yellow },
		-- Virtual text "Information"
		LspDiagnosticsVirtualTextInformation = { fg = onenord.yellow },
		-- used to underline "Information" diagnostics.
		LspDiagnosticsUnderlineInformation = { style = "underline", sp = onenord.yellow },
		-- used for "Hint" diagnostic virtual text
		LspDiagnosticsDefaultHint = { fg = onenord.purple },
		-- used for "Hint" diagnostic signs in sign column
		LspDiagnosticsSignHint = { fg = onenord.purple },
		-- used for "Hint" diagnostic messages in the diagnostics float
		LspDiagnosticsFloatingHint = { fg = onenord.purple },
		-- Virtual text "Hint"
		LspDiagnosticsVirtualTextHint = { fg = onenord.purple },
		-- used to underline "Hint" diagnostics.
		LspDiagnosticsUnderlineHint = { style = "underline", sp = onenord.yellow },
		-- used for highlighting "text" references
		LspReferenceText = { fg = onenord.none, bg = onenord.highlight },
		-- used for highlighting "read" references
		LspReferenceRead = { fg = onenord.none, bg = onenord.highlight },
		-- used for highlighting "write" references
		LspReferenceWrite = { fg = onenord.none, bg = onenord.highlight },

		DiagnosticVirtualTextWarn = { link = "LspDiagnosticsVirtualTextWarning" },
		DiagnosticUnderlineWarn = { link = "LspDiagnosticsUnderlineWarning" },
		DiagnosticFloatingWarn = { link = "LspDiagnosticsFloatingWarning" },
		DiagnosticSignWarn = { link = "LspDiagnosticsSignWarning" },
		DiagnosticVirtualTextError = { link = "LspDiagnosticsVirtualTextError" },
		DiagnosticUnderlineError = { link = "LspDiagnosticsUnderlineError" },
		DiagnosticFloatingError = { link = "LspDiagnosticsFloatingError" },
		DiagnosticSignError = { link = "LspDiagnosticsSignError" },
		DiagnosticVirtualTextInfo = { link = "LspDiagnosticsVirtualTextInformation" },
		DiagnosticUnderlineInfo = { link = "LspDiagnosticsUnderlineInformation" },
		DiagnosticFloatingInfo = { link = "LspDiagnosticsFloatingInformation" },
		DiagnosticSignInfo = { link = "LspDiagnosticsSignInformation" },
		DiagnosticVirtualTextHint = { link = "LspDiagnosticsVirtualTextHint" },
		DiagnosticUnderlineHint = { link = "LspDiagnosticsUnderlineHint" },
		DiagnosticFloatingHint = { link = "LspDiagnosticsFloatingHint" },
		DiagnosticSignHint = { link = "LspDiagnosticsSignHint" },
	}

	return lsp
end

theme.loadPlugins = function()
	-- Plugins highlight groups

	local plugins = {

		-- LspTrouble
		LspTroubleText = { fg = onenord.text },
		LspTroubleCount = { fg = onenord.purple, bg = onenord.active },
		LspTroubleNormal = { fg = onenord.fg, bg = onenord.sidebar },

		-- Diff
		diffAdded = { fg = onenord.green },
		diffRemoved = { fg = onenord.red },
		diffChanged = { fg = onenord.blue },
		diffOldFile = { fg = onenord.text },
		diffNewFile = { fg = onenord.title },
		diffFile = { fg = onenord.gray },
		diffLine = { fg = onenord.cyan },
		diffIndexLine = { fg = onenord.purple },

		-- Neogit
		NeogitBranch = { fg = onenord.paleblue },
		NeogitRemote = { fg = onenord.purple },
		NeogitHunkHeader = { fg = onenord.fg, bg = onenord.highlight },
		NeogitHunkHeaderHighlight = { fg = onenord.blue, bg = onenord.contrast },
		NeogitDiffContextHighlight = { fg = onenord.text, bg = onenord.contrast },
		NeogitDiffDeleteHighlight = { fg = onenord.red },
		NeogitDiffAddHighlight = { fg = onenord.green },

		-- GitGutter
		GitGutterAdd = { fg = onenord.green }, -- diff mode: Added line |diff.txt|
		GitGutterChange = { fg = onenord.blue }, -- diff mode: Changed line |diff.txt|
		GitGutterDelete = { fg = onenord.red }, -- diff mode: Deleted line |diff.txt|

		-- GitSigns
		GitSignsAdd = { fg = onenord.green }, -- diff mode: Added line |diff.txt|
		GitSignsAddNr = { fg = onenord.green }, -- diff mode: Added line |diff.txt|
		GitSignsAddLn = { fg = onenord.green }, -- diff mode: Added line |diff.txt|
		GitSignsChange = { fg = onenord.purple }, -- diff mode: Changed line |diff.txt|
		GitSignsChangeNr = { fg = onenord.purple }, -- diff mode: Changed line |diff.txt|
		GitSignsChangeLn = { fg = onenord.purple }, -- diff mode: Changed line |diff.txt|
		GitSignsDelete = { fg = onenord.red }, -- diff mode: Deleted line |diff.txt|
		GitSignsDeleteNr = { fg = onenord.red }, -- diff mode: Deleted line |diff.txt|
		GitSignsDeleteLn = { fg = onenord.red }, -- diff mode: Deleted line |diff.txt|

		-- Telescope
		TelescopeNormal = { fg = onenord.fg, bg = onenord.bg },
		TelescopePromptPrefix = { fg = onenord.purple },
		TelescopePromptBorder = { fg = onenord.blue },
		TelescopeResultsBorder = { fg = onenord.blue },
		TelescopePreviewBorder = { fg = onenord.blue },
		TelescopeSelectionCaret = { fg = onenord.cyan },
		TelescopeSelection = { fg = onenord.cyan },
		TelescopeMatching = { fg = onenord.yellow, style = "bold" },

		-- NvimTree
		NvimTreeRootFolder = { fg = onenord.fg, style = "italic" },
		NvimTreeFolderName = { fg = onenord.text },
		NvimTreeFolderIcon = { fg = onenord.accent, bg = onenord.sidebar },
		NvimTreeEmptyFolderName = { fg = onenord.disabled },
		NvimTreeOpenedFolderName = { fg = onenord.accent, style = "italic" },
		NvimTreeIndentMarker = { fg = onenord.disabled },
		NvimTreeGitDirty = { fg = onenord.blue },
		NvimTreeGitNew = { fg = onenord.green },
		NvimTreeGitStaged = { fg = onenord.comments },
		NvimTreeGitDeleted = { fg = onenord.red },
		NvimTreeOpenedFile = { fg = onenord.accent },
		NvimTreeImageFile = { fg = onenord.yellow },
		NvimTreeMarkdownFile = { fg = onenord.pink },
		NvimTreeExecFile = { fg = onenord.green },
		NvimTreeSpecialFile = { fg = onenord.purple, style = "underline" },
		NvimTreeNormal = { fg = onenord.comments, bg = onenord.sidebar },
		LspDiagnosticsError = { fg = onenord.error },
		LspDiagnosticsWarning = { fg = onenord.yellow },
		LspDiagnosticsInformation = { fg = onenord.paleblue },
		LspDiagnosticsHint = { fg = onenord.purple },

		-- WhichKey
		WhichKey = { fg = onenord.purple, style = "bold" },
		WhichKeyGroup = { fg = onenord.cyan },
		WhichKeyDesc = { fg = onenord.blue, style = "italic" },
		WhichKeySeperator = { fg = onenord.green },
		WhichKeyFloating = { bg = onenord.bg },
		WhichKeyFloat = { bg = onenord.bg },

		-- LspSaga
		LspFloatWinNormal = { fg = onenord.text, bg = onenord.bg },
		LspFloatWinBorder = { fg = onenord.purple },
		DiagnosticError = { fg = onenord.error },
		DiagnosticWarning = { fg = onenord.yellow },
		DiagnosticInformation = { fg = onenord.paleblue },
		DiagnosticHint = { fg = onenord.purple },
		LspSagaDiagnosticBorder = { fg = onenord.gray },
		LspSagaDiagnosticHeader = { fg = onenord.blue },
		LspSagaDiagnosticTruncateLine = { fg = onenord.border },
		LspLinesDiagBorder = { fg = onenord.contrast },
		ProviderTruncateLine = { fg = onenord.border },
		LspSagaShTruncateLine = { fg = onenord.border },
		LspSagaDocTruncateLine = { fg = onenord.border },
		LineDiagTruncateLine = { fg = onenord.border },
		LspSagaBorderTitle = { fg = onenord.cyan },
		LspSagaHoverBorder = { fg = onenord.paleblue },
		LspSagaRenameBorder = { fg = onenord.green },
		LspSagaDefPreviewBorder = { fg = onenord.green },
		LspSagaCodeActionTitle = { fg = onenord.paleblue },
		LspSagaCodeActionContent = { fg = onenord.purple },
		LspSagaCodeActionBorder = { fg = onenord.blue },
		LspSagaCodeActionTruncateLine = { fg = onenord.border },
		LspSagaSignatureHelpBorder = { fg = onenord.pink },
		LspSagaFinderSelection = { fg = onenord.green },
		-- LspSagaAutoPreview =					{ fg = onenord.red },
		ReferencesCount = { fg = onenord.purple },
		DefinitionCount = { fg = onenord.purple },
		DefinitionPreviewTitle = { fg = onenord.green },
		DefinitionIcon = { fg = onenord.blue },
		ReferencesIcon = { fg = onenord.blue },
		TargetWord = { fg = onenord.cyan },

		-- BufferLine
		BufferLineIndicatorSelected = { fg = onenord.accent },
		BufferLineFill = { bg = onenord.bg },

		-- Sneak
		Sneak = { fg = onenord.bg, bg = onenord.accent },
		SneakScope = { bg = onenord.selection },

		-- Indent Blankline
		IndentBlanklineChar = { fg = onenord.highlight },
		IndentBlanklineContextChar = { fg = onenord.fg },

		-- Nvim dap
		DapBreakpoint = { fg = onenord.red },
		DapStopped = { fg = onenord.green },

		-- Illuminate
		illuminatedWord = { bg = onenord.highight },
		illuminatedCurWord = { bg = onenord.highight },

		-- Hop
		HopNextKey = { fg = onenord.accent, style = "bold" },
		HopNextKey1 = { fg = onenord.purple, style = "bold" },
		HopNextKey2 = { fg = onenord.blue },
		HopUnmatched = { fg = onenord.comments },

		-- Fern
		FernBranchText = { fg = onenord.blue },

		-- lightspeed
		LightspeedLabel = { fg = onenord.nord8_gui, style = "bold" },
		LightspeedLabelOverlapped = { fg = onenord.nord8_gui, style = "bold,underline" },
		LightspeedLabelDistant = { fg = onenord.nord15_gui, style = "bold" },
		LightspeedLabelDistantOverlapped = { fg = onenord.nord15_gui, style = "bold,underline" },
		LightspeedShortcut = { fg = onenord.nord10_gui, style = "bold" },
		LightspeedShortcutOverlapped = { fg = onenord.nord10_gui, style = "bold,underline" },
		LightspeedMaskedChar = { fg = onenord.nord4_gui, bg = onenord.nord2_gui, style = "bold" },
		LightspeedGreyWash = { fg = onenord.nord3_gui_bright },
		LightspeedUnlabeledMatch = { fg = onenord.nord4_gui, bg = onenord.nord1_gui },
		LightspeedOneCharMatch = { fg = onenord.nord8_gui, style = "bold,reverse" },
		LightspeedUniqueChar = { style = "bold,underline" },
		-- LightspeedPendingOpArea = { style = "strikethrough" },
		-- LightspeedPendingChangeOpArea = { style = "strikethrough" },
		-- LightspeedCursor = { fg = onenord.nord7_gui, style = "underline,reverse" },
	}

	-- Options:

	-- Disable nvim-tree background
	if config.disable.background then
		removeBackground(plugins.NvimTreeNormal)
	end

	return plugins
end

return theme

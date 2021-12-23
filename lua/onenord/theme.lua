local theme = {}

function theme.highlights(colors, config)
  local function remove_background(group)
    group["bg"] = colors.none
  end

  local function load_syntax()
    -- Syntax highlight groups

    local syntax = {
      -- int, long, char, etc.
      Type = { fg = colors.yellow },
      -- static, register, volatile, etc.
      StorageClass = { fg = colors.purple },
      -- struct, union, enum, etc.
      Structure = { fg = colors.purple },
      -- any constant
      Constant = { fg = colors.blue },
      -- any character constant: 'c', '\n'
      Character = { fg = colors.green },
      -- a number constant: 5
      Number = { fg = colors.orange },
      -- a boolean constant: TRUE, false
      Boolean = { fg = colors.orange },
      -- a floating point constant: 2.3e10
      Float = { fg = colors.orange },
      -- any statement
      Statement = { fg = colors.purple },
      -- case, default, etc.
      Label = { fg = colors.purple },
      -- sizeof", "+", "*", etc.
      Operator = { fg = colors.purple },
      -- try, catch, throw
      Exception = { fg = colors.purple },
      -- generic Preprocessor
      PreProc = { fg = colors.purple },
      -- preprocessor #include
      Include = { fg = colors.blue },
      -- preprocessor #define
      Define = { fg = colors.red },
      -- same as Define
      Macro = { fg = colors.red },
      -- A typedef
      Typedef = { fg = colors.purple },
      -- preprocessor #if, #else, #endif, etc.
      PreCondit = { fg = colors.purple },
      -- any special symbol
      Special = { fg = colors.light_red },
      -- special character in a constant
      SpecialChar = { fg = colors.light_red },
      -- you can use CTRL-] on this
      Tag = { fg = colors.green },
      -- character that needs attention like , or .
      Delimiter = { fg = colors.dark_blue },
      -- special things inside a comment
      SpecialComment = { fg = colors.light_gray },
      -- debugging statements
      Debug = { fg = colors.yellow },
      -- text that stands out, HTML links
      Underlined = { fg = colors.green, style = "underline" },
      -- left blank, hidden
      Ignore = { fg = colors.cyan, bg = colors.bg, style = "bold" },
      -- any erroneous construct
      Error = { fg = colors.error, bg = colors.none, style = "bold,underline" },
      -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
      Todo = { fg = colors.yellow, bg = colors.none, style = "bold,italic" },
      Comment = { fg = colors.light_gray, style = config.styles.comments }, -- normal comments
      -- normal if, then, else, endif, switch, etc.
      Conditional = { fg = colors.purple, style = config.styles.keywords },
      -- normal for, do, while, etc.
      Keyword = { fg = colors.purple, style = config.styles.keywords },
      -- normal any other keyword
      Repeat = { fg = colors.purple, style = config.styles.keywords },
      -- normal function names
      Function = { fg = colors.blue, style = config.styles.functions },
      -- any variable name
      Identifier = { fg = colors.fg, style = config.styles.variables },
      -- any string
      String = { fg = colors.green, config.styles.strings },

      htmlLink = { fg = colors.green, style = "underline" },
      htmlH1 = { fg = colors.cyan, style = "bold" },
      htmlH2 = { fg = colors.red, style = "bold" },
      htmlH3 = { fg = colors.green, style = "bold" },
      htmlH4 = { fg = colors.yellow, style = "bold" },
      htmlH5 = { fg = colors.purple, style = "bold" },

      markdownBlockquote = { fg = colors.light_gray },
      markdownBold = { fg = colors.purple, style = "bold" },
      markdownCode = { fg = colors.green },
      markdownCodeBlock = { fg = colors.green },
      markdownCodeDelimiter = { fg = colors.green },
      markdownH1 = { fg = colors.dark_blue, style = "bold" },
      markdownH2 = { fg = colors.blue, style = "bold" },
      markdownH3 = { fg = colors.cyan, style = "bold" },
      markdownH4 = { fg = colors.light_green },
      markdownH5 = { fg = colors.light_green },
      markdownH6 = { fg = colors.light_green },
      markdownH1Delimiter = { fg = colors.dark_blue },
      markdownH2Delimiter = { fg = colors.blue },
      markdownH3Delimiter = { fg = colors.cyan },
      markdownH4Delimiter = { fg = colors.light_green },
      markdownH5Delimiter = { fg = colors.light_green },
      markdownH6Delimiter = { fg = colors.light_green },
      markdownId = { fg = colors.yellow },
      markdownIdDeclaration = { fg = colors.purple },
      markdownIdDelimiter = { fg = colors.light_gray },
      markdownLinkDelimiter = { fg = colors.light_gray },
      markdownItalic = { fg = colors.yellow, style = "italic" },
      markdownLinkText = { fg = colors.purple },
      markdownListMarker = { fg = colors.red },
      markdownOrderedListMarker = { fg = colors.red },
      markdownRule = { fg = colors.purple },
      markdownUrl = { fg = colors.cyan, style = "underline" },
    }

    return syntax
  end

  local function load_editor()
    -- Editor highlight groups

    local editor = {
      -- normal text and background color for floating windows
      NormalFloat = { fg = colors.fg, bg = colors.active },
      -- floating window border
      FloatBorder = { fg = colors.blue, bg = colors.active },
      -- used for the columns set with 'colorcolumn'
      ColorColumn = { fg = colors.none, bg = colors.float },
      -- placeholder characters substituted for concealed text (see 'conceallevel')
      Conceal = { bg = colors.bg },
      -- the character under the cursor
      Cursor = { fg = colors.fg, bg = colors.none, style = "reverse" },
      -- like Cursor, but used when in IME mode
      CursorIM = { fg = colors.fg, bg = colors.none, style = "reverse" },
      -- directory names (and other special names in listings)
      Directory = { fg = colors.blue, bg = colors.none },
      -- diff mode: Added line
      DiffAdd = { fg = colors.none, bg = colors.diff_add_bg },
      -- diff mode: Changed line
      DiffChange = { fg = colors.none, bg = colors.diff_change_bg },
      -- diff mode: Deleted line
      DiffDelete = { fg = colors.none, bg = colors.diff_remove_bg },
      -- diff mode: Changed text within a changed line
      DiffText = { fg = colors.none, bg = colors.diff_text_bg },
      -- error messages
      ErrorMsg = { fg = colors.error },
      -- line used for closed folds
      Folded = { fg = colors.dark_blue, bg = colors.none, style = "italic" },
      -- 'foldcolumn'
      FoldColumn = { fg = colors.light_gray },
      -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
      IncSearch = { fg = colors.yellow, bg = colors.selection, style = "bold,underline" },
      -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
      LineNr = { fg = colors.light_gray },
      -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
      CursorLineNr = { fg = colors.fg },
      -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
      MatchParen = { fg = colors.yellow, bg = colors.none, style = "bold" },
      -- 'showmode' message (e.g., "-- INSERT -- ")
      ModeMsg = { fg = colors.blue, style = "bold" },
      -- |more-prompt|
      MoreMsg = { fg = colors.blue, style = "bold" },
      -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist
      -- in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
      -- See also |hl-EndOfBuffer|.
      NonText = { fg = colors.gray },
      -- normal item |hl-Pmenu|
      Pmenu = { fg = colors.fg, bg = colors.float },
      -- selected item |hl-PmenuSel|
      PmenuSel = { bg = colors.selection },
      -- scrollbar |hl-PmenuSbar|
      PmenuSbar = { bg = colors.float },
      -- thumb of the scrollbar  |hl-PmenuThumb|
      PmenuThumb = { bg = colors.fg },
      -- |hit-enter| prompt and yes/no questions
      Question = { fg = colors.green },
      -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
      QuickFixLine = { bg = colors.float, style = "bold,italic" },
      -- Line numbers for quickfix lists
      qfLineNr = { fg = colors.purple },
      -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
      Search = { fg = colors.blue, bg = colors.selection, style = "bold" },
      -- Unprintable characters: text displayed differently from what it really is.
      -- But not 'listchars' whitespace. |hl-Whitespace|
      SpecialKey = { fg = colors.dark_blue },
      -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
      SpellBad = { fg = colors.red, bg = colors.none, style = "italic,underline", sp = colors.red },
      -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
      SpellCap = { fg = colors.yellow, bg = colors.none, style = "italic,underline", sp = colors.yellow },
      -- Word that is recognized by the spellchecker as one that is used in another region.
      -- |spell| Combined with the highlighting used otherwise.
      SpellLocal = { fg = colors.cyan, bg = colors.none, style = "italic,underline", sp = colors.cyan },
      -- Word that is recognized by the spellchecker as one that is hardly ever used.
      -- |spell| Combined with the highlighting used otherwise.
      SpellRare = { fg = colors.purple, bg = colors.none, style = "italic,underline", sp = colors.purple },
      -- status line of current window
      StatusLine = { fg = colors.fg, bg = colors.active },
      -- status lines of not-current windows Note: if this is equal to "StatusLine"
      -- Vim will use "^^^" in the status line of the current window.
      StatusLineNC = { fg = colors.light_gray, bg = colors.active },
      -- status line of current terminal window
      StatusLineTerm = { fg = colors.fg, bg = colors.active },
      -- status lines of not-current terminal windows Note: if this is equal to "StatusLine"
      -- Vim will use "^^^" in the status line of the current window.
      StatusLineTermNC = { fg = colors.light_gray, bg = colors.active },
      -- tab pages line, where there are no labels
      TabLineFill = { fg = colors.light_gray, bg = colors.active },
      -- tab pages line, active tab page label
      TablineSel = { fg = colors.cyan, bg = colors.bg },
      Tabline = { fg = colors.light_gray, bg = colors.active },
      -- titles for output from ":set all", ":autocmd" etc.
      Title = { fg = colors.green, bg = colors.none, style = "bold" },
      -- Visual mode selection
      Visual = { fg = colors.none, bg = colors.highlight },
      -- Visual mode selection when vim is "Not Owning the Selection".
      VisualNOS = { fg = colors.none, bg = colors.highlight },
      -- warning messages
      WarningMsg = { fg = colors.warn },
      -- "nbsp", "space", "tab" and "trail" in 'listchars'
      Whitespace = { fg = colors.gray },
      -- current match in 'wildmenu' completion
      WildMenu = { fg = colors.yellow, bg = colors.none, style = "bold" },
      -- Screen-column at the cursor, when 'cursorcolumn' is set.
      CursorColumn = { fg = colors.none, bg = colors.float },
      -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
      CursorLine = { fg = colors.none, bg = colors.active },
      -- Normal mode message in the cmdline
      NormalMode = { fg = colors.cyan, bg = colors.none, style = "reverse" },
      -- Insert mode message in the cmdline
      InsertMode = { fg = colors.green, bg = colors.none, style = "reverse" },
      -- Replace mode message in the cmdline
      ReplacelMode = { fg = colors.red, bg = colors.none, style = "reverse" },
      -- Visual mode message in the cmdline
      VisualMode = { fg = colors.purple, bg = colors.none, style = "reverse" },
      -- Command mode message in the cmdline
      CommandMode = { fg = colors.yellow, bg = colors.none, style = "reverse" },
      Warnings = { fg = colors.warn },

      healthError = { fg = colors.error },
      healthSuccess = { fg = colors.green },
      healthWarning = { fg = colors.warn },

      -- Dashboard
      DashboardShortCut = { fg = colors.cyan },
      DashboardHeader = { fg = colors.blue },
      DashboardCenter = { fg = colors.purple },
      DashboardFooter = { fg = colors.green, style = "italic" },

      -- normal text and background color
      Normal = { fg = colors.fg, bg = colors.bg },
      NormalNC = { bg = colors.bg },
      SignColumn = { fg = colors.fg, bg = colors.none },

      -- the column separating vertically split windows
      VertSplit = { fg = colors.bg },

      EndOfBuffer = { fg = colors.gray },
    }

    -- Options:

    -- Set non-current background
    if config.fade_nc then
      editor.NormalNC["bg"] = colors.active
      editor.NormalFloat["bg"] = colors.bg
      editor.FloatBorder["bg"] = colors.bg
    end

    -- Set transparent background
    if config.disable.background then
      remove_background(editor.Normal)
      remove_background(editor.NormalNC)
      remove_background(editor.SignColumn)
    end

    -- Set transparent cursorline
    if config.disable.cursorline then
      remove_background(editor.CursorLine)
    end

    -- Set transparent eob lines
    if config.disable.eob_lines then
      editor.EndOfBuffer["fg"] = colors.bg
    end

    -- Add window split borders
    if config.borders then
      editor.VertSplit["fg"] = colors.selection
    end

    return editor
  end

  local function load_treesitter()
    -- TreeSitter highlight groups

    local treesitter = {
      -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
      TSAttribute = { fg = colors.purple },
      -- Boolean literals: `True` and `False` in Python.
      TSBoolean = { fg = colors.orange },
      -- Character literals: `'a'` in C.
      TSCharacter = { fg = colors.green },
      -- Line comments and block comments.
      TSComment = { fg = colors.light_gray, style = config.styles.comments },
      -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
      TSConditional = { fg = colors.purple, style = config.styles.keywords },
      -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
      TSConstant = { fg = colors.cyan },
      -- Built-in constant values: `nil` in Lua.
      TSConstBuiltin = { fg = colors.orange },
      -- Constants defined by macros: `NULL` in C.
      TSConstMacro = { fg = colors.red },
      -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
      TSConstructor = { fg = colors.yellow },
      -- Syntax/parser errors. This might highlight large sections of code while the user is typing
      -- still incomplete code, use a sensible highlight.
      TSError = { fg = colors.error },
      -- Exception related keywords: `try`, `except`, `finally` in Python.
      TSException = { fg = colors.purple },
      -- Object and struct fields.
      TSField = { fg = colors.blue },
      -- Floating-point number literals.
      TSFloat = { fg = colors.orange },
      -- Function calls and definitions.
      TSFunction = { fg = colors.blue, style = config.styles.functions },
      -- Built-in functions: `print` in Lua.
      TSFuncBuiltin = { fg = colors.cyan, style = config.styles.functions },
      -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
      TSFuncMacro = { fg = colors.blue },
      -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.
      TSInclude = { fg = colors.blue },
      -- Keywords that don't fit into other categories.
      TSKeyword = { fg = colors.purple, style = config.styles.keywords },
      -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
      TSKeywordFunction = { fg = colors.purple, style = config.styles.keywords },
      -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
      TSKeywordOperator = { fg = colors.purple },
      -- Keywords like `return` and `yield`.
      TSKeywordReturn = { fg = colors.purple },
      -- GOTO labels: `label:` in C, and `::label::` in Lua.
      TSLabel = { fg = colors.purple },
      -- Method calls and definitions.
      TSMethod = { fg = colors.blue, style = config.styles.functions },
      -- Identifiers referring to modules and namespaces.
      TSNamespace = { fg = colors.yellow },
      -- Numeric literals that don't fit into other categories.
      TSNumber = { fg = colors.orange },
      -- Binary or unary operators: `+`, and also `->` and `*` in C.
      TSOperator = { fg = colors.purple },
      -- Parameters of a function.
      TSParameter = { fg = colors.red },
      -- References to parameters of a function.
      TSParameterReference = { fg = colors.red },
      -- Same as `TSField`.
      TSProperty = { fg = colors.blue },
      -- Punctuation delimiters: Periods, commas, semicolons, etc.
      TSPunctDelimiter = { fg = colors.dark_blue },
      -- Brackets, braces, parentheses, etc.
      TSPunctBracket = { fg = colors.dark_blue },
      -- Special punctuation that doesn't fit into the previous categories.
      TSPunctSpecial = { fg = colors.dark_blue },
      -- Keywords related to loops: `for`, `while`, etc.
      TSRepeat = { fg = colors.purple, style = config.styles.keywords },
      -- String literals.
      TSString = { fg = colors.green, style = config.styles.strings },
      -- Regular expression literals.
      TSStringRegex = { fg = colors.orange },
      -- Escape characters within a string: `\n`, `\t`, etc.
      TSStringEscape = { fg = colors.orange },
      -- Identifiers referring to symbols or atoms.
      TSSymbol = { fg = colors.cyan },
      -- Tags like HTML tag names.
      TSTag = { fg = colors.yellow },
      -- HTML tag attributes.
      TSTagAttribute = { fg = colors.blue },
      -- Tag delimiters like `<` `>` `/`.
      TSTagDelimiter = { fg = colors.dark_blue },
      -- Non-structured text. Like text in a markup language.
      TSText = { fg = colors.fg },
      -- Text to be represented in bold.
      TSStrong = { fg = colors.purple, style = "bold" },
      -- Text to be represented with emphasis.
      TSEmphasis = { fg = colors.yellow, style = "italic" },
      -- Text to be represented with an underline.
      TSUnderline = { style = "underline" },
      -- Text that is part of a title.
      TSTitle = { fg = colors.blue, style = "bold" },
      -- Literal or verbatim text.
      TSLiteral = { fg = colors.green },
      -- URIs like hyperlinks or email addresses.
      TSURI = { fg = colors.cyan, style = "underline" },
      -- Math environments like LaTeX's `$ ... $`
      TSMath = { fg = colors.fg },
      -- Footnotes, text references, citations, etc.
      TSTextReference = { fg = colors.purple },
      -- Text environments of markup languages.
      TSEnvironment = { fg = colors.fg },
      -- Text/string indicating the type of text environment. Like the name of a `\begin` block in LaTeX.
      TSEnvironmentName = { fg = colors.fg },
      -- Text representation of an informational note.
      TSNote = { fg = colors.info, style = "bold" },
      -- Text representation of a warning note.
      TSWarning = { fg = colors.warn, style = "bold" },
      -- Text representation of a danger note.
      TSDanger = { fg = colors.error, style = "bold" },
      -- Type (and class) definitions and annotations.
      TSType = { fg = colors.yellow },
      -- Built-in types: `i32` in Rust.
      TSTypeBuiltin = { fg = colors.orange },
      -- Variable names that don't fit into other categories.
      TSVariable = { fg = colors.fg, style = config.styles.variables },
      -- Variable names defined by the language: `this` or `self` in Javascript.
      TSVariableBuiltin = { fg = colors.red, style = config.styles.variables },
    }

    return treesitter
  end

  local function load_lsp()
    -- Lsp highlight groups

    local lsp = {
      -- used for "Error" diagnostic virtual text
      LspDiagnosticsDefaultError = { fg = colors.error },
      -- used for "Error" diagnostic signs in sign column
      LspDiagnosticsSignError = { fg = colors.error },
      -- used for "Error" diagnostic messages in the diagnostics float
      LspDiagnosticsFloatingError = { fg = colors.error },
      -- Virtual text "Error"
      LspDiagnosticsVirtualTextError = { fg = colors.error },
      -- used to underline "Error" diagnostics.
      LspDiagnosticsUnderlineError = { style = config.styles.diagnostics, sp = colors.error },
      -- used for "Warning" diagnostic signs in sign column
      LspDiagnosticsDefaultWarning = { fg = colors.warn },
      -- used for "Warning" diagnostic signs in sign column
      LspDiagnosticsSignWarning = { fg = colors.warn },
      -- used for "Warning" diagnostic messages in the diagnostics float
      LspDiagnosticsFloatingWarning = { fg = colors.warn },
      -- Virtual text "Warning"
      LspDiagnosticsVirtualTextWarning = { fg = colors.warn },
      -- used to underline "Warning" diagnostics.
      LspDiagnosticsUnderlineWarning = { style = config.styles.diagnostics, sp = colors.warn },
      -- used for "Information" diagnostic virtual text
      LspDiagnosticsDefaultInformation = { fg = colors.info },
      -- used for "Information" diagnostic signs in sign column
      LspDiagnosticsSignInformation = { fg = colors.info },
      -- used for "Information" diagnostic messages in the diagnostics float
      LspDiagnosticsFloatingInformation = { fg = colors.info },
      -- Virtual text "Information"
      LspDiagnosticsVirtualTextInformation = { fg = colors.info },
      -- used to underline "Information" diagnostics.
      LspDiagnosticsUnderlineInformation = { style = config.styles.diagnostics, sp = colors.info },
      -- used for "Hint" diagnostic virtual text
      LspDiagnosticsDefaultHint = { fg = colors.hint },
      -- used for "Hint" diagnostic signs in sign column
      LspDiagnosticsSignHint = { fg = colors.hint },
      -- used for "Hint" diagnostic messages in the diagnostics float
      LspDiagnosticsFloatingHint = { fg = colors.hint },
      -- Virtual text "Hint"
      LspDiagnosticsVirtualTextHint = { fg = colors.hint },
      -- used to underline "Hint" diagnostics.
      LspDiagnosticsUnderlineHint = { style = config.styles.diagnostics, sp = colors.hint },
      -- used for highlighting "text" references
      LspReferenceText = { style = "underline", sp = colors.yellow },
      -- used for highlighting "read" references
      LspReferenceRead = { style = "underline", sp = colors.yellow },
      -- used for highlighting "write" references
      LspReferenceWrite = { style = "underline", sp = colors.yellow },

      LspSignatureActiveParameter = { fg = colors.none, bg = colors.highlight_dark, style = "bold" },
      LspCodeLens = { fg = colors.light_gray },

      DiagnosticError = { link = "LspDiagnosticsDefaultError" },
      DiagnosticWarn = { link = "LspDiagnosticsDefaultWarning" },
      DiagnosticInfo = { link = "LspDiagnosticsDefaultInformation" },
      DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
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

  local function load_plugins()
    -- Plugins highlight groups

    local plugins = {
      -- Cmp
      CmpItemAbbr = { fg = colors.fg },
      CmpItemAbbrDeprecated = { fg = colors.fg },
      CmpItemAbbrMatch = { fg = colors.blue, style = "bold" },
      CmpItemAbbrMatchFuzzy = { fg = colors.blue, underline = true },
      CmpItemMenu = { fg = colors.light_gray },

      CmpItemKindText = { fg = colors.orange },
      CmpItemKindMethod = { fg = colors.blue },
      CmpItemKindFunction = { fg = colors.blue },
      CmpItemKindConstructor = { fg = colors.yellow },
      CmpItemKindField = { fg = colors.blue },
      CmpItemKindClass = { fg = colors.yellow },
      CmpItemKindInterface = { fg = colors.yellow },
      CmpItemKindModule = { fg = colors.blue },
      CmpItemKindProperty = { fg = colors.blue },
      CmpItemKindValue = { fg = colors.orange },
      CmpItemKindEnum = { fg = colors.yellow },
      CmpItemKindKeyword = { fg = colors.purple },
      CmpItemKindSnippet = { fg = colors.green },
      CmpItemKindFile = { fg = colors.blue },
      CmpItemKindEnumMember = { fg = colors.cyan },
      CmpItemKindConstant = { fg = colors.orange },
      CmpItemKindStruct = { fg = colors.yellow },
      CmpItemKindTypeParameter = { fg = colors.yellow },

      -- Notify
      NotifyERRORBorder = { fg = colors.error },
      NotifyWARNBorder = { fg = colors.warn },
      NotifyINFOBorder = { fg = colors.info },
      NotifyDEBUGBorder = { fg = colors.light_gray },
      NotifyTRACEBorder = { fg = colors.hint },
      NotifyERRORIcon = { fg = colors.error },
      NotifyWARNIcon = { fg = colors.warn },
      NotifyINFOIcon = { fg = colors.info },
      NotifyDEBUGIcon = { fg = colors.light_gray },
      NotifyTRACEIcon = { fg = colors.hint },
      NotifyERRORTitle = { fg = colors.error },
      NotifyWARNTitle = { fg = colors.warn },
      NotifyINFOTitle = { fg = colors.info },
      NotifyDEBUGTitle = { fg = colors.light_gray },
      NotifyTRACETitle = { fg = colors.hint },

      -- Trouble
      TroubleCount = { fg = colors.purple },
      TroubleNormal = { fg = colors.fg },
      TroubleText = { fg = colors.fg },

      -- Diff
      diffAdded = { fg = colors.diff_add },
      diffRemoved = { fg = colors.diff_remove },
      diffChanged = { fg = colors.diff_change },
      diffOldFile = { fg = colors.yellow },
      diffNewFile = { fg = colors.orange },
      diffFile = { fg = colors.blue },
      diffLine = { fg = colors.light_gray },
      diffIndexLine = { fg = colors.purple },

      -- Neogit
      NeogitBranch = { fg = colors.purple },
      NeogitRemote = { fg = colors.orange },
      NeogitHunkHeader = { fg = colors.fg, bg = colors.highlight },
      NeogitHunkHeaderHighlight = { fg = colors.yellow, bg = colors.highlight },
      NeogitDiffContextHighlight = { bg = colors.active },
      NeogitDiffDeleteHighlight = { fg = colors.diff_remove, bg = colors.diff_remove_bg },
      NeogitDiffAddHighlight = { fg = colors.diff_add, bg = colors.diff_add_bg },

      NeogitNotificationInfo = { fg = colors.info },
      NeogitNotificationWarning = { fg = colors.warn },
      NeogitNotificationError = { fg = colors.error },

      -- GitGutter
      GitGutterAdd = { fg = colors.diff_add }, -- diff mode: Added line |diff.txt|
      GitGutterChange = { fg = colors.diff_change }, -- diff mode: Changed line |diff.txt|
      GitGutterDelete = { fg = colors.diff_remove }, -- diff mode: Deleted line |diff.txt|

      -- GitSigns
      GitSignsAdd = { fg = colors.diff_add }, -- diff mode: Added line |diff.txt|
      GitSignsAddNr = { fg = colors.diff_add }, -- diff mode: Added line |diff.txt|
      GitSignsAddLn = { fg = colors.diff_add }, -- diff mode: Added line |diff.txt|
      GitSignsChange = { fg = colors.diff_change }, -- diff mode: Changed line |diff.txt|
      GitSignsChangeNr = { fg = colors.diff_change }, -- diff mode: Changed line |diff.txt|
      GitSignsChangeLn = { fg = colors.diff_change }, -- diff mode: Changed line |diff.txt|
      GitSignsDelete = { fg = colors.diff_remove }, -- diff mode: Deleted line |diff.txt|
      GitSignsDeleteNr = { fg = colors.diff_remove }, -- diff mode: Deleted line |diff.txt|
      GitSignsDeleteLn = { fg = colors.diff_remove }, -- diff mode: Deleted line |diff.txt|

      -- Telescope
      TelescopeNormal = { fg = colors.fg, bg = colors.bg },
      TelescopePromptPrefix = { fg = colors.purple },
      TelescopePromptBorder = { fg = colors.blue },
      TelescopeResultsBorder = { fg = colors.blue },
      TelescopePreviewBorder = { fg = colors.blue },
      TelescopeSelectionCaret = { fg = colors.cyan },
      TelescopeSelection = { fg = colors.cyan },
      TelescopeMatching = { fg = colors.yellow, style = "bold" },

      -- NvimTree
      NvimTreeSymlink = { fg = colors.cyan, style = "bold" },
      NvimTreeRootFolder = { fg = colors.green, style = "bold" },
      NvimTreeFolderName = { fg = colors.blue },
      NvimTreeFolderIcon = { fg = colors.dark_blue },
      NvimTreeEmptyFolderName = { fg = colors.light_gray },
      NvimTreeOpenedFolderName = { fg = colors.yellow, style = "italic" },
      NvimTreeIndentMarker = { fg = colors.blue },
      NvimTreeGitDirty = { fg = colors.yellow },
      NvimTreeGitNew = { fg = colors.diff_add },
      NvimTreeGitStaged = { fg = colors.purple },
      NvimTreeGitDeleted = { fg = colors.diff_remove },
      NvimTreeExecFile = { fg = colors.green, style = "bold" },
      NvimTreeOpenedFile = { fg = colors.none },
      NvimTreeSpecialFile = { fg = colors.orange, style = "underline" },
      NvimTreeImageFile = { fg = colors.purple, style = "bold" },
      NvimTreeNormal = { fg = colors.fg, bg = colors.active },
      NvimTreeCursorLine = { bg = colors.float },
      NvimTreeVertSplit = { fg = colors.active, bg = colors.active },
      LspDiagnosticsError = { fg = colors.error },
      LspDiagnosticsWarning = { fg = colors.warn },
      LspDiagnosticsInformation = { fg = colors.info },
      LspDiagnosticsHint = { fg = colors.hint },

      -- WhichKey
      WhichKey = { fg = colors.purple, style = "bold" },
      WhichKeyGroup = { fg = colors.cyan },
      WhichKeyDesc = { fg = colors.blue, style = "italic" },
      WhichKeySeperator = { fg = colors.green },
      WhichKeyFloat = { bg = colors.active },

      -- LspSaga
      LspFloatWinNormal = { fg = colors.fg, bg = colors.bg },
      LspFloatWinBorder = { fg = colors.purple },
      DiagnosticError = { fg = colors.error },
      DiagnosticWarning = { fg = colors.warn },
      DiagnosticInformation = { fg = colors.info },
      DiagnosticHint = { fg = colors.hint },
      LspSagaDiagnosticBorder = { fg = colors.gray },
      LspSagaDiagnosticHeader = { fg = colors.blue },
      LspSagaDiagnosticTruncateLine = { fg = colors.highlight },
      ProviderTruncateLine = { fg = colors.highlight },
      LspSagaShTruncateLine = { fg = colors.highlight },
      LspSagaDocTruncateLine = { fg = colors.highlight },
      LineDiagTruncateLine = { fg = colors.highlight },
      LspSagaBorderTitle = { fg = colors.cyan },
      LspSagaHoverBorder = { fg = colors.blue },
      LspSagaRenameBorder = { fg = colors.green },
      LspSagaDefPreviewBorder = { fg = colors.green },
      LspSagaCodeActionTitle = { fg = colors.blue },
      LspSagaCodeActionContent = { fg = colors.purple },
      LspSagaCodeActionBorder = { fg = colors.blue },
      LspSagaCodeActionTruncateLine = { fg = colors.highlight },
      LspSagaSignatureHelpBorder = { fg = colors.light_red },
      LspSagaFinderSelection = { fg = colors.green },
      LspSagaAutoPreview = { fg = colors.red },
      ReferencesCount = { fg = colors.purple },
      DefinitionCount = { fg = colors.purple },
      DefinitionPreviewTitle = { fg = colors.green },
      DefinitionIcon = { fg = colors.blue },
      ReferencesIcon = { fg = colors.blue },
      TargetWord = { fg = colors.cyan },

      -- BufferLine
      BufferLineIndicatorSelected = { fg = colors.yellow },
      BufferLineFill = { bg = colors.bg },

      -- barbar
      BufferCurrent = { fg = colors.fg, bg = colors.bg },
      BufferCurrentIndex = { fg = colors.fg, bg = colors.bg },
      BufferCurrentMod = { fg = colors.yellow, bg = colors.bg, style = "bold" },
      BufferCurrentSign = { fg = colors.cyan, bg = colors.bg },
      BufferCurrentTarget = { fg = colors.red, bg = colors.bg, style = "bold" },
      BufferVisible = { fg = colors.fg, bg = colors.bg },
      BufferVisibleIndex = { fg = colors.fg, bg = colors.bg },
      BufferVisibleMod = { fg = colors.yellow, bg = colors.bg, style = "bold" },
      BufferVisibleSign = { fg = colors.light_gray, bg = colors.bg },
      BufferVisibleTarget = { fg = colors.red, bg = colors.bg, style = "bold" },
      BufferInactive = { fg = colors.light_gray, bg = colors.active },
      BufferInactiveIndex = { fg = colors.light_gray, bg = colors.active },
      BufferInactiveMod = { fg = colors.yellow, bg = colors.active },
      BufferInactiveSign = { fg = colors.light_gray, bg = colors.active },
      BufferInactiveTarget = { fg = colors.red, bg = colors.active, style = "bold" },

      -- Sneak
      Sneak = { fg = colors.bg, bg = colors.fg },
      SneakScope = { bg = colors.selection },

      -- Indent Blankline
      IndentBlanklineChar = { fg = colors.selection, style = "nocombine" },
      IndentBlanklineContextChar = { fg = colors.purple, style = "nocombine" },

      -- Nvim dap
      DapBreakpoint = { fg = colors.red },
      DapStopped = { fg = colors.green },

      -- Illuminate
      illuminatedWord = { bg = colors.highlight },
      illuminatedCurWord = { bg = colors.highlight },

      -- Hop
      HopNextKey = { fg = colors.fg_light, style = "bold" },
      HopNextKey1 = { fg = colors.cyan, style = "bold" },
      HopNextKey2 = { fg = colors.purple },
      HopUnmatched = { fg = colors.light_gray },

      -- Fern
      FernBranchText = { fg = colors.blue },

      -- Lightspeed
      LightspeedLabel = { fg = colors.pink, style = "bold,underline" },
      LightspeedLabelOverlapped = { fg = colors.dark_pink, style = "underline" },
      LightspeedLabelDistant = { fg = colors.cyan, style = "bold,underline" },
      LightspeedLabelDistantOverlapped = { fg = colors.blue, style = "underline" },
      LightspeedShortcut = { fg = "#E5E9F0", bg = colors.pink, style = "bold,underline" },
      LightspeedMaskedChar = { fg = colors.light_purple },
      LightspeedGreyWash = { fg = colors.gray },
      LightspeedUnlabeledMatch = { fg = colors.fg_light, style = "bold" },
      LightspeedOneCharMatch = { fg = colors.yellow, style = "bold,reverse" },
    }

    -- Options:

    -- Make telescope look a bit better with alternate non-current background
    if config.fade_nc then
      plugins.TelescopePromptBorder["bg"] = colors.bg
      plugins.TelescopeResultsBorder["bg"] = colors.bg
      plugins.TelescopePreviewBorder["bg"] = colors.bg
    end

    -- Disable nvim-tree background
    if config.disable.background then
      remove_background(plugins.NvimTreeNormal)
    end

    return plugins
  end

  function theme.load_terminal()
    -- dark
    vim.g.terminal_color_0 = colors.float
    vim.g.terminal_color_8 = colors.selection

    -- light
    vim.g.terminal_color_7 = colors.fg
    vim.g.terminal_color_15 = colors.fg_light

    -- colors
    vim.g.terminal_color_1 = colors.red
    vim.g.terminal_color_9 = colors.red

    vim.g.terminal_color_2 = colors.green
    vim.g.terminal_color_10 = colors.green

    vim.g.terminal_color_3 = colors.yellow
    vim.g.terminal_color_11 = colors.yellow

    vim.g.terminal_color_4 = colors.blue
    vim.g.terminal_color_12 = colors.blue

    vim.g.terminal_color_5 = colors.purple
    vim.g.terminal_color_13 = colors.purple

    vim.g.terminal_color_6 = colors.cyan
    vim.g.terminal_color_14 = colors.cyan
  end

  return vim.tbl_deep_extend("error", load_syntax(), load_editor(), load_treesitter(), load_lsp(), load_plugins())
end

return theme

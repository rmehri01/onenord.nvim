local util = {}
local onenord = require("onenord.theme")

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
		onenord.loadEditor,
		onenord.loadSyntax,
		onenord.loadTreeSitter,
		onenord.loadPlugins,
		onenord.loadLSP,
	}

	for _, load in ipairs(highlights) do
		for group, colors in pairs(load()) do
			util.highlight(group, colors)
		end
	end

	onenord.loadTerminal()
end

return util

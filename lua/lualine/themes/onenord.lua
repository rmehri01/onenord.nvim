local colors = require("onenord.colors")

local onenord = {
	normal = {
		a = { fg = colors.fg, bg = colors.blue, gui = "bold" },
		b = { fg = colors.fg, bg = colors.selection },
		c = { fg = colors.fg, bg = colors.active },
	},
	insert = { a = { fg = colors.fg, bg = colors.green, gui = "bold" } },
	visual = { a = { fg = colors.fg, bg = colors.purple, gui = "bold" } },
	command = { a = { fg = colors.fg, bg = colors.yellow, gui = "bold" } },
	replace = { a = { fg = colors.fg, bg = colors.red, gui = "bold" } },
	inactive = {
		a = { fg = colors.light_gray, bg = colors.highlight, gui = "bold" },
		b = { fg = colors.light_gray },
		c = { fg = colors.light_gray, bg = colors.active },
	},
}

return onenord

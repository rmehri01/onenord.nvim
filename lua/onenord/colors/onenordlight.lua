local colors = {
  fg = "#2E3440",
  fg_light = "#E5E9F0",
  bg = "#fafafa",
  gray = "#646A76",
  light_gray = "#6C7A96",
  cyan = "#56B6C2",
  blue = "#3A94C2",
  dark_blue = "#1b40a6",
  green = "#5AB349",
  light_green = "#8FBCBB",
  dark_red = "#BF616A",
  red = "#DC626C",
  light_red = "#DE878F",
  pink = "#E85B7A",
  dark_pink = "#E44675",
  orange = "#EE9025",
  yellow = "#EEA825",
  purple = "#9665AF",
  light_purple = "#9665AF",
  none = "NONE",
}

-- more semantically meaningful colors

colors.error = colors.dark_red
colors.warn = colors.orange
colors.info = colors.green
colors.hint = colors.purple

colors.diff_add = colors.green
colors.diff_add_bg = "#324125"
colors.diff_change = colors.dark_blue
colors.diff_change_bg = "#334963"
colors.diff_remove = colors.red
colors.diff_remove_bg = colors.dark_red
colors.diff_text_bg = "#446285"

colors.active = "#EAEAEA"
colors.float = "#EAEAEA"
colors.highlight = "#EAEAEA"
colors.selection = "#EAEAEA"

return colors

local onenord = {
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

onenord.error = onenord.dark_red
onenord.warn = onenord.orange
onenord.info = onenord.green
onenord.hint = onenord.purple

onenord.diff_add = onenord.green
onenord.diff_add_bg = "#324125"
onenord.diff_change = onenord.dark_blue
onenord.diff_change_bg = "#334963"
onenord.diff_remove = onenord.red
onenord.diff_remove_bg = onenord.dark_red
onenord.diff_text_bg = "#446285"

onenord.active = "#EAEAEA"
onenord.float = "#EAEAEA"
onenord.highlight = "#EAEAEA"
onenord.selection = "#EAEAEA"

return onenord

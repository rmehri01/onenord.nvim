local colors = {}

function colors.load()
  local style = require("onenord.config").options.style

  if style == "light" then
    return require("onenord.colors.onenordlight")
  else
    return require("onenord.colors.onenord")
  end
end

return colors

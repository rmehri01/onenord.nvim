-- Refresh cache for local debugging and development purposes
if vim.g.onenord_debug == true then
  package.loaded["onenord"] = nil
  package.loaded["onenord.util"] = nil
  package.loaded["onenord.colors"] = nil
  package.loaded["onenord.theme"] = nil
end

local default_config = require("onenord.config").make_config()
require("onenord.util").load(default_config, false)

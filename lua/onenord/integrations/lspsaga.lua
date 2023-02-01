local M = {}

function M.custom_kind()
  local colors = require("onenord.colors").load()

  return {
    File = { " ", colors.fg_light },
    Module = { " ", colors.blue },
    Namespace = { " ", colors.yellow },
    Package = { " ", colors.orange },
    Class = { " ", colors.yellow },
    Method = { " ", colors.purple },
    Property = { " ", colors.blue },
    Field = { " ", colors.blue },
    Constructor = { " ", colors.yellow },
    Enum = { "了", colors.yellow },
    Interface = { " ", colors.yellow },
    Function = { " ", colors.blue },
    Variable = { " ", colors.blue },
    Constant = { " ", colors.cyan },
    String = { " ", colors.green },
    Number = { " ", colors.orange },
    Boolean = { " ", colors.orange },
    Array = { " ", colors.yellow },
    Object = { " ", colors.orange },
    Key = { " ", colors.purple },
    Null = { " ", colors.red },
    EnumMember = { " ", colors.cyan },
    Struct = { " ", colors.yellow },
    Event = { " ", colors.purple },
    Operator = { " ", colors.purple },
    TypeParameter = { " ", colors.yellow },
    TypeAlias = { " ", colors.yellow },
    Parameter = { " ", colors.red },
    StaticMethod = { "ﴂ ", colors.blue },
    Macro = { " ", colors.red },
    Text = { " ", colors.orange },
    Snippet = { " ", colors.green },
    Folder = { " ", colors.dark_blue },
    Unit = { " ", colors.cyan },
    Value = { " ", colors.orange },
  }
end

return M

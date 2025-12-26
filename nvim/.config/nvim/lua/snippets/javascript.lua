-- ~/.config/nvim/lua/snippets/javascript.lua

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function filename()
  return vim.fn.expand("%:t:r")
end

local function line_number()
  return tostring(vim.fn.line("."))
end

return {
  s("clog", {
    t("console.log('>>> ℹ️ "),
    f(filename),
    t(" - "),
    f(line_number),
    t("', { "),
    i(1),
    t(" });"),
  }),

  s("slog", {
    t("console.log('>>> ℹ️ "),
    f(filename),
    t(" - "),
    f(line_number),
    t(" - "),
    i(1),
    t("');"),
  }),

  s("seplog", {
    t("console.log('>>> ---------------------- <<<');"),
  }),
}

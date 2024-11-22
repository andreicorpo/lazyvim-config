---@diagnostic disable: undefined-global

--[[
    Abbreviations used in this article and the LuaSnip docs
    local ls = require("luasnip")
    local s = ls.snippet
    local sn = ls.snippet_node
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local d = ls.dynamic_node
    local fmt = require("luasnip.extras.fmt").fmt
    local fmta = require("luasnip.extras.fmt").fmta
    local rep = require("luasnip.extras").rep
--]]

return {
  s(
    {
      trig = "snips_template",
      desc = "Prepare a file for adding snippets in it",
      priority = 100,
      snippetType = "autosnippet",
    },
    fmt(
      [[
        ---@diagnostic disable: undefined-global

        --- Abbreviations used in this article and the LuaSnip docs
        --- s = ls.snippet
        --- sn = ls.snippet_node
        --- t = ls.text_node
        --- i = ls.insert_node
        --- f = ls.function_node
        --- d = ls.dynamic_node
        --- fmt = require("luasnip.extras.fmt").fmt
        --- fmta = require("luasnip.extras.fmt").fmta
        --- rep = require("luasnip.extras").rep

        return {
          <>
        }
      ]],
      { i(1) },
      { delimiters = "<>" }
    )
  ),
  s(
    {
      trig = "autocmd",
    },
    fmta(
      [[
        vim.api.nvim_create_autocmd({"<>"}, {
          group = augroup("<>"),
          pattern = { "*" },
          callback = <>,
        })
      ]],
      { i(1), i(2), i(3) }
    )
  ),
  s(
    {
      trig = "plugin_spec",
      desc = "Prepare a file for plugins",
    },
    fmta(
      [[
        return {
          <>
        }
      ]],
      { i(1) }
    )
  ),
}

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
  s(
    { trig = "rcmp", desc = "React arrow function components" },
    fmta(
      [[ 
      type <>Props = {}

      const <> = (props: <>Props) =>> {
        return null
      }

      export { <> }
      ]],
      { rep(1), i(1), rep(1), rep(1) }
    )
  ),
}

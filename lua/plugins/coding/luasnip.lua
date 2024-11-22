return {
  {
    "L3MON4D3/LuaSnip",
    opts = function(_, opts)
      local types = require("luasnip.util.types")

      opts.ext_opts = {
        [types.choiceNode] = {
          active = {
            hl_mode = "combine",
            virt_text = { { "●", "Operator" } },
          },
        },
        [types.insertNode] = {
          active = {
            hl_mode = "combine",
            virt_text = { { "●", "Type" } },
          },
        },
      }

      opts.update_events = "TextChanged,TextChangedI"

      -- - `region_check_events`: Events on which to leave the current snippet-root if the
      --     cursor is outside its’ 'region'. Disabled by default, `'CursorMoved'`,
      --     `'CursorHold'` or `'InsertEnter'` seem reasonable.
      -- - `delete_check_events`: When to check if the current snippet was deleted, and if
      --     so, remove it from the history. Off by default, `'TextChanged'` (perhaps
      --     `'InsertLeave'`, to react to changes done in Insert mode) should work just fine
      --     (alternatively, this can also be mapped using `<Plug>luasnip-delete-check`).

      opts.enable_autosnippets = true

      require("luasnip.loaders.from_lua").lazy_load({ paths = { vim.fn.stdpath("config") .. "/LuaSnip" } })

      require("luasnip").filetype_extend("typescript", { "typescriptreact" })
      require("luasnip").filetype_extend("javascript", { "typescriptreact" })
      require("luasnip").filetype_extend("dart", { "flutter" })
      require("luasnip").filetype_extend("NeogitCommitMessage", { "gitcommit" })
    end,
    keys = function()
      local ls = require("luasnip")
      return {
        {
          "<C-l>",
          function()
            if not ls.expand_or_jumpable() then
              return
            end
            ls.expand_or_jump()
          end,
          silent = true,
          mode = { "s", "i" },
        },
        {
          "<C-h>",
          function()
            if not ls.jumpable(-1) then
              return
            end
            ls.jump(-1)
          end,
          silent = true,
          mode = { "i", "s" },
        },
      }
    end,
  },
}

return {
  {
    "kevinhwang91/nvim-ufo",
    event = "VeryLazy",
    init = function()
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 999
    end,
    dependencies = {
      "kevinhwang91/promise-async",
    },
    keys = {
      {
        "zR",
        function()
          require("ufo").openAllFolds()
        end,
        "open all folds",
      },
      {
        "zM",
        function()
          require("ufo").closeAllFolds()
        end,
        "close all folds",
      },
      {
        "zp",
        function()
          require("ufo").peekFoldedLinesUnderCursor()
        end,
        desc = "fold: preview",
      },
    },
    config = function()
      local ft_map = {
        rust = "lsp",
        snacks_dashboard = "",
        lua = "lsp",
      }

      require("ufo").setup({
        open_fold_hl_timeout = 0,
        preview = { win_config = { winhighlight = "Normal:Normal,FloatBorder:Normal" } },
        enable_get_fold_virt_text = true,
        close_fold_kinds_for_ft = {
          default = { "imports", "comment" },
        },
        provider_selector = function(_, ft)
          return ft_map[ft] or { "treesitter", "indent" }
        end,
      })
    end,
  },
}

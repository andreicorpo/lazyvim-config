return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      -- servers = {
      --   eslint_d = {},
      -- },
    },
    keys = function()
      require("lazyvim.plugins.lsp.keymaps")._keys = {
        {
          "<leader>lf",
          function()
            LazyVim.format({ force = true })
          end,
          desc = "format",
        },
        {
          "<leader>ll",
          "<cmd>LspInfo<cr>",
          desc = "info",
        },
        {
          "<leader>lm",
          "<cmd>Mason<cr>",
          desc = "info",
        },
        {
          "<leader>la",
          vim.lsp.buf.code_action,
          desc = "code action",
          mode = { "n", "v" },
          has = "codeAction",
        },
        {
          "<leader>lc",
          vim.lsp.codelens.run,
          desc = "run codelens",
          mode = { "n", "v" },
          has = "codeLens",
        },
        {
          "<leader>lC",
          vim.lsp.codelens.refresh,
          desc = "refresh & display codelens",
          mode = { "n" },
          has = "codeLens",
        },
        {
          "<leader>lR",
          function()
            Snacks.rename.rename_file()
          end,
          desc = "rename file",
          mode = { "n" },
          has = { "workspace/didRenameFiles", "workspace/willRenameFiles" },
        },
        {
          "<leader>lr",
          function()
            local inc_rename = require("inc_rename")
            return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
          end,
          expr = true,
          desc = "rename (inc-rename.nvim)",
          has = "rename",
        },
        {
          "<leader>lA",
          LazyVim.lsp.action.source,
          desc = "source action",
          has = "codeAction",
        },
        { "gd", vim.lsp.buf.definition, desc = "Goto Definition", has = "definition" },
        { "gr", vim.lsp.buf.references, desc = "References", nowait = true },
        { "gI", vim.lsp.buf.implementation, desc = "Goto Implementation" },
        { "gy", vim.lsp.buf.type_definition, desc = "Goto T[y]pe Definition" },
        { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
        {
          "K",
          function()
            return vim.lsp.buf.hover()
          end,
          desc = "Hover",
        },
        {
          "gK",
          function()
            return vim.lsp.buf.signature_help()
          end,
          desc = "Signature Help",
          has = "signatureHelp",
        },
        {
          "<c-k>",
          function()
            return vim.lsp.buf.signature_help()
          end,
          mode = "i",
          desc = "Signature Help",
          has = "signatureHelp",
        },

        {
          "]]",
          function()
            Snacks.words.jump(vim.v.count1)
          end,
          has = "documentHighlight",
          desc = "Next Reference",
          cond = function()
            return Snacks.words.is_enabled()
          end,
        },
        {
          "[[",
          function()
            Snacks.words.jump(-vim.v.count1)
          end,
          has = "documentHighlight",
          desc = "Prev Reference",
          cond = function()
            return Snacks.words.is_enabled()
          end,
        },
        {
          "<a-n>",
          function()
            Snacks.words.jump(vim.v.count1, true)
          end,
          has = "documentHighlight",
          desc = "Next Reference",
          cond = function()
            return Snacks.words.is_enabled()
          end,
        },
        {
          "<a-p>",
          function()
            Snacks.words.jump(-vim.v.count1, true)
          end,
          has = "documentHighlight",
          desc = "Prev Reference",
          cond = function()
            return Snacks.words.is_enabled()
          end,
        },
      }
    end,
  },
}

return {
  {
    "hiphish/rainbow-delimiters.nvim",
    event = "LspAttach",
    config = function()
      vim.g.rainbow_delimiters = {
        query = {
          typescriptreact = "rainbow-parens",
          tsx = "rainbow-parens",
          javascriptreact = "rainbow-parens",
          jsx = "rainbow-parens",
        },
      }
    end,
  },
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {
        "axelvc/template-string.nvim",
        config = function()
          require("template-string").setup({})
        end,
      },
    },
    opts = {
      ensure_installed = {
        "bash",
        "nu",
        "diff",
        "html",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "query",
        "vim",
        "vimdoc",
        "typescript",
        "css",
        "scss",
        "javascript",
        "styled",
        "graphql",
      },
    },
  },
}

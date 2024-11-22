return {
  { -- Autoformat
    "stevearc/conform.nvim",
    keys = function()
      return {
        {
          "<leader>lF",
          function()
            require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
          end,
          mode = { "n", "v" },
          desc = "format: injected lang",
        },
      }
    end,
  },
}

return {
  "folke/flash.nvim",
  keys = function()
    return {
      {
        "S",
        function()
          require("flash").jump()
        end,
        mode = { "n", "x", "o" },
        desc = "flash: jump",
      },
      {
        "<leader>S",
        function()
          require("flash").treesitter()
        end,
        mode = { "n", "o", "x" },
        desc = "flash: treesitter",
      },
      {
        "r",
        function()
          require("flash").remote()
        end,
        mode = "o",
        desc = "flash: remote",
      },
      {
        "<c-s>",
        function()
          require("flash").toggle()
        end,
        mode = { "c" },
        desc = "flash: toggle",
      },
    }
  end,
}

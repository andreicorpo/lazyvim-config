return {
  {
    "chrisgrieser/nvim-origami",
    event = "BufReadPost",
    init = function()
      vim.o.foldcolumn = "1" -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 999
    end,
    keys = {
      {
        "H",
        function()
          vim.cmd([[normal _]])
          require("origami").h()
        end,
        desc = "fold",
      },
      {
        "L",
        function()
          require("origami").l()
        end,
        desc = "unfold",
      },
    },
  },
}

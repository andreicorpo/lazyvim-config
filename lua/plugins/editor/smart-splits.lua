return {
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    keys = function()
      local splits = require("smart-splits")
      return {
        { "<A-r>", splits.start_resize_mode },
        { "<A-Left>", splits.resize_left },
        { "<A-Down>", splits.resize_down },
        { "<A-Up>", splits.resize_up },
        { "<A-Right>", splits.resize_right },
        { "<C-h>", splits.move_cursor_left },
        { "<C-j>", splits.move_cursor_down },
        { "<C-k>", splits.move_cursor_up },
        { "<C-l>", splits.move_cursor_right },
      }
    end,
  },
}

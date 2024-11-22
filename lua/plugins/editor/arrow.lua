return {
  {
    "otavioschwanck/arrow.nvim",
    event = "VeryLazy",
    opts = {
      show_icons = true,
      always_show_path = true,
      leader_key = [[']], -- Recommended to be a single key
      buffer_leader_key = "m", -- Per Buffer Mappings
      index_keys = "asdfjkl:",
      -- hide_handbook = true,
      mappings = {
        edit = "e",
        delete_mode = "d",
        clear_all_items = "C",
        toggle = " ", -- used as save if separate_save_and_remove is true
        open_vertical = "v",
        open_horizontal = "-",
        quit = "q",
        remove = "x", -- only used if separate_save_and_remove is true
        next_item = "n",
        prev_item = "p",
      },
    },
    keys = function()
      local arrow = require("arrow.persist")
      local nav_keys = vim.split("&({[=-+]})", "")

      local keys = {}

      for idx, key in ipairs(nav_keys) do
        table.insert(keys, {
          "<leader>" .. key,
          function()
            arrow.go_to(idx)
          end,
          desc = "arrow: nav to " .. key,
        })
      end

      table.insert(keys, {
        "<leader>h",
        function()
          arrow.open_cache_file()
        end,
        desc = "arrow: shots",
      })

      table.insert(keys, {
        "<leader>.",
        function()
          arrow.toggle()
        end,
        desc = "arrow: shot",
      })

      return keys
    end,
  },
}

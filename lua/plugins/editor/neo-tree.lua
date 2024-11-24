-- Trash the target
local function trash(state)
  local inputs = require("neo-tree.ui.inputs")
  local node = state.tree:get_node()
  if node.type == "message" then
    return
  end
  local _, name = require("neo-tree.utils").split_path(node.path)
  local msg = string.format("Are you sure you want to trash '%s'?", name)
  inputs.confirm(msg, function(confirmed)
    if not confirmed then
      return
    end
    vim.api.nvim_command("silent !trash -F " .. node.path)
    require("neo-tree.sources.manager").refresh(state)
  end)
end

-- Trash the selections (visual mode)
local function trash_visual(state, selected_nodes)
  local inputs = require("neo-tree.ui.inputs")
  local paths_to_trash = {}
  for _, node in ipairs(selected_nodes) do
    if node.type ~= "message" then
      table.insert(paths_to_trash, node.path)
    end
  end
  local msg = "Are you sure you want to trash " .. #paths_to_trash .. " items?"
  inputs.confirm(msg, function(confirmed)
    if not confirmed then
      return
    end
    for _, path in ipairs(paths_to_trash) do
      vim.api.nvim_command("silent !trash -F " .. path)
    end
    require("neo-tree.sources.manager").refresh(state)
  end)
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    close_if_last_window = true,
    popup_border_style = { "▔", "▔", "▔", " ", " ", " ", " ", " " },
    commands = {
      trash = trash,
      trash_visual = trash_visual,
    },
    window = {
      mappings = {
        d = "trash",
      },
    },
    filesystem = {
      filtered_items = {
        visible = true,
      },
      follow_current_file = {
        enabled = true,
      },
      hijack_netrw_behavior = "open_current",
    },
  },
  keys = function()
    return {
      {
        "\\",
        -- function()
        --   require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root(), position = "right", reveal = true })
        -- end,
        "<Cmd>Neotree toggle reveal=true position=top<CR>",
        desc = "neo-tree: toggle",
      },
      {
        "<leader>e",
        -- function()
        --   require("neo-tree.command").execute({
        --     toggle = true,
        --     dir = LazyVim.root(),
        --     position = "float",
        --     reveal = true,
        --   })
        -- end,
        "<Cmd>Neotree toggle reveal=true position=float<CR>",
        desc = "neo-tree: float",
      },
      -- {
      --   "<leader>fE",
      --   function()
      --     require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      --   end,
      --   desc = "Explorer NeoTree (cwd)",
      -- },
    }
  end,
}

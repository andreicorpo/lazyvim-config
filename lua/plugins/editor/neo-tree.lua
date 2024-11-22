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
    },
  },
  keys = function()
    return {}
  end,
}

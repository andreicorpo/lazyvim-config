local M = {}

M.plugins = {}

local plugins = {
  "arrow",
  "neo-tree",
  "smart-splits",
  "telescope",
  "treesitter",
}

for _, plugin in ipairs(plugins) do
  table.insert(M.plugins, require("plugins.editor." .. plugin))
end

return M.plugins

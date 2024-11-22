local M = {}

M.plugins = {}

local plugins = {
  "ai.avante",
  "ai.supermaven",
  "cmp",
  "luasnip",
}

for _, plugin in ipairs(plugins) do
  table.insert(M.plugins, require("plugins.coding." .. plugin))
end

return M.plugins

local M = {}

M.plugins = {}

local plugins = {
    "whick-key",
}

for _, plugin in ipairs(plugins) do
  table.insert(M.plugins, require("plugins.ui." .. plugin))
end

return M.plugins
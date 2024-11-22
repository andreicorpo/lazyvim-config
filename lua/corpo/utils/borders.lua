---@alias BorderStyle "thin"
---@alias BorderPosition "top_left"|"top_right"|"bot_left"|"bot_right"|"top"|"right"|"bot"|"left"
---@alias BorderOrder "corner_first"|"edges_first"

---@class BorderOpts
---@field order BorderOrder The order of border characters
---@field style BorderStyle The style of border characters

---@class Replacements
---@field top_left? string
---@field top_right? string
---@field bot_left? string
---@field bot_right? string
---@field top? string
---@field right? string
---@field bot? string
---@field left? string

local M = {
  chars = {

    thin = {
      top_left = "🭽",
      bot_left = "🭼",
      top_right = "🭾",
      bot_right = "🭿",
      top = "▔",
      bot = "▁",
      left = "▏",
      right = "▕",
    },
  },
}

M.corner_first = {
  thin = {
    M.chars.thin.top_left,
    M.chars.thin.top,
    M.chars.thin.top_right,
    M.chars.thin.right,
    M.chars.thin.bot_right,
    M.chars.thin.bot,
    M.chars.thin.bot_left,
    M.chars.thin.left,
  },
}

M.edges_first = {
  thin = {
    M.chars.thin.top,
    M.chars.thin.right,
    M.chars.thin.bot,
    M.chars.thin.left,
    M.chars.thin.top_left,
    M.chars.thin.top_right,
    M.chars.thin.bot_right,
    M.chars.thin.bot_left,
  },
}

---@param pos BorderPosition
---@param order BorderOrder
---@return number index
local function pos_to_idx(pos, order)
  -- If using corner_first style (1: topleft, 2: top, 3: topright, 4: right, 5: botright, 6: bot, 7: botleft, 8: left)
  local corner_first_map = {
    top_left = 1,
    top = 2,
    top_right = 3,
    right = 4,
    bot_right = 5,
    bot = 6,
    bot_left = 7,
    left = 8,
  }

  -- If using edges_first style (1: top, 2: right, 3: bot, 4: left, 5: topleft, 6: topright, 7: botleft, 8: botright)
  local edges_first_map = {
    top = 1,
    right = 2,
    bot = 3,
    left = 4,
    top_left = 5,
    top_right = 6,
    bot_right = 7,
    bot_left = 8,
  }

  if order == "corner_first" then
    return corner_first_map[pos]
  else
    return edges_first_map[pos]
  end
end
---@param opts BorderOpts The options for border generation
---@param replacements? Replacements The replacements for border characters
---@return string[] border Array of border characters
function M.get_border(opts, replacements)
  local border = vim.deepcopy(M.borders[opts.order][opts.style])
  if replacements then
    for pos, char in pairs(replacements) do
      local idx = pos_to_idx(pos, opts.order)
      border[idx] = char
    end
  end

  return border
end

return M

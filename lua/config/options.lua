-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.scroll = 10
vim.opt.spell = true
vim.opt.spelllang = "en_gb"
vim.opt.formatoptions:remove({ "r", "o" })

vim.g.maplocalleader = "," -- Local leader is <Space>

vim.opt.fillchars = {
  vert = " ", -- vertical split
  -- horiz = " ", -- horizontal split
  -- horizup = " ", -- top of a horizontal split
  -- horizdown = " ", -- bottom of a horizontal split
  vertleft = " ", -- left of a vertical split
  vertright = " ", -- right of a vertical split
  eob = " ", -- suppress ~ at EndOfBuffer
  diff = "⣿", -- alternatives = ⣿ ░ ─
  msgsep = " ", -- alternatives: ‾ ─
  fold = " ",
  foldopen = "▼", -- '▼'
  foldclose = "▶", -- '▶'
  foldsep = " ",
}

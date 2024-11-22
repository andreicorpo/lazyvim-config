-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local autocmd = vim.api.nvim_create_autocmd

local function augroup(name)
  return vim.api.nvim_create_augroup("corpo_" .. name, { clear = true })
end

autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = augroup("HighlightYank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd("FileType", {
  group = augroup("FileTypeOpts"),
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "r", "o" })
  end,
})

vim.keymap.set({ "n", "v", "o", "i", "c" }, "<Plug>(StopHL)", 'execute("nohlsearch")[-1]', { expr = true })

-- local function stop_hl()
--   print("stop_hl")
--   if vim.v.hlsearch == 0 or vim.api.nvim_get_mode().mode ~= "n" then
--     return
--   end
--   vim.api.nvim_feedkeys(Corpo.replace_termcodes("<Plug>(StopHL)"), "m", false)
-- end
--
-- local function hl_search()
--   local col = vim.api.nvim_win_get_cursor(0)[2]
--   local curr_line = vim.api.nvim_get_current_line()
--   local ok, match = pcall(vim.fn.matchstrpos, curr_line, vim.fn.getreg("/"), 0)
--   if not ok then
--     return
--   end
--   local _, p_start, p_end = unpack(match)
--   -- if the cursor is in a search result, leave highlighting on
--   if col < p_start or col > p_end then
--     stop_hl()
--   end
-- end
--
-- autocmd("CursorMoved", {
--   group = augroup("IncSearchHighlighting"),
--   callback = function()
--     hl_search()
--   end,
-- })
--
-- autocmd("InsertEnter", {
--   group = augroup("IncSearchHighlighting"),
--   callback = function()
--     stop_hl()
--   end,
-- })
--
-- autocmd("OptionSet", {
--   group = augroup("IncSearchHighlighting"),
--   callback = function()
--     vim.schedule(function()
--       vim.cmd.redrawstatus()
--     end)
--   end,
-- })
--
-- autocmd("RecordingEnter", {
--   group = augroup("IncSearchHighlighting"),
--   callback = function()
--     vim.o.hlsearch = false
--   end,
-- })
--

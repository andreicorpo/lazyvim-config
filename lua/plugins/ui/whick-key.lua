-- local border_thin = { "▔", "▕", "▁", "▏", "🭽", "🭾", "🭿", "🭼" }
return {
  { -- Useful plugin to show you pending keybinds.
    "folke/which-key.nvim",
    event = "VimEnter", -- Sets the loading event to 'VimEnter'
    opts = {
      preset = "helix",
      win = {
        padding = { 1, 4 },
        row = -2,
        col = -2,
        title = false,
        border = { " ", " ", " ", " ", "▁", "▁", "▁", " " },
        wo = {
          winblend = CorpoVim.ui.winblend,
        },
      },
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = true,
      },

      -- Document existing key chains
      spec = {
        { "<leader>a", group = "ai" },
        { "<leader>F", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>s", group = "search" },
        { "<leader>w", desc = "save" },
        { "<leader>q", desc = "quit" },
        { "<leader>l", group = "code: lsp" },
        { "<leader>b", group = "buffer" },
        { "<leader>.", icon = "󱡁" },
        { "<leader>h", icon = "󱡁" },
        { "<leader>p", icon = "" },
        { "<leader>w", icon = "󰆓" },
        { "<leader>N", icon = "" },
        { "<leader>n", icon = "󱥁" },
        { "<leader>u", icon = "" },
        { "<leader><leader>", icon = "" },
        { "<leader>&", hidden = true },
        { "<leader>(", hidden = true },
        { "<leader>{", hidden = true },
        { "<leader>[", hidden = true },
        { "<leader>=", hidden = true },
        { "<leader>-", hidden = true },
        { "<leader>+", hidden = true },
        { "<leader>]", hidden = true },
        { "<leader>}", hidden = true },
        { "<leader>)", hidden = true },
      },
    },
  },
  ui,
}


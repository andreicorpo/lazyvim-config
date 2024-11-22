return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-emoji",
    {
      "zbirenbaum/copilot-cmp",
      enabled = false,
    },
  },
  opts = function(_, opts)
    opts.window = {
      completion = {
        border = { "▔", "▔", "▔", " ", " ", " ", " ", " " },
        winblend = CorpoVim.ui.winblend,
        side_padding = 1,
      },
      documentation = {
        border = { "▔", "▔", "▔", " ", " ", " ", " ", " " },
        winblend = CorpoVim.ui.winblend,
        side_padding = 1,
        max_width = 50,
        winhighlight = "Normal:NormalFloat",
      },
    }
    opts.experimental = {
      ghost_text = true,
    }
  end,
}

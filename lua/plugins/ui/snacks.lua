local get_picker = function(picker, opts)
  local border_top = { "▔", " ", " ", " ", "▔", "▔", " ", " " }

  opts = vim.tbl_deep_extend(
    "force",
    require("telescope.themes").get_ivy({
      preview_title = false,
      layout_config = {
        prompt_position = "top",
      },
      borderchars = {
        prompt = border_top,
        results = border_top,
        preview = border_top,
      },
    }),
    opts or {}
  )

  local project_files_opts = vim.tbl_deep_extend("force", opts, {
    previewer = false,
  })

  local is_git_repo = vim.fn.system("git rev-parse --is-inside-work-tree"):match("true")
  local files_picker = is_git_repo and "git_files" or "find_files"

  return LazyVim.pick(picker or files_picker, picker and opts or project_files_opts)
end

return {
  {
    "folke/snacks.nvim",
    priority = 2000,
    lazy = false,
    opts = {
      statuscolumn = {
        enabled = true,
        left = { "mark", "sign" }, -- priority of signs on the left (high to low)
        right = { "fold", "git" }, -- priority of signs on the right (high to low)
        folds = {
          open = true, -- show open fold icons
          git_hl = true, -- use Git Signs hl for fold icons
        },
        git = {
          -- patterns to match Git signs
          patterns = { "GitSign", "MiniDiffSign" },
        },
        refresh = 50,
      },
      dashboard = {
        preset = {
          header = [[
                                                                                                                                
                                                                   ████ ██████           █████      ██                 btw
                                                                  ███████████             █████                            
                                                                  █████████ ███████████████████ ███   ███████████  
                                                                 █████████  ███    █████████████ █████ ██████████████  
                                                                █████████ ██████████ █████████ █████ █████ ████ █████  
                                                              ███████████ ███    ███ █████████ █████ █████ ████ █████ 
                                                             ██████  █████████████████████ ████ █████ █████ ████ ██████
]],
          ---@type snacks.dashboard.Item[]
          keys = {
            -- { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            {
              icon = " ",
              key = "f",
              desc = "files: find",
              action = get_picker(),
            },
            { icon = " ", key = "n", desc = "files: new", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "search: text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "files: recent", action = get_picker("oldfiles") },
            {
              icon = " ",
              key = "c",
              desc = "nvim: config",
              action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            -- { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "x", desc = "lazy: extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "quit", action = ":qa" },
          },
        },
        sections = {
          { section = "header", padding = 5, align = "center", enabled = vim.o.columns > 200 },
          { section = "keys", gap = 1 },
          {
            pane = 2,
            icon = " ",
            title = "Recent Files",
            section = "recent_files",
            label = "test",
            limit = 5,
            cwd = true,
            indent = 2,
            padding = vim.o.columns > 200 and { 1, 14 } or { 1, 3 },
          },
          {
            pane = 2,
            icon = " ",
            title = "Projects",
            section = "projects",
            indent = 2,
            padding = 1,
            height = 7,
            limit = 5,
          },
          { section = "startup", pane = 2 },
        },
      },
    },
    keys = {
      {
        "<leader>nh",
        function()
          Snacks.notifier.show_history()
        end,
        desc = "notifications: history",
      },
    },
  },
}

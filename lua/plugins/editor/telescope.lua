local border_top = { "▔", " ", " ", " ", "▔", "▔", " ", " " }
local M = {}

-- ---@param replacements? Replacements The replacements for border characters
-- local function get_border(replacements)
--   return Corpo.config.get_border({ order = "edges_first", style = "thin" }, replacements)
-- end

-- local borderchars = Corpo.config.borders.chars.thin

M.plugin = {
  "nvim-telescope/telescope.nvim",
  opts = function()
    local actions = require("telescope.actions")

    local open_with_trouble = function(...)
      return require("trouble.sources.telescope").open(...)
    end

    local function find_command()
      if 1 == vim.fn.executable("rg") then
        return { "rg", "--files", "--color", "never", "-g", "!.git" }
      elseif 1 == vim.fn.executable("fd") then
        return { "fd", "--type", "f", "--color", "never", "-E", ".git" }
      elseif 1 == vim.fn.executable("fdfind") then
        return { "fdfind", "--type", "f", "--color", "never", "-E", ".git" }
      elseif 1 == vim.fn.executable("find") and vim.fn.has("win32") == 0 then
        return { "find", ".", "-type", "f" }
      elseif 1 == vim.fn.executable("where") then
        return { "where", "/r", ".", "*" }
      end
    end

    return {
      defaults = {
        winblend = CorpoVim.ui.winblend,
        borderchars = {
          prompt = border_top,
          results = { " " },
          preview = { " " },
        },
        prompt_prefix = " ",
        selection_caret = " ",

        -- open files in the first window that is an actual file.
        -- use the current window if no other window is available.
        get_selection_window = function()
          local wins = vim.api.nvim_list_wins()
          table.insert(wins, 1, vim.api.nvim_get_current_win())
          for _, win in ipairs(wins) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.bo[buf].buftype == "" then
              return win
            end
          end
          return 0
        end,

        prompt_title = false,
        results_title = false,
        preview_title = false,
        dynamic_preview_title = true,
        -- path_display = { "smart" },
        layout_strategy = "bottom_pane",
        sorting_strategy = "ascending",
        layout_config = {
          prompt_position = "top",
          width = 0.8,
          cursor = {
            width = 0.5,
          },
          height = 25,
        },
        mappings = {
          i = {
            ["<c-t>"] = open_with_trouble,
            ["<a-t>"] = open_with_trouble,
            ["<esc>"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-h>"] = nil,
            ["<C-l>"] = nil,
            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            ["<C-enter>"] = "to_fuzzy_refine",
          },
        },
      },

      pickers = {
        find_files = {
          results_title = false,
          find_command = find_command,
          hidden = true,
        },

        git_files = {
          git_command = { "git", "ls-files", "--exclude-standard", "--cached", "--others" },
          results_title = false,
        },

        buffers = {
          prompt_title = false,
          results_title = false,
          mappings = {
            n = {
              ["<C-b>"] = require("telescope.actions").close,
            },
          },
        },
      },

      extensions = {},
    }
  end,
  keys = function()
    local themes = require("telescope.themes")
    local builtin = require("telescope.builtin")
    local project_files_opts = themes.get_ivy({
      previewer = false,
      layout_config = {
        prompt_position = "top",
      },
      borderchars = {
        prompt = border_top,
        results = border_top,
      },
    })
    local is_git_repo = vim.fn.system("git rev-parse --is-inside-work-tree"):match("true")

    return {
      {
        "<leader>f",
        LazyVim.pick(is_git_repo and "git_files" or "find_files", project_files_opts),
        desc = "find: files",
      },
      {
        "<C-b>",
        "<cmd>Telescope buffers sort_mru=true sort_lastused=true preview_title=false initial_mode=normal ignore_current_buffer=true<cr>",
        desc = "find: buffers",
      },
      {
        "<leader>sa",
        "<cmd>Telescope autocommands<cr>",
        desc = "find: auto commands",
      },
      {
        "<leader>sb",
        "<cmd>Telescope current_buffer_fuzzy_find<cr>",
        desc = "find: current buffer",
      },

      {
        "<leader>s:",
        "<cmd>Telescope commands<cr>",
        desc = "find: commands",
      },
      {
        "<leader>sd",
        "<cmd>Telescope diagnostics bufnr=0<cr>",
        desc = "diagnostics: document",
      },
      {
        "<leader>sD",
        "<cmd>Telescope diagnostics<cr>",
        desc = "diagnostics: workspace",
      },

      {
        "<leader>sh",
        "<cmd>Telescope help_tags<cr>",
        desc = "find: help",
      },
      {
        "<leader>sH",
        "<cmd>Telescope highlights<cr>",
        desc = "find: highlight groups",
      },

      {
        "<leader>sk",
        "<cmd>Telescope keymaps<cr>",
        desc = "find: keymaps",
      },

      {
        "<leader>sR",
        "<cmd>Telescope resume<cr>",
        desc = "tele: resume",
      },

      {
        -- TODO: find better keymap or change todos keymap
        "<leader>t",
        function()
          local search_term = vim.fn.input("search: ")

          builtin.grep_string({
            search = search_term,
            use_regex = true,
            layout_config = {
              anchor = "S",
              height = function(_, _, lines)
                return math.floor(lines * (3 / 5))
              end,
            },
          })
        end,
        { desc = "find: text" },
      },

      {
        "<leader><c-s>",
        function()
          builtin.spell_suggest(themes.get_cursor({
            prompt_title = false,
            prompt_prefix = "Spell Suggest: ",
            layout_config = {
              width = 60,
              height = 10,
            },
          }))
        end,
        desc = "find: spelling",
      },
      { "<leader>sc", LazyVim.pick("grep_string", { word_match = "-w" }), desc = "Word (Root Dir)" },
      { "<leader>sC", LazyVim.pick("grep_string", { root = false, word_match = "-w" }), desc = "Word (cwd)" },
      { "<leader>sc", LazyVim.pick("grep_string"), mode = "v", desc = "Selection (Root Dir)" },
      { "<leader>sC", LazyVim.pick("grep_string", { root = false }), mode = "v", desc = "Selection (cwd)" },
    }
  end,
}

return M.plugin

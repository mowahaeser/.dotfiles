-- Telescope setup
local actions = require "telescope.actions"
local action_layout = require "telescope.actions.layout"

require("telescope").setup {
  defaults = {
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    multi_icon = "<>",

    winblend = 0,

    layout_strategy = "horizontal",
    layout_config = {
      width = 0.95,
      height = 0.85,
      -- preview_cutoff = 120,
      prompt_position = "top",

      horizontal = {
        preview_width = function(_, cols, _)
          if cols > 200 then
            return math.floor(cols * 0.4)
          else
            return math.floor(cols * 0.6)
          end
        end,
      },

      vertical = {
        width = 0.9,
        height = 0.95,
        preview_height = 0.5,
      },

      flex = {
        horizontal = {
          preview_width = 0.9,
        },
      },
    },

    selection_strategy = "reset",
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
    color_devicons = true,

    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-s>"] = actions.select_horizontal,
        ["<C-n>"] = "move_selection_next",

        ["<C-e>"] = actions.results_scrolling_down,
        ["<C-y>"] = actions.results_scrolling_up,
        -- ["<C-y>"] = set_prompt_to_entry_value,

        -- These are new :)
        ["<M-p>"] = action_layout.toggle_preview,
        ["<M-m>"] = action_layout.toggle_mirror,
        -- ["<M-p>"] = action_layout.toggle_prompt_position,

        -- ["<M-m>"] = actions.master_stack,

        -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        -- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        -- This is nicer when used with smart-history plugin.
        ["<C-k>"] = actions.cycle_history_next,
        ["<C-j>"] = actions.cycle_history_prev,
        ["<c-g>s"] = actions.select_all,
        ["<c-g>a"] = actions.add_selection,

        ["<c-space>"] = function(prompt_bufnr)
          local opts = {
            callback = actions.toggle_selection,
            loop_callback = actions.send_selected_to_qflist,
          }
          require("telescope").extensions.hop._hop_loop(prompt_bufnr, opts)
        end,

        ["<C-w>"] = function()
          vim.api.nvim_input "<c-s-w>"
        end,
      },

      n = {
        ["<C-e>"] = actions.results_scrolling_down,
        ["<C-y>"] = actions.results_scrolling_up,
      },
    },

    -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    -- file_ignore_patterns = nil,

    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

    history = {
      path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
      limit = 100,
    },
  },

  pickers = {
    fd = {
      mappings = {
        n = {
          ["kj"] = "close",
        },
      },
    },

    git_branches = {
      mappings = {
        i = {
          ["<C-a>"] = false,
        },
      },
    },
  },

  extensions = {
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
    },

    fzf_writer = {
      use_highlighter = false,
      minimum_grep_characters = 6,
    },

    hop = {
      -- keys define your hop keys in order; defaults to roughly lower- and uppercased home row
      keys = { "a", "s", "d", "f", "g", "h", "j", "k", "l", ";" }, -- ... and more

      -- Highlight groups to link to signs and lines; the below configuration refers to demo
      -- sign_hl typically only defines foreground to possibly be combined with line_hl
      sign_hl = { "WarningMsg", "Title" },

      -- optional, typically a table of two highlight groups that are alternated between
      line_hl = { "CursorLine", "Normal" },

      -- options specific to `hop_loop`
      -- true temporarily disables Telescope selection highlighting
      clear_selection_hl = false,
      -- highlight hopped to entry with telescope selection highlight
      -- note: mutually exclusive with `clear_selection_hl`
      trace_entry = true,
      -- jump to entry where hoop loop was started from
      reset_selection = true,
    },

    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      },
    },

    -- frecency = {
    --   workspaces = {
    --     ["conf"] = "/home/tj/.config/nvim/",
    --     ["nvim"] = "/home/tj/build/neovim",
    --   },
    -- },
  },
}

-- Telescope mappings
local map_options = {
    noremap = true,
    silent = true,
}

-- TODO: maybe create a function for managing this mappings.
local map_handler = function(key, f, options, buff)
end

-- Those use buff (Complete stuff)


-- Files
vim.api.nvim_set_keymap("n", "<space>ft", "git_files", map_options)
-- vim.api.nvim_set_keymap("n", "<space>fg", "live_grep")
vim.api.nvim_set_keymap("n", "<space>fg", "multi_rg", map_options)
vim.api.nvim_set_keymap("n", "<space>fo", "oldfiles", map_options)
vim.api.nvim_set_keymap("n", "<space>fd", "fd", map_options)
vim.api.nvim_set_keymap("n", "<space>fs", "fs", map_options)
vim.api.nvim_set_keymap("n", "<space>pp", "project_search", map_options)
vim.api.nvim_set_keymap("n", "<space>fv", "find_nvim_source", map_options)
vim.api.nvim_set_keymap("n", "<space>fe", "file_browser", map_options)
vim.api.nvim_set_keymap("n", "<space>fz", "search_only_certain_files", map_options)

-- Sourcegraph
vim.api.nvim_set_keymap("n", "<space>sf", "sourcegraph_find", map_options)
vim.api.nvim_set_keymap("n", "<space>saf", "sourcegraph_about_find", map_options)
vim.api.nvim_set_keymap("n", "<space>sag", "sourcegraph_about_grep", map_options)
-- vim.api.nvim_set_keymap("n", '<space>fz', 'sourcegraph_tips')

-- Git
vim.api.nvim_set_keymap("n", "<space>gs", "git_status", map_options)
vim.api.nvim_set_keymap("n", "<space>gc", "git_commits", map_options)

-- Nvim
vim.api.nvim_set_keymap("n", "<space>fb", "buffers", map_options)
vim.api.nvim_set_keymap("n", "<space>fp", "my_plugins", map_options)
vim.api.nvim_set_keymap("n", "<space>fa", "installed_plugins", map_options)
vim.api.nvim_set_keymap("n", "<space>fi", "search_all_files", map_options)
vim.api.nvim_set_keymap("n", "<space>ff", "curbuf", map_options)
vim.api.nvim_set_keymap("n", "<space>fh", "help_tags", map_options)
vim.api.nvim_set_keymap("n", "<space>bo", "vim_options", map_options)
vim.api.nvim_set_keymap("n", "<space>gp", "grep_prompt", map_options)
vim.api.nvim_set_keymap("n", "<space>wt", "treesitter", map_options)

-- Telescope Meta
vim.api.nvim_set_keymap("n", "<space>fB", "builtin", map_options)


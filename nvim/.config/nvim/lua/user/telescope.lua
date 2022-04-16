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

        ["<c-leader>"] = function(prompt_bufnr)
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
    --   workleaders = {
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

-- Files
-- vim.api.nvim_set_keymap("n", "<leader>fg", "live_grep")
vim.api.nvim_set_keymap("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", map_options)

vim.api.nvim_set_keymap("n", "<leader>fd", "<cmd>Telescope fd<cr>", map_options)
vim.api.nvim_set_keymap("n", "<leader>fs", "<cmd>Telescope fs<cr>", map_options)
vim.api.nvim_set_keymap("n", "<leader>pp", "<cmd>Telescope project_search<cr>", map_options)
vim.api.nvim_set_keymap("n", "<leader>fv", "<cmd>Telescope find_nvim_source<cr>", map_options)
vim.api.nvim_set_keymap("n", "<leader>fe", "<cmd>Telescope file_browser<cr>", map_options)
vim.api.nvim_set_keymap("n", "<leader>fz", "<cmd>Telescope search_only_certain_files<cr>", map_options)

-- Git
vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>", map_options)
vim.api.nvim_set_keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", map_options)
vim.api.nvim_set_keymap("n", "<leader>ft", "<cmd>Telescope git_files<cr>", map_options)
-- Nvim
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", map_options)
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", map_options)
vim.api.nvim_set_keymap("n", "<leader>bo", "<cmd>Telescope vim_options<cr>", map_options)

vim.api.nvim_set_keymap("n", "<leader>fB", "<cmd>Telescope builtin<cr>", map_options)


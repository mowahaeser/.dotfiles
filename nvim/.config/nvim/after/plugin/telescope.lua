if not pcall(require, "telescope") then
    return
end

-- :h telescope.actions
-- local actions = require "telescope.actions"

-- :h telescope.actions.layout
-- local action_layout = require "telescope.actions.layout"

vim.keymap.set("n", "<leader>en", require("telescope.builtin").find_files, {})
vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<CR>", {})
vim.keymap.set("n", "<leader>d", require("telescope.builtin").diagnostics, {})

require("telescope").setup {
    defaults = {
        layout_strategy = "horizontal",
        layout_config = {
            width = 0.90,
            height = 0.80,
            prompt_position = "top",

            horizontal = {
                -- :h telescope.resolve.resolve_width()
                preview_width = function(_, max_columns, _)
                    if max_columns < 200 then
                        return math.floor(max_columns * 0.7)
                    else
                        return math.floor(max_columns * 0.8)
                    end
                end,
            }
        },
    },
    pickers = {},
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                -- even more opts
            },
        },

        file_browser = {
            theme = "ivy",
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    -- insert mode mappings
                },
                ["n"] = {
                    -- normal mode mappings
                },
            },
        },
    },
}

require("telescope").load_extension "fzf"
require("telescope").load_extension "ui-select"
require("telescope").load_extension "file_browser"

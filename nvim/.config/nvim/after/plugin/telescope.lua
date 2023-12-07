if not pcall(require, "telescope") then
    return
end

local actions = require "telescope.actions"
local action_layout = require "telescope.actions.layout"

vim.keymap.set("n", "<leader>en", require("telescope.builtin").find_files, {})
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, {})
vim.keymap.set("n", "<space><space>t", require("telescope.builtin").diagnostics, {})

require("telescope").setup({
    defaults = {
        prompt_position = "top"
    },
    pickers = {},
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                -- even more opts
            },
        },

    },
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("ui-select")

local map = vim.api.nvim_set_keymap

local opts = {
    noremap = true,
    silent = true
}

map("n", "<c-j>", "<c-w>j", opts)
map("n", "<c-k>", "<c-w>k", opts)
map("n", "<c-l>", "<c-w>l", opts)
map("n", "<c-h>", "<c-w>h", opts)

map('n', '<C-Up>',    ':resize -2<CR>', opts)
map('n', '<C-Down>',  ':resize +2<CR>', opts)
map('n', '<C-Left>',  ':vertical resize -2<CR>', opts)
map('n', '<C-Right>', ':vertical resize +2<CR>', opts)

map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

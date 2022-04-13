local status_ok = pcall(require, "lspconfig")
if not status_ok then
    return
end

local map_options = {
    noremap = true,
    silent = true,
}

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'tf', '<cmd>Telescope find_files<CR>', map_options)
end


local servers = { "gopls", "tsserver", "pyright", "bashls", "dockerls", "jsonls", "html", "sumneko_lua" }

for _, lsp in pairs(servers) do
    require("lspconfig")[lsp].setup {
        on_attach = on_attach,
    }
end

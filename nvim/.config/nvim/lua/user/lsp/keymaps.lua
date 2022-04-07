local status_ok, nvim_lsp = pcall(require, "lspconfig")
if not status_ok then
    return
end

-- Holds all my shortcuts for LSP
-- use ominifunc?
local on_attach = function() 
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0})
    vim.keymap.set("n", "<leader>dg", "<cmd>Telescope diagnostics<cr>", {buffer=0})
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer=0})
end

nvim_lsp.gopls.setup{
    on_attach = on_attach
}

nvim_lsp.tsserver.setup{
    on_attach = on_attach,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" }
}

nvim_lsp.pyright.setup {
    on_attach = on_attach
}

nvim_lsp.bashls.setup {
    on_attach = on_attach
}

nvim_lsp.dockerls.setup{
    on_atatch = on_attach
}

-- Add capabilities
nvim_lsp.jsonls.setup {
    on_attach = on_attach
}

nvim_lsp.html.setup {
    on_attach = on_attach
}

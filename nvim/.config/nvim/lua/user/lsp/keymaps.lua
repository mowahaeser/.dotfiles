local status_ok, nvim_lsp = pcall(require, "lspconfig")
if not status_ok then
    return
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Holds all my shortcuts for LSP
-- use ominifunc?
nvim_lsp.gopls.setup{
    capabilities = capabilities,
    on_attach = function()
        -- TODO: set keymap for quickfix window
        -- new window with quickfix list :cope {height}
        -- cll[ose] closes quickfix window
        -- to jump to a file with error: CTRL-W <Enter>
        -- vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
      vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
      vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer=0})
      vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer=0})
      vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})
      vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer=0})
   end
}


--[[
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

nvim_lsp.jsonls.setup {
    on_attach = on_attach
}

nvim_lsp.html.setup {
    on_attach = on_attach
}

nvim_lsp.sumneko_lua.setup {
    on_attach = on_attach
}
]]--


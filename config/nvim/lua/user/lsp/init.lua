local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

-- Make sure it's being indexed
-- require("user.lsp.lsp-installer")
require("user.lsp.keymaps")

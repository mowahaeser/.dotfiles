local status_ok, packer = pcall(require, "packer")

if not status_ok then
    return
end

packer.startup(function(use)
    use "savq/melange"

    use "nvim-telescope/telescope.nvim"

    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"

    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lsp-document-symbol"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"
end)


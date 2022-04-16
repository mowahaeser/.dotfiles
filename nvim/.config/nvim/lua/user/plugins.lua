local status_ok, packer = pcall(require, "packer")

if not status_ok then
    return
end

packer.startup(function(use)
    use "wbthomason/packer.nvim"
    -- use "savq/melange"
    -- use "cocopon/iceberg.vim"
    use "morhetz/gruvbox"

    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim"

    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"

    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lsp-document-symbol"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"

    use "ray-x/lsp_signature.nvim"

    use "vim-airline/vim-airline"
    use "vim-airline/vim-airline-themes"
end)


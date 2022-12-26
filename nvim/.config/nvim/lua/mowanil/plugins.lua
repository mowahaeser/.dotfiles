local status_ok, packer = pcall(require, "packer")

if not status_ok then
    return
end

packer.startup(function(use)
    use "wbthomason/packer.nvim"

    -- use "katawful/kat.nvim"
    use "sainnhe/gruvbox-material"

    use "ThePrimeagen/harpoon"
    use "mbbill/undotree"

    use "folke/zen-mode.nvim"
    use "folke/twilight.nvim"

    use "nvim-treesitter/nvim-treesitter"
    use "norcalli/nvim-colorizer.lua"
    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim"

    use "neovim/nvim-lspconfig"
    use "williamboman/mason-lspconfig.nvim"
    use "williamboman/mason.nvim"

    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/cmp-nvim-lsp-document-symbol"

    use "jose-elias-alvarez/null-ls.nvim"

    use "L3MON4D3/LuaSnip"

    use "ray-x/lsp_signature.nvim"


    use "vim-airline/vim-airline"
    use "vim-airline/vim-airline-themes"
end)

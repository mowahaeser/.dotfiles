-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

return packer.startup(function(use)
    use "wbthomason/packer.nvim"

    use "nvim-telescope/telescope.nvim"
    use "nvim-treesitter/nvim-treesitter"
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use "nvim-telescope/telescope-fzf-native.nvim"

    use "neovim/nvim-lspconfig"

    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-nvim-lsp-document-symbol"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"

    use "saadparwaiz1/cmp_luasnip"
    use "L3MON4D3/LuaSnip"

    use "vim-airline/vim-airline"
    use "vim-airline/vim-airline-themes"

    use "rcarriga/nvim-notify"
	use "folke/tokyonight.nvim"
end)

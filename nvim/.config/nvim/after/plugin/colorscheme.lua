local config = {
    colorscheme = "kat.nvim",
    transparent = true,
}

local enable_transparent_mode = function()
    vim.cmd("au ColorScheme * hi Normal ctermbg=none guibg=none")
    vim.cmd("au ColorScheme * hi SignColumn ctermbg=none guibg=none")
    vim.cmd("au ColorScheme * hi NormalNC ctermbg=none guibg=none")
    vim.cmd("au ColorScheme * hi MsgArea ctermbg=none guibg=none")
    vim.cmd("au ColorScheme * hi TelescopeBorder ctermbg=none guibg=none")
    vim.cmd("au ColorScheme * hi NvimTreeNormal ctermbg=none guibg=none")
    vim.cmd("au ColorScheme * hi EndOfBuffer ctermbg=none guibg=none")
    vim.cmd("highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE")
    vim.cmd("highlight LineNr guibg=NONE")
    vim.cmd("let &fcs='eob: '")
end

if config.transparent then
    enable_transparent_mode()
end

if not pcall(vim.cmd, "colorscheme " .. config.colorscheme) then
    vim.notify("colorscheme " .. config.colorscheme .. " not found!")
    return
end

if not pcall(require, "nvim-colorizer") then
    return
end

require("colorizer").setup()

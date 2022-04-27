local _COLORSCHEME_ = "ayu"
local _TRANSPARENT_ = true

local enable_transparent_mode = function()
    vim.cmd("au ColorScheme * hi Normal ctermbg=none guibg=none")
    vim.cmd("au ColorScheme * hi SignColumn ctermbg=none guibg=none")
    vim.cmd("au ColorScheme * hi NormalNC ctermbg=none guibg=none")
    vim.cmd("au ColorScheme * hi MsgArea ctermbg=none guibg=none")
    vim.cmd("au ColorScheme * hi TelescopeBorder ctermbg=none guibg=none")
    vim.cmd("au ColorScheme * hi NvimTreeNormal ctermbg=none guibg=none")
    vim.cmd("au ColorScheme * hi EndOfBuffer ctermbg=none guibg=none")
    vim.cmd("highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE")
    vim.cmd("let &fcs='eob: '")
end

if _TRANSPARENT_ then
    enable_transparent_mode()
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. _COLORSCHEME_)
if not status_ok then
	vim.notify("colorscheme " .. _COLORSCHEME_ .. " not found!")
	return
end


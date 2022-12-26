vim.g.mapleader = " "

if require "mowanil.first_load" () then
    return
end

require "mowanil.lsp-setup"
require "mowanil.plugins"
require "mowanil.mappings"

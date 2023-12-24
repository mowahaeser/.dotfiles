vim.g.mapleader = " "

if require "mowanil.first_load" () then
    return
end

require "mowanil.lsp"
require "mowanil.plugins"
require "mowanil.mappings"

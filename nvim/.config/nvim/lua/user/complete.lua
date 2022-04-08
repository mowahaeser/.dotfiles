local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
    return
end

cmp.setup{
    mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-y>"] = cmp.config.disabled,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
        { name = 'buffer', keyword_length = 3 },
    },
    experimental = {
        ghost_text = true,
        native_menu = false,
    }
}

-- highlight menu?

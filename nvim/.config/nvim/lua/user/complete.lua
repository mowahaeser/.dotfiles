local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
    return
end

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-y>"] = cmp.config.disabled,
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- For luasnip users.
        { name = "nvim_lsp_document_symbol" },
        -- { name = "ultisnips" }, -- For ultisnips users.
        -- { name = "snippy" }, -- For snippy users.
        -- { name = "vsnip" }, -- For vsnip users.
        { name = "path" },
        { name = "buffer", keyword_length = 3 },
    },
    experimental = {
        ghost_text = true,
        native_menu = false,
    },
    snippet = {
        expand = function (args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
})

-- native_menu option must be disable for this to work
cmp.setup.cmdline("/", {
    sources = {
        { name = "buffer" }
    }
})

cmp.setup.cmdline(":", {
    sources = cmp.config.sources({
        { name = "path" }
        }, {
        { name = "cmdline" }
    })
})


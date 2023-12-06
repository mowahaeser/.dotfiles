local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
    return
end

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-y>"] = cmp.config.disabled,
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
    }),
    sources = {
        { name = "codeium" },
        { name = "path" },
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "luasnip" },

        {
            name = "buffer",
            keyword_length = 5,
        },
    },
    experimental = {
        ghost_text = true,
    },
    window = {
        completion = cmp.config.window.bordered(),
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
})

cmp.setup.cmdline("/", {
    sources = cmp.config.sources({
        { name = "nvim_lsp_document_symbol" },
    }, {
        { name = "buffer" }
    })
})

cmp.setup.cmdline(":", {
    sources = cmp.config.sources({
        { name = "path" }
    }, {
        { name = "cmdline" }
    })
})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
    vim.diagnostic.open_float()

    require "lsp_signature".on_attach({
        bind = true,
        hint_prefix = "🦀 ",
        handler_opts = {
            border = "rounded"
        }
    }, bufnr)

    local buf_set_keymap = function(keys, func, desc)
        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end

    buf_set_keymap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
    buf_set_keymap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
    buf_set_keymap("gd", vim.lsp.buf.definition, "[G]o to [D]efinition")
    buf_set_keymap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
    buf_set_keymap("K", vim.lsp.buf.hover, "Hover Documentation")
    buf_set_keymap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")
    buf_set_keymap("D", vim.lsp.buf.type_definition, "Type [D]efinition")
    buf_set_keymap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbol")
    buf_set_keymap("[d", vim.diagnostic.goto_next, "Goto Next Diagnostic")
    buf_set_keymap("]d", vim.diagnostic.goto_prev, "Goto Prev Diagnostic")

    buf_set_keymap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    buf_set_keymap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    buf_set_keymap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [R]emove Folder')

    if client.server_capabilities.documentFormattingProvider then
        vim.cmd([[
			augroup formatting
				autocmd! * <buffer>
				autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
			augroup END
		]])
    end

    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.document_highlight then
        vim.cmd([[
			augroup lsp_document_highlight
				autocmd! * <buffer>
				autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
		]])
    end
end

require("neoconf").setup {}

require("mason").setup {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
}

require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "gopls", "tsserver", "volar" }
}

require("mason-lspconfig").setup_handlers {
    function(server_name)
        -- do not start lsp server if it's to be disabled
        if require("neoconf").get(server_name .. ".disable") then
            print(server_name .. "is disabled")
            return
        end

        require("lspconfig")[server_name].setup {
            on_attach = on_attach,
            capabilities = capabilities
        }
    end,

    -- override with custom settings
    ["emmet_language_server"] = function()
        require("lspconfig").emmet_language_server.setup {
            filetypes = { "php" },
            capabilities = capabilities,
            on_attach = on_attach,
        }
    end,
    ["cssls"] = function()
        require("lspconfig").cssls.setup {
            settings = {
                css = {
                    lint = {
                        unknownAtRules = "ignore",
                    },
                },
            },
            capabilities = capabilities,
            on_attach = on_attach,
        }
    end,
    ["lua_ls"] = function()
        require("lspconfig").lua_ls.setup {
            capablities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }

        }
    end,
    ["gopls"] = function()
        require("lspconfig").gopls.setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                gopls = {
                    gofumpt = true,
                },
            },
            flags = {
                debounce_text_changes = 150,
            },
        }
    end
}

local null_ls = require("null-ls")

local sources = {
    null_ls.builtins.formatting.prettierd,
    -- null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.diagnostics.stylint,
    -- null_ls.builtins.completion.luasnip,
}

null_ls.setup {
    on_attach = on_attach,
    sources = sources
}

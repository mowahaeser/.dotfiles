local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
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
    buf_set_keymap("<leader>ds", require('telescope.builtin').lsp_document_symbols, "[D]ocument [S]ymbol")
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
				autocmd BufWritePre <buffer> lua OrganizeImports(1000)
			augroup END
		]]     )
    end

    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.document_highlight then
        vim.cmd([[
			augroup lsp_document_highlight
				autocmd! * <buffer>
				autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
				autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
		]]     )
    end
end

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local lsp_servers = { "sumneko_lua", "gopls", "tsserver" }

require("mason-lspconfig").setup({
    ensure_installed = lsp_servers
})

for _, server in ipairs(lsp_servers) do
    require("lspconfig")[server].setup({
        capabilities = capabilities,
        on_attach = on_attach,
    })
end

lspconfig.gopls.setup({
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
})

function OrganizeImports(timeoutms)
    --[[ local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeoutms)
    for _, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
            if r.edit then
                vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
            else
                vim.lsp.buf.execute_command(r.command)
            end
        end
    end
    ]]
    --
end

local use_null = true

if use_null then
    require("null-ls").setup({
        sources = {
            require("null-ls").builtins.formatting.prettierd,
        }
    })
end

local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local optes = {buffer = event.buf}
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>td", function() vim.lsp.buf.type_definition() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>lca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
        -- vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end, opts)
    end,
})

local cmp = require('cmp')

cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
    },
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
})


require('lspconfig').lua_ls.setup({})
--require('lspconfig').rust_analyzer.setup({})
require("lsp-format").setup {}
require("pubspec-assist").setup()

vim.diagnostic.config({
    virtual_text = true
})

require("flutter-tools").setup {
    ui = {
        border = "rounded",
    },
    decorations = {
        statusline = {
            app_version = true,
            device = true,
        }
    },
    -- debugger = {
    --     enabled = true,
    --     run_via_dap = true,
    --     regiseter_configurations = function(_)
    --         require("dap").configurations.dart = { {
    --             name = "KUBIK",
    --             request = "launch",
    --             type = "dart",
    --         }
    --         }
    --         require("dap.ext.vscode").load_launchjs()
    --     end
    -- },
    widget_guides = {
        enabled = true,
    },
    outline = {
        auto_open = true,
        open_cmd = "set splitright | 50vnew"
    },
    lsp = {
        on_attach = my_on_attach,
        color = {
            enabled = true,
            virtual_text = true,
        }
    },
}

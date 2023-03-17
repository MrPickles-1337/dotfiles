local lsp = require('lsp-zero')
require("lsp-format").setup {}

lsp.preset('recommended')

lsp.ensure_installed({
    'rust_analyzer',
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})
local my_on_attach = function(client, buffer)
    require("lsp-format").on_attach(client)
    local opts = { buffer = buffer, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>lca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>lrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>lrn", function() vim.lsp.buf.rename() end, opts)
    -- vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>lf", function() vim.lsp.buf.format() end, opts)
end


require("neodev").setup {
    library = { plugin = { "nvim-dap-ui" }, types = true }
}

lsp.on_attach(my_on_attach)
require("lspconfig").gopls.setup { on_attach = my_on_attach }

lsp.nvim_workspace()
lsp.setup()

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
    debugger = {
        enabled = true,
        run_via_dap = true,
        regiseter_configurations = function(_)
            require("dap").configurations.dart = { {
                name = "KUBIK",
                request = "launch",
                type = "dart",
            }
            }
            require("dap.ext.vscode").load_launchjs()
        end
    },
    widget_guides = {
        enabled = true,
    },
    outline = {
        auto_open = true
    },
    lsp = {
        on_attach = my_on_attach,
        color = {
            enabled = true,
            virtual_text = true,
        }
    },
}

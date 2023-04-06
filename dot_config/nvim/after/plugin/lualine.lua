require('lualine').setup {
    sections = {
        lualine_b = {
            {
                'filename',
                path = 1
            }
        },
        lualine_c = {
            'lsp_progress'
        }
    }
}

-- Add indentation guides even on blank lines

return {
    "lukas-reineke/indent-blankline.nvim",
    -- event = { "BufReadPre", "BufNewFile" },
    -- See `:help ibl`
    main = "ibl",
    opts = {
        indent = {
            char = "⁚", -- ┊
        },
        scope = {
            show_start       = false,
            show_end         = false,
            show_exact_scope = false,
        },
        exclude = {
            filetypes = {
                'NvimTree',
                'Trouble',
                'dashboard',
                'help',
                'neogitstatus',
                'packer',
                'startify',
            },
        },
    },
}


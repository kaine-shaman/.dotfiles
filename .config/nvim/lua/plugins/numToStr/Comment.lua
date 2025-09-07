return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
        -- import comment plugin safely
        local comment = require("Comment")

        -- enable comment
        comment.setup({
            -- for commenting tsx, jsx, svelte, html files
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        })

        local comment_api = require("Comment.api")
        local opts = { noremap = true, silent = true }
        vim.keymap.set('n', '<C-c>', comment_api.toggle.linewise.current, opts)
        vim.keymap.set('v', '<C-c>', "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

        -- - gc  - Comment toggle linewise
        -- - gcc - Comment toggle current line
        -- - gcA - Comment insert end of line
        -- - gco - Comment insert below
        -- - gcO - Comment insert above
        --
        -- - gb  - Comment toggle blockwise
        -- - gbc - Comment toggle current block
    end,
}


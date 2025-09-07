return {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
    },
    opts = {
        focus = true,
        modes = {
            lsp = {
                win = { position = "right" },
            },
        },
    },
    cmd = "Trouble",
    keys = {
        { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>",                            desc = "Workspace diagnostics" },
        { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",               desc = "Buffer diagnostics" },
        { "<leader>xs", "<cmd>Trouble symbols toggle<CR>",                                desc = "Symbols" },
        { "<leader>xS", "<cmd>Trouble lsp toggle<CR>",                                    desc = "LSP references/definitions/..." },
        { "<leader>xL", "<cmd>Trouble loclist toggle<CR>",                                desc = "Location list" },
        { "<leader>xq", "<cmd>Trouble quickfix toggle<CR>",                               desc = "Quickfix list" },
        { "<leader>xQ", "<cmd>Trouble qflist toggle<CR>",                                 desc = "Quickfix list" },
        { "<leader>xt", "<cmd>Trouble todo toggle<CR>",                                   desc = "TODOs" },
        { "<leader>xT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<CR>", desc = "Todo/Fix/Fixme" },
        {
            "[x",
            function()
                if require("trouble").is_open() then
                    require("trouble").prev({ skip_groups = true, jump = true })
                else
                    local ok, err = pcall(vim.cmd.cprev)
                    if not ok then
                        vim.notify(err, vim.log.levels.ERROR)
                    end
                end
            end,
            desc = "Previous Trouble/Quickfix Item",
        },
        {
            "]x",
            function()
                if require("trouble").is_open() then
                    require("trouble").next({ skip_groups = true, jump = true })
                else
                    local ok, err = pcall(vim.cmd.cnext)
                    if not ok then
                        vim.notify(err, vim.log.levels.ERROR)
                    end
                end
            end,
            desc = "Next Trouble/Quickfix Item",
        },
    },
}

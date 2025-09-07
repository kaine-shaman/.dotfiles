return {
    "rmagatti/auto-session",
    config = function()
        require("auto-session").setup({
            auto_save       = false,
            auto_restore    = false,
            suppressed_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop/" },
            pre_save_cmds   = { "Neotree close" },
            -- post_restore_cmds = { "Neotree filesystem show" },
        })

        vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

        local keymap = vim.keymap

        keymap.set("n", "<leader>wr", "<cmd>AutoSession restore<CR>", { desc = "[R]estore workspace for cwd" })
        keymap.set("n", "<leader>ws", "<cmd>AutoSession save<CR>"   , { desc = "[S]ave workspace for root dir" })
    end,
}

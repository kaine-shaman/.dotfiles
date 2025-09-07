return {
    "maxmx03/fluoromachine.nvim",

    lazy     = false,
    priority = 1000,

    config = function()
        require("fluoromachine").setup({
            glow        = false,
            transparent = true,

            -- theme = "fluoromachine",
            theme = "retrowave",
        })

        vim.cmd.colorscheme("fluoromachine")
    end,
}

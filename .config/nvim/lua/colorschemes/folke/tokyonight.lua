return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        -- style = "day",
        style = "moon",
        -- style = "night",
        -- style = "storm",
    },
    config = function()
        vim.cmd[[colorscheme tokyonight]]
    end,
}

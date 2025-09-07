return {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    -- you can set set configuration options here
    config = function()
        vim.g.zenbones_darken_comments = 45

        -- vim.cmd.colorscheme('duckbones')
        -- vim.cmd.colorscheme('forestbones')
        -- vim.cmd.colorscheme('kanagawabones')
        -- vim.cmd.colorscheme('neobones')
        -- vim.cmd.colorscheme('nordbones')
        -- vim.cmd.colorscheme('randombones')
        -- vim.cmd.colorscheme('rosebones')
        -- vim.cmd.colorscheme('seoulbones')
        vim.cmd.colorscheme("tokyobones")
        -- vim.cmd.colorscheme('vimbones')
        -- vim.cmd.colorscheme('zenbones')
        -- vim.cmd.colorscheme('zenburned')
        -- vim.cmd.colorscheme('zenwritten')
    end,
}

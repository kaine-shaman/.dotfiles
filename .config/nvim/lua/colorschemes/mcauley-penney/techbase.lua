return {
    "mcauley-penney/techbase.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        italic_comments = false,

        -- set to true to make the background, floating windows, statusline,
        -- signcolumn, foldcolumn, and tabline transparent
        transparent = true,

        -- Here, you can disable plugins. All plugins that techbase supports
        -- are enabled by default. You do not need to specify the ones you
        -- want to enable, only those you wish to disable. This table
        -- accepts key-pair values.
        plugin_support = {
            visual_whitespace = false,
        },

        -- You can enable *only* some plugins by using the "only" table
        -- inside of the "plugin_support" table. This table accepts strings.
        -- plugin_support = {
        --   only = { "visual_whitespace" }
        -- },

        -- allows you to override any highlight group for finer-grained control
        hl_overrides = {},
    },
    config = function()
        vim.cmd.colorscheme("techbase")
    end,
}

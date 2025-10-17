return {
    "luisiacc/gruvbox-baby",
    config = function()
        -- see :h attr-list
        vim.g.gruvbox_baby_background_color = "dark"
        vim.g.gruvbox_baby_comment_style    = "NONE"
        vim.g.gruvbox_baby_keyword_style    = "NONE"
        vim.g.gruvbox_baby_function_style   = "bold"

        -- Each highlight group must follow the structure:
        -- ColorGroup = {fg = "foreground color", bg = "background_color", style = "some_style(:h attr-list)"}
        -- See also :h highlight-guifg
        -- Example:
        -- vim.g.gruvbox_baby_highlights = { Normal = { fg = "#123123", bg = "NONE", style = "underline" } }
        -- vim.g.gruvbox_baby_highlights = { QuickFixLine = { bg = "#572E33" } }
        vim.g.gruvbox_baby_highlights = {
            QuickFixLine             = { bg = "#402225" },
            GitSignsCurrentLineBlame = { fg = "#83A598" },
            Visual                   = { bg = "#303030" },
            CursorLine               = { bg = "#301A1C" },
            CursorColumn             = { bg = "#301A1C" },
            Search                   = { bg = "#303030" },

        }

        -- Enable telescope theme
        -- vim.g.gruvbox_baby_telescope_theme = true

        -- Enable transparent mode
        vim.g.gruvbox_baby_transparent_mode = true

        vim.cmd([[colorscheme gruvbox-baby]])
    end,
}

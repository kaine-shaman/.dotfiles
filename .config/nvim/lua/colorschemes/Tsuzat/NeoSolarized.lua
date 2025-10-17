return {
    "Tsuzat/NeoSolarized.nvim",
    config = function()
        local NeoSolarized = require("NeoSolarized")

        NeoSolarized.setup({
            style = "dark", -- "dark" or "light"
            transparent = true, -- true/false; Enable this to disable setting the background color
            terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
            enable_italics = false, -- Italics for different hightlight groups (eg. Statement, Condition, Comment, Include, etc.)
            styles = {
                -- Style to be applied to different syntax groups
                comments = { italic = false },
                keywords = { italic = false },
                functions = { bold = true },
                variables = {},
                string = { italic = false },
                underline = true, -- true/false; for global underline
                undercurl = true, -- true/false; for global undercurl
            },
            -- Add specific hightlight groups
            -- on_highlights = function(highlights, colors)
            on_highlights = function()
                -- highlights.Include.fg = colors.red -- Using `red` foreground for Includes
            end,
        })

        -- Set colorscheme to NeoSolarized
        vim.cmd("colorscheme NeoSolarized")
    end,
}

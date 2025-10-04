-- Useful plugin to show you pending keybinds.

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    -- event = "VimEnter", -- Sets the loading event to "VimEnter"
    opts_extend = { "spec" },
    opts = {
        -- preset = "helix",
        -- delay between pressing a key and opening which-key (milliseconds)
        -- this setting is independent of vim.o.timeoutlen
        delay = 500,
        icons = {
            -- set icon mappings to true if you have a Nerd Font
            mappings = vim.g.have_nerd_font,
            -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
            -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
            keys = vim.g.have_nerd_font and {} or {
                Up              = "<Up> ",
                Down            = "<Down> ",
                Left            = "<Left> ",
                Right           = "<Right> ",
                C               = "<C-…> ",
                M               = "<M-…> ",
                D               = "<D-…> ",
                S               = "<S-…> ",
                CR              = "<CR> ",
                Esc             = "<Esc> ",
                ScrollWheelDown = "<ScrollWheelDown> ",
                ScrollWheelUp   = "<ScrollWheelUp> ",
                NL              = "<NL> ",
                BS              = "<BS> ",
                Space           = "<Space> ",
                Tab             = "<Tab> ",
                F1              = "<F1>",
                F2              = "<F2>",
                F3              = "<F3>",
                F4              = "<F4>",
                F5              = "<F5>",
                F6              = "<F6>",
                F7              = "<F7>",
                F8              = "<F8>",
                F9              = "<F9>",
                F10             = "<F10>",
                F11             = "<F11>",
                F12             = "<F12>",
            },
        },

        -- Document existing key chains
        spec = {
            { "<leader>a" , group = "Telescope" },
            { "<leader>f" , group = "[F]zf Lua" },
            { "<leader>g" , group = "[G]it search" },
            { "<leader>h" , group = "Git [H]unk", mode = { "n", "v" } },
            { "<leader>l" , group = "[L]SP & code" },
            { "<leader>lj", group = "Toggle [J]oin arguments" },
            { "<leader>lw", group = "LSP [W]orkspace" },
            { "<leader>m" , group = "Book[M]arks" },
            { "<leader>n" , group = "Harpoo[N]" },
            { "<leader>o" , group = "[O]pen" },
            { "<leader>oc", group = "cht.sh [C]heat sheet" },
            { "<leader>t" , group = "[T]oggle" },
            { "<leader>w" , group = "[W]indows" },
            { "<leader>x" , group = "Diagnosti[X]" },
            {
                "<leader>b",
                group = "[B]uffers",
                expand = function()
                    return require("which-key.extras").expand.buf()
                end,
            },
            {
                "<c-w>",
                group = "Windows",
                expand = function()
                    return require("which-key.extras").expand.win()
                end,
            },
        },
    },
}

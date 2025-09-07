-- Adds git related signs to the gutter, as well as utilities for managing changes

return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        signs = {
            add          = { text = "+" },
            change       = { text = "~" },
            delete       = { text = "_" },
            topdelete    = { text = "‾" },
            changedelete = { text = "~" },
            --
            -- add          = { text = "▎" },
            -- change       = { text = "▎" },
            -- delete       = { text = "" },
            -- topdelete    = { text = "" },
            -- changedelete = { text = "▎" },
            -- untracked    = { text = "▎" },
        },
        signs_staged = {
            add          = { text = '+' },
            change       = { text = '~' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            --
            -- add          = { text = "▎" },
            -- change       = { text = "▎" },
            -- delete       = { text = "" },
            -- topdelete    = { text = "" },
            -- changedelete = { text = "▎" },
        },
        on_attach = function(bufnr)
            local gitsigns = require "gitsigns"

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map("n", "]c", function()
                if vim.wo.diff then
                    vim.cmd.normal { "]c", bang = true }
                else
                    gitsigns.nav_hunk "next"
                end
            end, { desc = "Jump to next git [C]hange" })

            map("n", "[c", function()
                if vim.wo.diff then
                    vim.cmd.normal { "[c", bang = true }
                else
                    gitsigns.nav_hunk "prev"
                end
            end, { desc = "Jump to previous git [C]hange" })

            -- Actions

            -- visual mode
            map("v", "<leader>hs", function()
                gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
            end, { desc = "git [S]tage hunk" })
            map("v", "<leader>hr", function()
                gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
            end, { desc = "git [R]eset hunk" })

            -- normal mode
            map("n", "<leader>hs", gitsigns.stage_hunk  , { desc = "git [S]tage hunk" })
            map("n", "<leader>hr", gitsigns.reset_hunk  , { desc = "git [R]eset hunk" })
            map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "git [S]tage buffer" })
            map("n", "<leader>hu", gitsigns.stage_hunk  , { desc = "git [U]ndo stage hunk" })
            map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "git [R]eset buffer" })
            map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "git [P]review hunk" })
            map("n", "<leader>hb", gitsigns.blame_line  , { desc = "git [B]lame line" })
            map("n", "<leader>hB", gitsigns.blame       , { desc = "git [B]lame buffer" })
            map("n", "<leader>hd", gitsigns.diffthis    , { desc = "git [D]iff against index" })
            map(
                "n",
                "<leader>hD",
                function() gitsigns.diffthis "@" end,
                { desc = "git [D]iff against last commit" }
            )

            -- Toggles
            map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Git show [B]lame line" })
            map("n", "<leader>tD", gitsigns.preview_hunk_inline      , { desc = "Git show [D]eleted" })

            -- Text object
            -- map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk") -- ERROR
        end,
    },
}


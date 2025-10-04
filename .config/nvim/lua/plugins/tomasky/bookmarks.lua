return {
    "tomasky/bookmarks.nvim",
    event = "VimEnter",
    lazy = false,
    opts = {
        sign_priority = 80,  --set bookmark sign priority to cover other sign
        save_file = vim.fn.expand("$HOME/.nvim-bookmarks"), -- bookmarks save file path
        keywords = {
            ["@t"] = "✔️",  -- mark annotation startswith @t (signs this icon as `Todo`)
            ["@w"] = "⚠️ ", -- mark annotation startswith @w (signs this icon as `Warn`)
            ["@f"] = "⛏ ",  -- mark annotation startswith @f (signs this icon as `Fix` )
            ["@n"] = "✏️",  -- mark annotation startswith @n (signs this icon as `Note`)
        },
        on_attach = function()
            local bm = require("bookmarks")
            local map = vim.keymap.set
            map("n", "<leader>mm", bm.bookmark_toggle   , { desc = "Toggle bookmark at current line"     })
            map("n", "<leader>mi", bm.bookmark_ann      , { desc = "Bookmark annotation at current line" })
            map("n", "<leader>mc", bm.bookmark_clean    , { desc = "Clean all bookmarks in local buffer" })
            map("n", "<leader>mn", bm.bookmark_next     , { desc = "Next bookmark in local buffer"       })
            map("n", "<leader>mp", bm.bookmark_prev     , { desc = "Previous bookmark in local buffer"   })
            map("n", "<leader>ml", bm.bookmark_list     , { desc = "Show bookmarks in quickfix"          })
            map("n", "<leader>mx", bm.bookmark_clear_all, { desc = "Remove all bookmarks"                })
        end,
    },
}

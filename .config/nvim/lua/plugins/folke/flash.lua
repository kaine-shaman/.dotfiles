return {
    "folke/flash.nvim",
    event = "VeryLazy",
    -- vscode = true,
    ---@type Flash.Config
    opts = {
        config = function()
            local flash = require("flash")
            vim.keymap.set({ "n", "o", "x" }, ";"        , flash.jump             , { desc = "Flash"               })
            vim.keymap.set({ "n", "o", "x" }, "<leader>;", flash.treesitter       , { desc = "Flash Treesitter"    })
            vim.keymap.set({ "o"           }, "r"        , flash.remote           , { desc = "Remote Flash"        })
            vim.keymap.set({ "o", "x"      }, "R"        , flash.treesitter_search, { desc = "Treesitter Search"   })
            vim.keymap.set({ "c"           }, "<c-s>"    , flash.toggle           , { desc = "Toggle Flash Search" })
        end,
    },
    -- stylua: ignore
    -- keys = {
    --     { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
    --     { "S",     mode = { "n", "o", "x" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
    --     { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
    --     { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    --     { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    -- },
}

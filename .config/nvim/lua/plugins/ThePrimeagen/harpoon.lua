return {
    "ThePrimeagen/harpoon",
    -- branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local mark = require("harpoon.mark")
        local ui   = require("harpoon.ui")

        vim.keymap.set("n", "<leader>a", mark.add_file       , { desc = "Harpoon add file" })
        vim.keymap.set("n", "<C-n>"    , ui.toggle_quick_menu, { desc = "Harpoon quick menu" })

        vim.keymap.set("n", "<leader>na", function() ui.nav_file(1) end, { desc = "Harpoon buffer 1" })
        vim.keymap.set("n", "<leader>ns", function() ui.nav_file(2) end, { desc = "Harpoon buffer 2" })
        vim.keymap.set("n", "<leader>nd", function() ui.nav_file(3) end, { desc = "Harpoon buffer 3" })
        vim.keymap.set("n", "<leader>nf", function() ui.nav_file(4) end, { desc = "Harpoon buffer 4" })
    end,
}

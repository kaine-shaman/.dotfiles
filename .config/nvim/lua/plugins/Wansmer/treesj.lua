return {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
    config = function()
        local treesj = require("treesj")
        treesj.setup({})
        vim.keymap.set("n", "<leader>lj", treesj.toggle, { desc = "Toggle [J]oin arguments" })
    end,
}

-- cht.sh integration

return {
    "RishabhRD/nvim-cheat.sh",
    dependencies = { "RishabhRD/popfix" },
    config = function()
        vim.keymap.set("n", "<leader>ocs", "<cmd>Cheat<CR>"    , { desc = "cheat [S]heet"      })
        vim.keymap.set("n", "<leader>ocl", "<cmd>CheatList<CR>", { desc = "cheat sheet [L]ist" })
    end,
}

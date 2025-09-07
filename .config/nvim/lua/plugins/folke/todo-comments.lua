-- Highlight todo, notes, etc in comments

return {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        signs = false,
    },
    keys = {
        { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
        { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
    },
}

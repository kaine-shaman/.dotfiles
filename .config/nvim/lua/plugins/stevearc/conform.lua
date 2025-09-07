-- Autoformat

return {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    lazy = true,
    cmd = { "ConformInfo" },
    -- event = { "BufReadPre", "BufNewFile" },
    -- event = { "BufWritePre" },
    keys = {
        {
            "<leader>lf",
            function()
                require("conform").format({ async = true })
            end,
            -- mode = "",
            mode = { "n", "v" },
            desc = "[F]ormat buffer",
        },
    },
    opts = {
        notify_on_error = false,
        -- format_on_save = function(bufnr)
        --     -- Disable "format_on_save lsp_fallback" for languages that don't
        --     -- have a well standardized coding style. You can add additional
        --     -- languages here or re-enable it for the disabled ones.
        --     local disable_filetypes = { c = true, cpp = true }
        --     if disable_filetypes[vim.bo[bufnr].filetype] then
        --         return nil
        --     else
        --         return {
        --             timeout_ms = 500,
        --             lsp_format = "fallback",
        --             -- lsp_fallback = true,
        --             -- async        = false,
        --         }
        --     end
        -- end,
        default_format_opts = {
            timeout_ms = 3000,
            async      = false,      -- not recommended to change
            quiet      = false,      -- not recommended to change
            lsp_format = "fallback", -- not recommended to change
        },
        formatters_by_ft = {
            -- Conform can also run multiple formatters sequentially
            -- python = { "isort", "black" },
            --
            -- You can use "stop_after_first" to run the first available formatter from the list
            -- javascript = { "prettierd", "prettier", stop_after_first = true },
            asm             = { "asmfmt" },
            astro           = { "astro", stop_after_first = true },
            c               = { "clang_format" },
            cpp             = { "clang_format" },
            css             = { "prettier", stop_after_first = true },
            fish            = { "fish_indent" },
            gleam           = { "gleam" },
            go              = { "gofmt", "golines", "goimports-reviser" },
            graphql         = { "prettier" },
            haskell         = { "ormolu" },
            html            = { "prettier" },
            javascript      = { "prettier", stop_after_first = true },
            javascriptreact = { "prettier", stop_after_first = true },
            json            = { "prettier" },
            liquid          = { "prettier" },
            lua             = { "stylua", stop_after_first = true },
            markdown        = { "prettier" },
            ocaml           = { "ocamlformat", stop_after_first = true },
            purescript      = { "purstidy", stop_after_first = true },
            python          = { "isort", "black" },
            rust            = { "rustfmt" },
            sh              = { "shfmt" },
            svelte          = { "prettier" },
            typescript      = { "prettier", stop_after_first = true },
            typescriptreact = { "prettier", stop_after_first = true },
            yaml            = { "prettier", "yamlfmt" },
        },
    },
    -- config = function()
    --     local conform = require("conform")
    --
    --     vim.keymap.set({ "n", "v" }, "<leader>lf", function()
    --         conform.format({
    --             lsp_fallback = true,
    --             async        = false,
    --             timeout_ms   = 1000,
    --         })
    --     end, { desc = "Format file or range (in visual mode)" })
    -- end,
}

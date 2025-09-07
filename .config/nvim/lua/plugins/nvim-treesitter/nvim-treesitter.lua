-- Highlight, edit, and navigate code

return {
    "nvim-treesitter/nvim-treesitter",
    -- event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
    -- main = "nvim-treesitter.configs", -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    -- opts = {},
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "bash",
                "c",
                "cmake",
                "css",
                "diff",
                "dockerfile",
                "gdscript",
                "gdshader",
                "gitignore",
                "gleam",
                "go",
                "graphql",
                "groovy",
                "haskell",
                "html",
                "java",
                "javascript",
                "json",
                "latex",
                "lua",
                "luadoc",
                "make",
                "markdown",
                "markdown_inline",
                "nim",
                "nix",
                "php",
                "prisma",
                "purescript",
                "python",
                "query",
                "regex",
                "rust",
                "sql",
                "svelte",
                "terraform",
                "toml",
                "tsx",
                "typescript",
                "typst",
                "vim",
                "vimdoc",
                "wgsl",
                "yaml",
                "zig",
            },
            -- Autoinstall languages that are not installed
            auto_install = true,
            highlight = {
                enable = true,
                -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
                --  If you are experiencing weird indenting issues, add the language to
                --  the list of additional_vim_regex_highlighting and disabled languages for indent.
                additional_vim_regex_highlighting = { "ruby" },
            },
            indent = {
                enable = true,
                disable = { "ruby" },
            },
            -- Enable autotagging (w/ nvim-ts-autotag plugin)
            autotag = {
                enable = true,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection    = "<C-space>",
                    node_incremental  = "<C-space>",
                    scope_incremental = false,
                    node_decremental  = "<BS>",
                },
            },
            textobjects = {
                select = {
                    enable    = true,
                    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ['aa'] = '@parameter.outer',
                        ['ia'] = '@parameter.inner',
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner',
                    },
                },
                move = {
                    enable    = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        [']m'] = '@function.outer',
                        [']]'] = '@class.outer',
                    },
                    goto_next_end = {
                        [']M'] = '@function.outer',
                        [']['] = '@class.outer',
                    },
                    goto_previous_start = {
                        ['[m'] = '@function.outer',
                        ['[['] = '@class.outer',
                    },
                    goto_previous_end = {
                        ['[M'] = '@function.outer',
                        ['[]'] = '@class.outer',
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ['<leader>a'] = '@parameter.inner',
                    },
                    swap_previous = {
                        ['<leader>A'] = '@parameter.inner',
                    },
                },
            },
        }

        -- Register additional file extensions
        vim.filetype.add { extension = { tf          = 'terraform' } }
        vim.filetype.add { extension = { tfvars      = 'terraform' } }
        vim.filetype.add { extension = { pipeline    = 'groovy' } }
        vim.filetype.add { extension = { multibranch = 'groovy' } }
    end,
}


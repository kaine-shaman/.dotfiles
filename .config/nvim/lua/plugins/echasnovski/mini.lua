-- Collection of various small independent plugins/modules

return {
    "echasnovski/mini.nvim",
    config = function()
        -- Better Around/Inside textobjects
        --
        -- Examples:
        --  - va)  - [V]isually select [A]round [)]paren
        --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
        --  - ci'  - [C]hange [I]nside [']quote
        require("mini.ai").setup({ n_lines = 500 })

        -- Add/delete/replace surroundings (brackets, quotes, etc.)
        --
        -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
        -- - sd'   - [S]urround [D]elete [']quotes
        -- - sr)'  - [S]urround [R]eplace [)] [']
        --
        -- sf  - Find right surrounding
        -- sfl - Find previous right surrounding
        -- sfn - Find next right surrounding
        --
        -- sn  - Update `MiniSurround.config.n_lines`
        --
        -- sd  - Delete surrounding
        -- sdl - Delete previous surrounding
        -- sdn - Delete next surrounding
        --
        -- sa  - Add surrounding
        --
        -- sh  - Highlight surrounding
        -- shl - Highlight previous surrounding
        -- shn - Highlight next surrounding
        --
        -- sF  - Find left surrounding
        -- sFl - Find previous left surrounding
        -- sFn - Find next left surrounding
        --
        -- sr  - Replace surrounding
        -- srl - Replace previous surrounding
        -- srn - Replace next surrounding
        require("mini.surround").setup()

        -- Split and join arguments
        require("mini.splitjoin").setup({
            mappings = {
                toggle = "<leader>lj",
                split  = "",
                join   = "",
            },
        })

        -- Stip trailing whitespace
        local miniTrailspace = require("mini.trailspace")
        miniTrailspace.setup()
        vim.keymap.set("n", "<leader>lt" , miniTrailspace.trim, { desc = "[T]rim trailing whitespace" })

        -- Simple and easy statusline.
        --  You could remove this setup call if you don't like it,
        --  and try some other statusline plugin
        -- local statusline = require("mini.statusline")
        -- -- set use_icons to true if you have a Nerd Font
        -- statusline.setup({ use_icons = vim.g.have_nerd_font })

        -- You can configure sections in the statusline by overriding their
        -- default behavior. For example, here we set the section for
        -- cursor location to LINE:COLUMN
        ---@diagnostic disable-next-line: duplicate-set-field
        -- statusline.section_location = function()
        --     return '%2l:%-2v'
        -- end

        -- ... and there is more!
        --  Check out: https://github.com/echasnovski/mini.nvim

        -- require("mini.pairs").setup({
        --     modes = { insert = true, command = true, terminal = false },
        --     -- skip autopair when next character is one of these
        --     skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
        --     -- skip autopair when the cursor is inside these treesitter nodes
        --     skip_ts = { "string" },
        --     -- skip autopair when next character is closing pair
        --     -- and there are more closing pairs than opening pairs
        --     skip_unbalanced = true,
        --     -- better deal with markdown code blocks
        --     markdown = true,
        -- })

        local ai = require("mini.ai")
        ai.setup({
            -- Number of lines within which textobject is searched
            n_lines = 500,

            -- Table with textobject id as fields, textobject specification as values.
            -- Also use this to disable builtin textobjects. See |MiniAi.config|.
            custom_textobjects = {
                o = ai.gen_spec.treesitter({ -- code block
                    a = { "@block.outer", "@conditional.outer", "@loop.outer" },
                    i = { "@block.inner", "@conditional.inner", "@loop.inner" },
                }),
                f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
                c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
                t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
                d = { "%f[%d]%d+" }, -- digits
                e = { -- Word with case
                    { "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
                    "^().*()$",
                },
                -- g = LazyVim.mini.ai_buffer, -- buffer
                u = ai.gen_spec.function_call(), -- u for "Usage"
                U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
            },

            -- -- Module mappings. Use `''` (empty string) to disable one.
            -- mappings = {
            --     -- Main textobject prefixes
            --     around = 'a',
            --     inside = 'i',
            --
            --     -- Next/last variants
            --     -- NOTE: These override built-in LSP selection mappings on Neovim>=0.12
            --     -- Map LSP selection manually to use it (see `:h MiniAi.config`)
            --     around_next = 'an',
            --     inside_next = 'in',
            --     around_last = 'al',
            --     inside_last = 'il',
            --
            --     -- Move cursor to corresponding edge of `a` textobject
            --     goto_left = 'g[',
            --     goto_right = 'g]',
            -- },

            -- -- How to search for object (first inside current line, then inside
            -- -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
            -- -- 'cover_or_nearest', 'next', 'previous', 'nearest'.
            -- search_method = 'cover_or_next',
            --
            -- -- Whether to disable showing non-error feedback
            -- -- This also affects (purely informational) helper messages shown after
            -- -- idle time if user input is required.
            -- silent = false,
        })
    end,
}

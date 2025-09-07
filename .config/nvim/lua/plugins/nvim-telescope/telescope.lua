-- Fuzzy Finder (files, lsp, etc)

return {
    "nvim-telescope/telescope.nvim",
    -- branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- { -- If encountering errors, see telescope-fzf-native README for installation instructions
        --     "nvim-telescope/telescope-fzf-native.nvim",
        --
        --     -- `build` is used to run some command when the plugin is installed/updated.
        --     -- This is only run then, not every time Neovim starts up.
        --     build = "make",
        --
        --     -- `cond` is a condition used to determine whether this plugin should be
        --     -- installed and loaded.
        --     cond = function()
        --         return vim.fn.executable("make") == 1
        --     end,
        -- },
        "nvim-telescope/telescope-ui-select.nvim",

        {
            "nvim-telescope/telescope-live-grep-args.nvim" ,
            -- This will not install any breaking changes.
            -- For major updates, this must be adjusted manually.
            version = "^1.0.0",
        },

        -- Useful for getting pretty icons, but requires a Nerd Font.
        { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },

        "folke/todo-comments.nvim",
    },
    config = function()
        -- Telescope is a fuzzy finder that comes with a lot of different things that
        -- it can fuzzy find! It's more than just a "file finder", it can search
        -- many different aspects of Neovim, your workspace, LSP, and more!
        --
        -- The easiest way to use Telescope, is to start by doing something like:
        --  :Telescope help_tags
        --
        -- After running this command, a window will open up and you're able to
        -- type in the prompt window. You'll see a list of `help_tags` options and
        -- a corresponding preview of the help.
        --
        -- Two important keymaps to use while in Telescope are:
        --  - Insert mode: <c-/>
        --  - Normal mode: ?
        --
        -- This opens a window that shows you all of the keymaps for the current
        -- Telescope picker. This is really useful to discover what Telescope can
        -- do as well as how to actually do it!

        -- [[ Configure Telescope ]]
        -- See `:help telescope` and `:help telescope.setup()`
        local actions = require("telescope.actions")
        local custom_actions = require("telescope.actions.mt").transform_mod({
            open_trouble_qflist = function(_)
                require("trouble").toggle("quickfix")
            end,
        })

        local telescope = require("telescope")
        local lga_actions = require("telescope-live-grep-args.actions")

        telescope.setup({
            -- You can put your default mappings / updates / etc. in here
            --  All the info you're looking for is in `:help telescope.setup()`
            --
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-q>"] = actions.send_selected_to_qflist + custom_actions.open_trouble_qflist,
                        ["<C-t>"] = require("trouble.sources.telescope").open,
                    },
                },
                file_ignore_patterns = {
                    -- '.git',
                    ".venv",
                    "node_modules",
                },
                vimgrep_arguments = {
                    "rg",
                    "--follow", -- Follow symbolic links
                    "--hidden", -- Search for hidden files
                    "--no-heading", -- Don't group matches by each file
                    "--with-filename", -- Print the file path with the matched lines
                    "--line-number", -- Show line numbers
                    "--column", -- Show column numbers
                    "--smart-case", -- Smart case search

                    -- Exclude some patterns from search
                    "--glob=!**/.git/*",
                    "--glob=!**/.idea/*",
                    "--glob=!**/.vscode/*",
                    "--glob=!**/build/*",
                    "--glob=!**/dist/*",
                    "--glob=!**/package-lock.json",
                    "--glob=!**/yarn.lock",
                },
            },
            pickers = {
                find_files = {
                    no_ignore = true,
                    hidden = true,
                    -- needed to exclude some files & dirs from general search
                    -- when not included or specified in .gitignore
                    find_command = {
                        "rg",
                        "--files",
                        "--hidden",
                        "--glob=!**/.git/*",
                        "--glob=!**/.idea/*",
                        "--glob=!**/.vscode/*",
                        "--glob=!**/build/*",
                        "--glob=!**/dist/*",
                        "--glob=!**/package-lock.json",
                        "--glob=!**/yarn.lock",
                    },
                },
                live_grep = {
                    additional_args = function(_)
                        return { "--hidden", "-u" }
                    end,
                },
                buffers = {
                    -- initial_mode  = "normal",
                    sort_lastused = true,
                    -- sort_mru      = true,
                    mappings = {
                        n = {
                            ["d"] = actions.delete_buffer,
                            ["l"] = actions.select_default,
                        },
                    },
                },
            },
            path_display = {
                filename_first = {
                    reverse_directories = true,
                },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown(),
                },
                live_grep_args = {
                    auto_quoting = true, -- enable/disable auto-quoting
                    -- define mappings, e.g.
                    mappings = { -- extend mappings
                        i = {
                            ["<C-b>"] = lga_actions.quote_prompt(),
                            ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob *" }),
                            -- freeze the current list and start a fuzzy search in the frozen list
                            ["<C-f>"] = lga_actions.to_fuzzy_refine,
                        },
                    },
                    -- ... also accepts theme settings, for example:
                    -- theme = "dropdown", -- use dropdown theme
                    -- theme = { }, -- use own theme spec
                    -- layout_config = { mirror=true }, -- mirror preview pane
                },
                -- fzf = {
                --     fuzzy = true,                    -- false will only do exact matching
                --     override_generic_sorter = true,  -- override the generic sorter
                --     override_file_sorter = true,     -- override the file sorter
                --     case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                --                                      -- the default case_mode is "smart_case"
                -- },
            },
            git_files = {
                previewer = false,
            },
        })

        -- Enable Telescope extensions if they are installed
        -- pcall(telescope.load_extension, "fzf")
        pcall(telescope.load_extension, "ui-select")
        -- pcall(telescope.load_extension, "scope")
        pcall(telescope.load_extension, "live_grep_args")

        local keymap = vim.keymap

        -- See `:help telescope.builtin`
        local builtin = require("telescope.builtin")
        local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
        local live_grep_args = telescope.extensions.live_grep_args

        keymap.set("n", "<leader>gf",  builtin.git_files,    { desc = "Find git [F]iles" })
        keymap.set("n", "<leader>ga",  builtin.git_commits,  { desc = "Find git commits [A]ll" })
        keymap.set("n", "<leader>gcf", builtin.git_bcommits, { desc = "Find git [C]ommits for current [F]ile" })
        keymap.set("n", "<leader>gb",  builtin.git_branches, { desc = "Find git [B]ranches" })
        keymap.set("n", "<leader>gs",  builtin.git_status,   { desc = "Find git [S]tatus (diff view)" })

        keymap.set("n", "<leader>fs", builtin.builtin,     { desc = "Find [S]elect Telescope" })
        keymap.set("n", "<leader>fm", builtin.marks,       { desc = "Find [M]arks" })
        keymap.set("n", "<leader>fh", builtin.help_tags,   { desc = "Find [H]elp" })
        keymap.set("n", "<leader>fk", builtin.keymaps,     { desc = "Find [K]eymaps" })
        keymap.set("n", "<leader>ff", builtin.find_files,  { desc = "Find [F]iles" })
        -- keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find current [W]ord" })
        -- keymap.set("n", "<leader>fg", builtin.live_grep,   { desc = "Find by [G]rep" })
        keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find [D]iagnostics" })
        keymap.set("n", "<leader>fv", builtin.git_files,   { desc = "Find [V]CS (git)" })
        keymap.set("n", "<leader>fb", builtin.buffers,     { desc = "Find [B]uffers" })
        keymap.set("n", "<leader>fr", builtin.resume,      { desc = "Find [R]esume" })
        keymap.set("n", "<leader>f.", builtin.oldfiles,    { desc = 'Find Recent Files [.]' })

        keymap.set("n", "<leader>fv", live_grep_args_shortcuts.grep_visual_selection , { desc = "Find [V]isual selection" })
        keymap.set("n", "<leader>fw", live_grep_args_shortcuts.grep_word_under_cursor, { desc = "Find current [W]ord" })
        keymap.set("n", "<leader>fg", live_grep_args.live_grep_args                  , { desc = "Find by [G]rep" })

        -- keymap.set("n", "<leader>fa", "<cmd>Telescope scope buffers<CR>", { desc = "Find [A]ll buffers" })
        keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<CR>"                        , { desc = "Find [T]ODOs" })
        keymap.set("n", "<leader>fT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<CR>", { desc = "Find [T]odo/Fix/Fixme" })

        -- Slightly advanced example of overriding default behavior and theme
        keymap.set("n", "<leader>fc", function()
            -- You can pass additional configuration to Telescope to change the theme, layout, etc.
            builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                winblend  = 10,
                previewer = false,
            }))
        end, { desc = "Find in [C]urrent buffer" })

        -- It's also possible to pass additional configuration options.
        --  See `:help telescope.builtin.live_grep()` for information about particular keys
        keymap.set("n", "<leader>f/", function()
            builtin.live_grep({
                grep_open_files = true,
                prompt_title    = "Live Grep in Open Files",
            })
        end, { desc = "Find [/] in Open Files" })

        -- Shortcut for searching your Neovim configuration files
        keymap.set("n", "<leader>fn", function()
            builtin.find_files({ cwd = vim.fn.stdpath("config") })
        end, { desc = "Find [N]eovim files" })
    end,
}

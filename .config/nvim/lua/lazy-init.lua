-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
require("lazy").setup({

    "folke/ts-comments.nvim",
    "nvim-lua/plenary.nvim",
    require("plugins.EtiamNullam.deferred-clipboard"),
    require("plugins.RishabhRD.nvim-cheat"), -- cht.sh
    require("plugins.ThePrimeagen.harpoon"),
    require("plugins.Wansmer.treesj"), -- split/join code blocks
    require("plugins.akinsho.toggleterm"),
    require("plugins.echasnovski.mini"),
    require("plugins.folke.flash"),
    -- require("plugins.folke.lazydev"), -- ????
    require("plugins.folke.trouble"),
    -- require("plugins.mfussenegger.nvim-dap"), -- debugger
    -- require("plugins.mfussenegger.nvim-lint"),
    -- require("plugins.mfussenegger.nvim-lint-lazy"),
    require("plugins.neovim.nvim-lspconfig"),
    require("plugins.numToStr.Comment"),
    require("plugins.nvim-treesitter.nvim-treesitter"),
    -- require("plugins.nvim-treesitter.nvim-treesitter-textobjects"),
    require("plugins.rmagatti.auto-session"),
    require("plugins.stevearc.aerial"), -- outline
    -- require("plugins.tpope.vim-dadbod"), -- database

    -- ????
    -- "VonHeikemen/lsp-zero.nvim",
    -- "eandrju/cellular-automaton.nvim",
    -- "github/copilot.vim",
    -- "laytan/cloak.nvim",
    -- "mbbill/undotree",
    -- "nvim-treesitter/nvim-treesitter-context",
    -- "nvim-treesitter/playground",
    -- "theprimeagen/refactoring.nvim",
    -- ????

    -- detect tabstop and shiftwidth
    --
    -- "NMAC427/guess-indent.nvim",
    "tpope/vim-sleuth",

    -- marks
    --
    require("plugins.chentoast.marks"),
    require("plugins.tomasky.bookmarks"),

    -- search
    --
    -- "echasnovski/mini.pick", -- ????
    require("plugins.ibhagwan.fzf-lua"),
    require("plugins.nvim-telescope.telescope"),

    -- git
    --
    "tpope/vim-fugitive", -- Git integration
    "tpope/vim-rhubarb",  -- GitHub integration for vim-fugitive
    require("plugins.kdheepak.lazygit"),
    require("plugins.lewis6991.gitsigns"),
    require("plugins.sindrets.diffview"),

    -- files
    --
    -- "stevearc/oil.nvim", -- ????
    require("plugins.nvim-neo-tree.neo-tree"),
    -- require("plugins.nvim-tree.nvim-tree"),

    -- find/replace
    --
    require("plugins.MagicDuck.grug-far"),
    -- require("plugins.gbprod.substitute"),

    -- formatting
    --
    "windwp/nvim-ts-autotag",
    -- require("plugins.nvimtools.none-ls"),
    require("plugins.stevearc.conform"),
    -- require("plugins.windwp.nvim-autopairs"),

    -- autocomplete
    --
    require("plugins.hrsh7th.nvim-cmp"),
    -- require("plugins.saghen.blink-cmp"),

    -- layout
    --
    require("plugins.folke.zen-mode"),
    require("plugins.szw.vim-maximizer"),

    -- visuals
    --
    "stevearc/dressing.nvim",
    -- require("plugins.brenoprata10.nvim-highlight-colors"),
    require("plugins.folke.which-key"),
    require("plugins.goolord.alpha-nvim"),
    require("plugins.lukas-reineke.indent-blankline"),
    require("plugins.norcalli/nvim-colorizer"),
    require("plugins.nvim-lualine.lualine"),
    -- require("plugins.tiagovla.scope"), -- scope buffers to tabs
    -- require("plugins.tummetott.reticle"),
    require("plugins.willothy.nvim-cokeline"),
    require("plugins.xiyaowong.transparent"),

    -- colorschemes
    --
    -- "AlexvZyl/nordic.nvim",
    -- "Mofiqul/adwaita.nvim",
    -- "NTBBloodbath/doom-one.nvim",
    -- "Shatur/neovim-ayu",
    -- "bluz71/vim-moonfly-colors",
    -- "bluz71/vim-nightfly-colors",
    -- "catppuccin/nvim",
    -- "craftzdog/solarized-osaka.nvim",
    -- "kvrohit/mellow.nvim",
    -- "kvrohit/rasmus.nvim",
    -- "kvrohit/substrata.nvim",
    -- "mhartington/oceanic-next",
    -- "navarasu/onedark.nvim",
    -- "olivercederborg/poimandres.nvim",
    -- "oxfist/night-owl.nvim",
    -- "ramojus/mellifluous.nvim",
    -- "ray-x/aurora",
    -- "ray-x/starry.nvim",
    -- "ribru17/bamboo.nvim",
    -- "rockyzhang24/arctic.nvim",
    -- "sainnhe/gruvbox-material",
    -- "samharju/synthweave.nvim",
    -- "savq/melange-nvim",
    -- "shaunsingh/nord.nvim",
    -- "tiagovla/tokyodark.nvim",
    -- "vague2k/vague.nvim",
    -- "vv9k/bogster",
    -- "yashguptaz/calvera-dark.nvim",
    -- require("colorschemes.EdenEast.nightfox"),
    -- require("colorschemes.Tsuzat.NeoSolarized"),
    -- require("colorschemes.ellisonleao.gruvbox"),
    require("colorschemes.folke.tokyonight"),
    -- require("colorschemes.luisiacc.gruvbox-baby"),
    -- require("colorschemes.marko-cerovac.material"),
    -- require("colorschemes.maxmx03.fluoromachine"),
    -- require("colorschemes.maxmx03.solarized"),
    -- require("colorschemes.mcauley-penney.techbase"),
    -- require("colorschemes.metalelf0.black-metal-theme-neovim"),
    -- require("colorschemes.rebelot.kanagawa"),
    -- require("colorschemes.rockerBOO.boo-colorscheme"),
    -- require("colorschemes.rose-pine.neovim"),
    -- require("colorschemes.scottmckendry.cyberdream"),
    -- require("colorschemes.xero.miasma"),
    -- require("colorschemes.zenbones-theme.zenbones"),

    -- AI
    --
    -- require("plugins.jackMort.ChatGPT"),
    -- require("plugins.yetone.avante"),


    -- NOTE: Plugins can be added with a link (or for a github repo: "owner/repo" link).
    --  Plugins can also be added by using a table,
    --  with the first argument being the link and the following
    --  keys can be used to configure plugin behavior/loading/etc.
    --
    -- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
    --

    -- Alternatively, use `config = function() ... end` for full control over the configuration.
    -- If you prefer to call `setup` explicitly, use:
    --    {
    --        "lewis6991/gitsigns.nvim",
    --        config = function()
    --            require("gitsigns").setup({
    --                -- Your gitsigns configuration here
    --            })
    --        end,
    --    }
    --
    -- Here is a more advanced example where we pass configuration
    -- options to `gitsigns.nvim`.
    --
    -- See `:help gitsigns` to understand what the configuration keys do
    -- {
    --     "lewis6991/gitsigns.nvim",
    --     opts = {
    --         signs = {
    --             add          = { text = "+" },
    --             change       = { text = "~" },
    --             delete       = { text = "_" },
    --             topdelete    = { text = "‾" },
    --             changedelete = { text = "~" },
    --         },
    --     },
    -- },

    -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
    --
    -- This is often very useful to both group configuration, as well as handle
    -- lazy loading plugins that don't need to be loaded immediately at startup.
    --
    -- For example, in the following configuration, we use:
    --  event = "VimEnter"
    --
    -- which loads which-key before all the UI elements are loaded. Events can be
    -- normal autocommands events (`:help autocmd-events`).
    --
    -- Then, because we use the `opts` key (recommended), the configuration runs
    -- after the plugin has been loaded as `require(MODULE).setup(opts)`.

    -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
    -- Or use telescope!
    -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
    -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
    defaults = {
        -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
        -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
        lazy = false,
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break your Neovim install.
        version = false, -- always use the latest git commit
        -- version = "*", -- try installing the latest stable version for plugins that support semver
    },
    checker = {
        enabled = true, -- check for plugin updates periodically
        notify  = false, -- notify on update
    }, -- automatically check for plugin updates
    change_detection = { notify = false },
    ui = {
        -- If you are using a Nerd Font: set icons to an empty table which will use the
        -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
        icons = vim.g.have_nerd_font and {} or {
            cmd     = "⌘",
            config  = "🛠",
            event   = "📅",
            ft      = "📂",
            init    = "⚙",
            keys    = "🗝",
            plugin  = "🔌",
            runtime = "💻",
            require = "🌙",
            source  = "📄",
            start   = "🚀",
            task    = "📌",
            lazy    = "💤 ",
        },
    },
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
    rocks = {
        enabled = false,
    },
})

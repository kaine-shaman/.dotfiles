return {
    "neovim/nvim-lspconfig",
    dependencies = {
        -- Automatically install LSPs and related tools to stdpath for Neovim
        { "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
        -- mason-lspconfig:
        -- - Bridges the gap between LSP config names (e.g. "lua_ls") and actual Mason package names (e.g. "lua-language-server").
        -- - Used here only to allow specifying language servers by their LSP name (like "lua_ls") in `ensure_installed`.
        -- - It does not auto-configure servers — we use vim.lsp.config() + vim.lsp.enable() explicitly for full control.
        "williamboman/mason-lspconfig.nvim",
        -- mason-tool-installer:
        -- - Installs LSPs, linters, formatters, etc. by their Mason package name.
        -- - We use it to ensure all desired tools are present.
        -- - The `ensure_installed` list works with mason-lspconfig to resolve LSP names like "lua_ls".
        "WhoIsSethDaniel/mason-tool-installer.nvim",

        -- Useful status updates for LSP.
        {
            "j-hui/fidget.nvim",
            opts = {
                notification = {
                    window = {
                        winblend = 0, -- Background color opacity in the notification window
                    },
                },
            },
        },

        -- Allows extra capabilities provided by nvim-cmp
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
            callback = function(event)
                -- NOTE: Remember that Lua is a real programming language, and as such it is possible
                -- to define small helper and utility functions so you don't have to repeat yourself.
                --
                -- In this case, we create a function that lets us more easily define mappings specific
                -- for LSP related items. It sets the mode, buffer and description for us each time.
                local map = function(keys, func, desc, mode)
                    mode = mode or "n"
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                end

                -- Opens a popup that displays documentation about the word under your cursor
                --  See `:help K` for why this keymap
                map("K", vim.lsp.buf.hover, "Hover Documentation")

                map("<C-s>", vim.lsp.buf.signature_help, "Signature Help", "i")

                -- WARN: This is not Goto Definition, this is Goto Declaration.
                --  For example, in C this would take you to the header
                map("gD", vim.lsp.buf.declaration, "Goto [D]eclaration")

                -- Rename the variable under your cursor
                --  Most Language Servers support renaming across files, etc.
                map("<leader>lr", vim.lsp.buf.rename, "[R]ename")

                -- Execute a code action, usually your cursor needs to be on top of an error
                -- or a suggestion from your LSP for this to activate.
                map("<leader>la", vim.lsp.buf.code_action, "Code [A]ction")

                map("<leader>lwa", vim.lsp.buf.add_workspace_folder, "Workspace [A]dd Folder")
                map("<leader>lwr", vim.lsp.buf.remove_workspace_folder, "Workspace [R]emove Folder")
                map("<leader>lwl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, "Workspace [L]ist Folders")

                -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
                -- @param client vim.lsp.Client
                -- @param method vim.lsp.protocol.Method
                ---@param bufnr? integer some lsp support methods only in specific files
                ---@return boolean
                local function client_supports_method(client, method, bufnr)
                    if vim.fn.has("nvim-0.11") == 1 then
                        return client:supports_method(method, bufnr)
                    else
                        return client.supports_method(method, { bufnr = bufnr })
                    end
                end

                -- The following two autocommands are used to highlight references of the
                -- word under your cursor when your cursor rests there for a little while.
                --    See `:help CursorHold` for information about when this is executed
                --
                -- When you move your cursor, the highlights will be cleared (the second autocommand).
                local client = vim.lsp.get_client_by_id(event.data.client_id)
                if
                    client
                    and client_supports_method(
                        client,
                        vim.lsp.protocol.Methods.textDocument_documentHighlight,
                        event.buf
                    )
                then
                    local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
                    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.document_highlight,
                    })

                    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                        buffer = event.buf,
                        group = highlight_augroup,
                        callback = vim.lsp.buf.clear_references,
                    })

                    vim.api.nvim_create_autocmd("LspDetach", {
                        group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
                        callback = function(event2)
                            vim.lsp.buf.clear_references()
                            vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
                        end,
                    })
                end

                -- The following code creates a keymap to toggle inlay hints in your
                -- code, if the language server you are using supports them
                --
                -- This may be unwanted, since they displace some of your code
                if
                    client
                    and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
                then
                    map("<leader>th", function()
                        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
                    end, "Inlay [H]ints")
                end
            end,
        })

        -- Diagnostic Config
        -- See :help vim.diagnostic.Opts
        vim.diagnostic.config({
            severity_sort = true,
            float = { border = "rounded", source = "if_many" },
            underline = { severity = vim.diagnostic.severity.ERROR },
            signs = vim.g.have_nerd_font and {
                text = {
                    [vim.diagnostic.severity.ERROR] = "󰅚 ",
                    [vim.diagnostic.severity.WARN]  = "󰀪 ",
                    [vim.diagnostic.severity.INFO]  = "󰋽 ",
                    [vim.diagnostic.severity.HINT]  = "󰌶 ",
                },
            } or {},
            virtual_text = {
                source = "if_many",
                spacing = 2,
                format = function(diagnostic)
                    local diagnostic_message = {
                        [vim.diagnostic.severity.ERROR] = diagnostic.message,
                        [vim.diagnostic.severity.WARN]  = diagnostic.message,
                        [vim.diagnostic.severity.INFO]  = diagnostic.message,
                        [vim.diagnostic.severity.HINT]  = diagnostic.message,
                    }
                    return diagnostic_message[diagnostic.severity]
                end,
            },
        })

        -- LSP servers and clients are able to communicate to each other what features they support.
        -- By default, Neovim doesn't support everything that is in the LSP specification.
        -- When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
        -- So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

        -- Enable the following language servers
        --
        -- Add any additional override configuration in the following tables. Available keys are:
        -- - cmd (table): Override the default command used to start the server
        -- - filetypes (table): Override the default list of associated filetypes for the server
        -- - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
        -- - settings (table): Override the default settings passed when initializing the server.
        local servers = {
            bashls = {},
            clangd = {},
            cmake = {},
            docker_compose_language_service = {},
            ts_ls = {},
            ruff = {},
            ols = {},
            zls = {},
            svelte = {},
            pylsp = {
                settings = {
                    pylsp = {
                        plugins = {
                            pyflakes = { enabled = false },
                            pycodestyle = { enabled = false },
                            autopep8 = { enabled = false },
                            yapf = { enabled = false },
                            mccabe = { enabled = false },
                            pylsp_mypy = { enabled = false },
                            pylsp_black = { enabled = false },
                            pylsp_isort = { enabled = false },
                        },
                    },
                },
            },
            gopls = {},
            html = { filetypes = { "html", "twig", "hbs" } },
            cssls = {},
            tailwindcss = {},
            dockerls = {},
            prismals = {},
            sqlls = {},
            -- terraformls = {},
            jsonls = {},
            yamlls = {},
            lua_ls = {
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace",
                        },
                        runtime = { version = "LuaJIT" },
                        workspace = {
                            checkThirdParty = false,
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        diagnostics = {
                            globals = { "vim" },
                            disable = { "missing-fields" },
                        },
                        format = {
                            enable = false,
                        },
                    },
                },
            },
        }

        -- Ensure the servers and tools above are installed
        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
            -- "astro",
            -- "black", -- python formatter -- ERROR --
            -- "emmet_language_server",
            -- "emmet_ls",
            -- "eslint", --
            -- "eslint_d", --
            -- "fortls",
            -- "gdscript", --
            -- "graphql",
            -- "hls", --
            -- "htmx",
            -- "intelephense",
            -- "isort", -- python formatter -- ERROR --
            -- "marksman",
            -- "nil_ls", --
            -- "nim_langserver",
            -- "prettier", -- prettier formatter -- ERROR --
            -- "pylint", -- ERROR --
            -- "pyright",
            -- "rust_analyzer",
            -- "stylua", -- Used to format lua code
            -- "templ",
            -- "texlab",
            -- "tsserver", --
            -- "wgsl_analyzer",
        })
        require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

        for server, cfg in pairs(servers) do
            -- For each LSP server (cfg), we merge:
            -- 1. A fresh empty table (to avoid mutating capabilities globally)
            -- 2. Your capabilities object with Neovim + cmp features
            -- 3. Any server-specific cfg.capabilities if defined in `servers`
            cfg.capabilities = vim.tbl_deep_extend("force", {}, capabilities, cfg.capabilities or {})

            vim.lsp.config(server, cfg)
            vim.lsp.enable(server)
        end
    end,
}

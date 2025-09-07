return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine     = require("lualine")
        local lazy_status = require("lazy.status") -- to configure lazy pending updates count

        local mode = {
            'mode',
            fmt = function(str)
                -- return ' ' .. str:sub(1, 1) -- displays only the first character of the mode
                return ' ' .. str
            end,
        }

        local filename = {
            'filename',
            file_status = true, -- displays file status (readonly status, modified status)
            path        = 1,    -- 0 = just filename, 1 = relative path, 2 = absolute path
        }

        local hide_in_width = function()
            return vim.fn.winwidth(0) > 100
        end

        local diagnostics = {
            'diagnostics',
            sources          = { 'nvim_diagnostic' },
            sections         = { 'error', 'warn' },
            symbols          = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            colored          = false,
            update_in_insert = false,
            always_visible   = false,
            cond             = hide_in_width,
        }

        local diff = {
            'diff',
            colored = false,
            symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
            cond    = hide_in_width,
        }

        lualine.setup({
            options = {
                icons_enabled        = true,
                -- section_separators   = { left = '', right = '' },
                section_separators   = "",
                -- component_separators = { left = '', right = '' },
                component_separators = "",
                disabled_filetypes   = { 'alpha', 'neo-tree', 'Avante' },
                always_divide_middle = true,
                theme = {
                    normal = {
                        a = { bg = nil },
                        b = { bg = nil },
                        c = { bg = nil },
                    },
                    insert = {
                        a = { bg = nil },
                        b = { bg = nil },
                        c = { bg = nil },
                    },
                    visual = {
                        a = { bg = nil },
                        b = { bg = nil },
                        c = { bg = nil },
                    },
                    replace = {
                        a = { bg = nil },
                        b = { bg = nil },
                        c = { bg = nil },
                    },
                    command = {
                        a = { bg = nil },
                        b = { bg = nil },
                        c = { bg = nil },
                    },
                    inactive = {
                        a = { bg = nil },
                        b = { bg = nil },
                        c = { bg = nil },
                    }
                },
            },
            sections = {
                lualine_a = { mode },
                lualine_b = { 'branch' },
                lualine_c = { filename },
                lualine_x = {
                    diagnostics,
                    diff,
                    {
                        lazy_status.updates,
                        cond  = lazy_status.has_updates,
                        color = { fg = "#888888" },
                    },
                    { "encoding"  , cond = hide_in_width },
                    { "fileformat", cond = hide_in_width },
                    { "filetype"  , cond = hide_in_width },
                },
                lualine_y = { 'location' },
                lualine_z = { 'progress' },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { { 'filename', path    = 1 } },
                lualine_x = { { 'location', padding = 0 } },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            extensions = { 'fugitive' },
        })
    end,
}


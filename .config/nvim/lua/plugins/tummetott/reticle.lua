return {
    "tummetott/reticle.nvim",
    event = "VeryLazy", -- optionally lazy load the plugin
    opts = {
        -- Enable/Disable the cursorline and/or cursorcolumn at startup
        on_startup = {
            cursorline = true,
            cursorcolumn = false,
        },

        -- Disable the cursorline and cursorcolumn in insert mode
        disable_in_insert = true,

        -- Disable the cursorline and cursorcolumn in diff mode
        disable_in_diff = true,

        -- By default, nvim highlights the cursorline number only when the
        -- cursorline setting is active. Enabling this setting ensures that the
        -- cursorline number in every window is always highlighted, regardless of
        -- the cursorline setting. See: ':h cursorlineopt'
        always_highlight_number = false,

        -- Cursorline and/or cursorcolumn are set to be displayed exclusively in
        -- the active window, thus following your active window. This setting is
        -- overruled by the following settings concerning special filetypes.
        follow = {
            cursorline = true,
            cursorcolumn = true,
        },

        -- Specify filetypes where the cursorline and/or cursorcolumn are always
        -- enabled, regardless of the global setting.
        always = {
            cursorline = {},
            cursorcolumn = {},
        },

        -- Specify filetypes where the cursorline and/or cursorcolumn are always
        -- enabled when the window is focused, regardless of the global setting.
        on_focus = {
            cursorline = {},
            cursorcolumn = {},
        },

        -- Define filetypes which are ignored by the plugin
        ignore = {
            cursorline = {
                "DressingInput",
                "FTerm",
                "NvimSeparator",
                "NvimTree",
                "TelescopePrompt",
                "Trouble",
                -- "neo-tree",
            },
            cursorcolumn = {},
        },

        -- Specify filetypes where the cursorline and/or cursorcolumn should be
        -- explicitly disabled. Typically, you would include these filetypes in
        -- the 'ignored' table. However, there are situations where plugins enable
        -- cursorline/cursorcolumn without offering a configuration option for
        -- disabling them. By adding these filetypes to the 'never' table, you
        -- can override the plugin's settings and turn off these features.
        never = {
            cursorline = {},
            cursorcolumn = {},
        },
    },
}

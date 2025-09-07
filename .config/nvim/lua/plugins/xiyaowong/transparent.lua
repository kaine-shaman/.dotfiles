return {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
        vim.g.transparent_enabled = true

        local transparent = require("transparent")

        -- transparent.clear_prefix('NeoTree')
        transparent.clear_prefix('lualine')
        transparent.clear_prefix('TabLine')
        transparent.clear_prefix('GitSigns')

        transparent.setup({
            groups = {
                "Normal",
                "NormalNC",
                "ColorColumn",
                "Comment",
                "Constant",
                "Special",
                "Identifier",
                "Statement",
                "PreProc",
                "Type",
                "Underlined",
                "Todo",
                "String",
                "Function",
                "Conditional",
                "Repeat",
                "Operator",
                "Structure",
                "LineNr",
                "NonText",
                "SignColumn",
                -- "CursorLine",
                "CursorLineNr",
                "StatusLine",
                "StatusLineNC",
                "EndOfBuffer",
                "WinSeparator",
            },
            extra_groups = {
                -- "NeoTreeBufferNumber",       -- The buffer number shown in the buffers source.
                -- "NeoTreeCursorLine",         -- |hl-CursorLine| override in Neo-tree window.
                -- "NeoTreeDimText",            -- Greyed out text used in various places.
                -- "NeoTreeDirectoryIcon",      -- Directory icon.
                -- "NeoTreeDirectoryName",      -- Directory name.
                -- "NeoTreeDotfile",            -- Used for icons and names when dotfiles are filtered.
                -- "NeoTreeFileIcon",           -- File icon, when not overridden by devicons.
                -- "NeoTreeFileName",           -- File name, when not overwritten by another status.
                -- "NeoTreeFileNameOpened",     -- File name when the file is open. Not used yet.
                -- "NeoTreeFilterTerm",         -- The filter term, as displayed in the root node.
                -- "NeoTreeFloatBorder",        -- The border for pop-up windows.
                -- "NeoTreeFloatTitle",         -- Used for the title text of pop-ups when the border-style
                --                              -- is set to another style than "NC". This is derived
                --                              -- from NeoTreeFloatBorder.
                -- "NeoTreeTitleBar",           -- Used for the title bar of pop-ups, when the border-style
                --                              -- is set to "NC". This is derived from NeoTreeFloatBorder.
                "NeoTreeGitAdded",           -- File name when the git status is added.
                "NeoTreeGitConflict",        -- File name when the git status is conflict.
                "NeoTreeGitDeleted",         -- File name when the git status is deleted.
                "NeoTreeGitIgnored",         -- File name when the git status is ignored.
                "NeoTreeGitModified",        -- File name when the git status is modified.
                "NeoTreeGitUnstaged",        -- Used for git unstaged symbol.
                "NeoTreeGitUntracked",       -- File name when the git status is untracked.
                -- "NeoTreeGitStaged",          -- Used for git staged symbol.
                -- "NeoTreeHiddenByName",       -- Used for icons and names when `hide_by_name` is used.
                -- "NeoTreeIndentMarker",       -- The style of indentation markers (guides). By default,
                --                              -- the "Normal" highlight is used.
                -- "NeoTreeExpander",           -- Used for collapsed/expanded icons.
                "NeoTreeNormal",             -- |hl-Normal| override in Neo-tree window.
                "NeoTreeNormalNC",           -- |hl-NormalNC| override in Neo-tree window.
                -- "NeoTreeSignColumn",         -- |hl-SignColumn| override in Neo-tree window.
                -- "NeoTreeStats",              -- Used for "stat" columns like size, last modified, etc.
                -- "NeoTreeStatsHeader",        -- Used for the header (top line) of the above columns.
                -- "NeoTreeStatusLine",         -- |hl-StatusLine| override in Neo-tree window.
                -- "NeoTreeStatusLineNC",       -- |hl-StatusLineNC| override in Neo-tree window.
                -- "NeoTreeVertSplit",          -- |hl-VertSplit| override in Neo-tree window.
                -- "NeoTreeWinSeparator",       -- |hl-WinSeparator| override in Neo-tree window.
                -- "NeoTreeEndOfBuffer",        -- |hl-EndOfBuffer| override in Neo-tree window.
                -- "NeoTreeRootName",           -- The name of the root node.
                -- "NeoTreeSymbolicLinkTarget", -- Symbolic link target.
                -- "NeoTreeTitleBar",           -- Used for the title bar of pop-ups, when the border-style
                --                              -- is set to "NC". This is derived from NeoTreeFloatBorder.
                -- "NeoTreeWindowsHidden",      -- Used for icons and names that are hidden on Windows.

                -- "TabLine",
                -- "TabLineSel",
                -- "TabLineFill",
            },
            exclude_groups = {},
        })
    end,
}


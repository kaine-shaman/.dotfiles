vim.cmd("let g:netrw_liststyle = 3")

vim.g.have_nerd_font          = true
vim.g.loaded_perl_provider    = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider    = 0

local opt = vim.opt

opt.number         = true -- Make line numbers default
opt.relativenumber = true -- Set relative numbered lines

opt.ruler = false -- disable the default ruler

-- Enable mouse mode
opt.mouse = "a"

-- we don't need to see things like -- INSERT -- anymore
opt.showmode = false

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile   = true
opt.undolevels = 10000

-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.smartcase  = true

-- Keep signcolumn on by default
opt.signcolumn = "yes"

opt.updatetime = 200 -- Decrease update time
opt.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds)

opt.virtualedit = "block" -- allow cursor to move where there is no text in visual block mode

opt.wildmode = "longest:full,full" -- command-line completion mode

opt.winminwidth = 5

opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.splitkeep  = "screen"

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-options-guide`
opt.list = true
opt.listchars = {
    -- tab   = "» ",
    tab   = "· ",
    trail = "·",
    nbsp  = "␣",
}

-- opt.inccommand = "split" -- Preview substitutions live, as you type!
opt.inccommand = "nosplit" -- preview incremental substitute

opt.jumpoptions = "view"

-- Show which line your cursor is on
opt.cursorline = false

opt.scrolloff     = 10 -- minimal number of screen lines to keep above and below the cursor
opt.sidescrolloff = 20 -- minimal number of screen columns either side of cursor if wrap is `false`

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
opt.confirm = true

opt.autowrite = true -- enable auto write

opt.sessionoptions = {
    "buffers",
    "curdir",
    "tabpages",
    "winsize",
    "help",
    "globals",
    "skiprtp",
    "folds",
}

opt.shiftround  = true
opt.shiftwidth  = 4 -- the number of spaces inserted for each indentation
opt.softtabstop = 4 -- Number of spaces that a tab counts for while performing editing operations
opt.tabstop     = 4 -- insert n spaces for a tab
-- opt.expandtab = true -- convert tabs to spaces
opt.autoindent  = true -- copy indent from current line when starting new one
opt.smartindent = true -- make indenting smarter again

opt.spelllang = { "en" }

opt.wrap      = false -- display lines as one long line
opt.linebreak = true  -- companion to wrap don't split words

opt.numberwidth   = 4     -- set number column width to 2 {default 4}
opt.termguicolors = true  -- set termguicolors to enable highlight groups
opt.background    = "dark"

opt.backspace = "indent,eol,start" -- allow backspace on

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
    opt.clipboard = "unnamedplus"
end)

-- opt.laststatus = 3 -- global statusline
opt.fillchars = {
    -- vert      = "⁚",
    -- vertleft  = "⁚",
    -- vertright = "⁚",
    -- verthoriz = "⁚",
    vert      = " ",
    vertleft  = " ",
    vertright = " ",
    verthoriz = " ",

    -- horiz     = "⋅",
    -- horizup   = "⋅",
    -- horizdown = "⋅",
    horiz     = " ",
    horizup   = " ",
    horizdown = " ",

    -- foldopen  = "",
    -- foldclose = "",
    -- fold      = " ",
    -- foldsep   = " ",
    -- diff      = "╱",

    eob = " ",
}
-- opt.foldlevel  = 99
-- opt.foldmethod = "indent"
-- opt.foldtext   = ""

opt.swapfile    = false
opt.backup      = false
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

-- opt.hlsearch = false -- Set highlight on search

opt.completeopt = "menu,menuone,noselect" -- Set completeopt to have a better completion experience

opt.whichwrap = "bs<>[]hl" -- which "horizontal" keys are allowed to travel to prev/next line

opt.showtabline = 2 -- always show tabs

opt.pumblend  = 10 -- pop up blend
opt.pumheight = 10 -- pop up menu height

-- opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions

opt.fileencoding = "utf-8" -- the encoding written to a file

opt.cmdheight = 1 -- more space in the neovim command line for displaying messages

-- opt.shortmess:append "c" -- don't give |ins-completion-menu| messages
opt.shortmess:append({ W = true, I = true, c = true, C = true })

opt.iskeyword:append "-" -- hyphenated words recognized by searches

opt.formatoptions = "jcroqlnt"
-- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth',
-- hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode.
-- opt.formatoptions:remove { "c", "r", "o" }

opt.grepformat = "%f:%l:%c:%m"
opt.grepprg    = "rg --vimgrep"

opt.runtimepath:remove "/usr/share/vim/vimfiles" -- separate vim plugins from neovim in case vim still in use


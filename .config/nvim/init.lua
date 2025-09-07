--[[
    Use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

    If you experience any errors while trying to install plugins, run `:checkhealth` for more info.
--]]

require("options")
require("keymaps")
-- require("autocmds")
require("lazy-init")
require("colorscheme")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

-- Inspired by
-- https://github.com/hendrikmi/dotfiles/tree/main/nvim
-- https://github.com/josean-dev/dev-environment-files/tree/main/.config/nvim
-- https://github.com/vimichael/my-nvim-config
-- https://github.com/nvim-lua/kickstart.nvim

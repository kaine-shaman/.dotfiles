vim.g.mapleader      = " "
vim.g.maplocalleader = "\\"

local keymap = vim.keymap

local opts = { noremap = true, silent = true }

-- disable the spacebar key's default behavior in Normal and Visual modes
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- better up/down, allow moving the cursor through wrapped lines with j, k
keymap.set({ "n", "x" }, "j"     , "v:count == 0 ? 'gj' : 'j'", {
    desc = "Down",
    silent = true,
    expr = true,
})
keymap.set({ "n", "x" }, "k"     , "v:count == 0 ? 'gk' : 'k'", { desc = "Up"  , expr = true, silent = true })
keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap.set({ "n", "x" }, "<Up>"  , "v:count == 0 ? 'gk' : 'k'", { desc = "Up"  , expr = true, silent = true })

keymap.set("n", "<leader>r", "<cmd>make<CR>", { desc = "[R]un make command", silent = true })

-- clear highlights
keymap.set("n", "<Esc>", "<cmd>noh<CR>", opts)

-- highlights under cursor
keymap.set("n", "<leader>ui", vim.show_pos, { desc = "[I]nspect Pos" })
keymap.set(
    "n",
    "<leader>uI",
    function()
        vim.treesitter.inspect_tree()
        vim.api.nvim_input("I")
    end,
    { desc = "[I]nspect Tree" }
)

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
keymap.set(
    "n",
    "<leader>ur",
    "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
    { desc = "[R]edraw / Clear hlsearch / Diff Update" }
)

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- save file
keymap.set({ "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- sort lines
keymap.set("v", "<C-s>", ":'<,'>sort<CR>", opts)

-- quit file
keymap.set("n", "<C-q>"    , "<cmd>q<CR>" , opts)
keymap.set("n", "<leader>Q", "<cmd>qa<CR>", { desc = "[Q]uit", noremap = true, silent = true })

--keywordprg
keymap.set("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "[K]eywordprg" })

-- delete single character without copying into register
keymap.set("n", "x", '"_x', opts)

-- Vertical scroll and center
keymap.set("n", "<C-d>", "<C-d>zz", opts)
keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- -- Find and center
-- keymap.set("n", "n", "nzzzv")
-- keymap.set("n", "N", "Nzzzv")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { desc = "Next Search Result", expr = true })
keymap.set("x", "n", "'Nn'[v:searchforward]"     , { desc = "Next Search Result", expr = true })
keymap.set("o", "n", "'Nn'[v:searchforward]"     , { desc = "Next Search Result", expr = true })
keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { desc = "Prev Search Result", expr = true })
keymap.set("x", "N", "'nN'[v:searchforward]"     , { desc = "Prev Search Result", expr = true })
keymap.set("o", "N", "'nN'[v:searchforward]"     , { desc = "Prev Search Result", expr = true })

-- Add undo break-points
keymap.set("i", ",", ",<c-g>u")
keymap.set("i", ".", ".<c-g>u")
keymap.set("i", ";", ";<c-g>u")

-- Buffers
keymap.set("n", "<leader>bn", "<cmd>enew<CR>"       , { desc = "Open [N]ew buffer"     , noremap = true, silent = true })
-- keymap.set("n", "<leader>bd", "<cmd>b#|bd#<CR>"     , { desc = "[D]elete"              , noremap = true, silent = true })
keymap.set("n", "<leader>bD", "<cmd>bd!<CR>"        , { desc = "[D]elete with window"  , noremap = true, silent = true })
keymap.set("n", "<leader>ba", "<cmd>%bd!<CR>"       , { desc = "Close [A]ll buffers"   , noremap = true, silent = true })
keymap.set("n", "<leader>bo", "<cmd>%bd!|e#|bd#<CR>", { desc = "Close [O]ther buffers" , noremap = true, silent = true })
keymap.set("n", "<leader>bb", "<cmd>e #<cr>"        , { desc = "Switch to Other [B]uffer" })

keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap.set("n", "<S-l>", "<cmd>bnext<cr>"    , { desc = "Next Buffer" })
keymap.set("n", "[b"   , "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap.set("n", "]b"   , "<cmd>bnext<cr>"    , { desc = "Next Buffer" })

-- Window management
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window [V]ertically"  , remap = true })
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window [H]orizontally", remap = true })
keymap.set("n", "<leader>we", "<C-w>=", { desc = "Make splits [E]qual size"   , remap = true })
keymap.set("n", "<leader>wc", "<C-w>c", { desc = "[C]lose window"             , remap = true })

-- Navigate between windows
keymap.set("n", "<BS>" , ":wincmd h<CR>", { desc = "Go to Left Window" , remap = true, silent = true })
keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "Go to Left Window" , remap = true, silent = true })
keymap.set("n", "<C-j>", ":wincmd j<CR>", { desc = "Go to Lower Window", remap = true, silent = true })
keymap.set("n", "<C-k>", ":wincmd k<CR>", { desc = "Go to Upper Window", remap = true, silent = true })
keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "Go to Right Window", remap = true, silent = true })

-- Resize window using <ctrl> arrow keys
keymap.set("n", "<C-Up>"   , "<cmd>resize +2<cr>"         , { desc = "Increase Window Height" })
keymap.set("n", "<C-Down>" , "<cmd>resize -2<cr>"         , { desc = "Decrease Window Height" })
keymap.set("n", "<C-Left>" , "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- Tabs
-- keymap.set("n", "<leader>ot", ":tabnew<CR>"  , { noremap = true, silent = true, desc = "Open new [T]ab" })
-- keymap.set("n", "<leader>tf", ":tabnew %<CR>", { noremap = true, silent = true, desc = "Open current buffer in new tab" })
-- keymap.set("n", "<leader>ct", ":tabclose<CR>", { noremap = true, silent = true, desc = "Close current [T]ab" })
-- keymap.set("n", "]t"        , ":tabn<CR>"    , { noremap = true, silent = true, desc = "Go to next [T]ab" })
-- keymap.set("n", "[t"        , ":tabp<CR>"    , { noremap = true, silent = true, desc = "Go to previous [T]ab" })
keymap.set("n", "<leader><tab>l"    , "<cmd>tablast<cr>"    , { desc = "[L]ast Tab" })
keymap.set("n", "<leader><tab>o"    , "<cmd>tabonly<cr>"    , { desc = "Close [O]ther Tabs" })
keymap.set("n", "<leader><tab>f"    , "<cmd>tabfirst<cr>"   , { desc = "[F]irst Tab" })
keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>"     , { desc = "New Tab" })
keymap.set("n", "<leader><tab>]"    , "<cmd>tabnext<cr>"    , { desc = "Next Tab" })
keymap.set("n", "<leader><tab>["    , "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
keymap.set("n", "<leader><tab>d"    , "<cmd>tabclose<cr>"   , { desc = "Close Tab" })

-- Toggle line wrapping
keymap.set("n", "<leader>tw", "<cmd>set wrap!<CR>", { noremap = true, silent = true, desc = "Line [W]rapping" })

-- Press jk fast to exit insert mode
keymap.set("i", "jj", "<ESC>", opts)
keymap.set("i", "jk", "<ESC>", opts)
keymap.set("i", "kj", "<ESC>", opts)
keymap.set("i", "kk", "<ESC>", opts)

-- Stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Move Lines
keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>=="                  , { desc = "Move Down" })
keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>=="            , { desc = "Move Up" })
keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi"                                  , { desc = "Move Down" })
keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi"                                  , { desc = "Move Up" })
keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv"      , { desc = "Move Down" })
keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })
-- keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
-- keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Keep last yanked when pasting
-- keymap.set("v", "p", '"_dP', opts)

-- Replace word under cursor
keymap.set("n", "<leader>j", "*``cgn", { noremap = true, silent = true, desc = "Replace word under cursor" })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Explicitly yank to system clipboard (highlighted and entire row)
keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "[Y]ank to clipboard" })
keymap.set({ "n"      }, "<leader>Y", [["+Y]], { desc = "Yank entire row to clipboard" })

keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Toggle diagnostics
local diagnostics_active = true
keymap.set("n", "<leader>td", function()
    diagnostics_active = not diagnostics_active
    vim.diagnostic.enable(diagnostics_active)
end, { desc = "[D]iagnostics" })

-- Diagnostic
keymap.set("n", "<leader>xo", vim.diagnostic.open_float, { desc = "[O]pen floating diagnostic message" })
keymap.set("n", "<leader>xf", vim.diagnostic.setloclist, { desc = "Open diagnostic quick[F]ix list" })
local diagnostic_goto = function(next, severity)
    local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
    severity = severity and vim.diagnostic.severity[severity] or nil
    return function()
        go({ severity = severity })
    end
end
keymap.set("n", "]d", diagnostic_goto(true)          , { desc = "Next Diagnostic" })
keymap.set("n", "[d", diagnostic_goto(false)         , { desc = "Prev Diagnostic" })
keymap.set("n", "]e", diagnostic_goto(true, "ERROR") , { desc = "Next Error" })
keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
keymap.set("n", "]w", diagnostic_goto(true, "WARN")  , { desc = "Next Warning" })
keymap.set("n", "[w", diagnostic_goto(false, "WARN") , { desc = "Prev Warning" })

-- location list
keymap.set("n", "<leader>xl", function()
  local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Location List" })

-- quickfix list
keymap.set("n", "<leader>xq", function()
  local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Quickfix List" })

keymap.set("n", "[q", '<cmd>cprev<cr>', { desc = "Previous Quickfix" })
keymap.set("n", "]q", '<cmd>cnext<cr>', { desc = "Next Quickfix" })

-- Save and load session
-- keymap.set("n", "<leader>bs", ":mksession! .session.vim<CR>", opts)
-- keymap.set("n", "<leader>br", ":source .session.vim<CR>"    , opts)

-- native snippets. only needed on < 0.11, as 0.11 creates these by default
if vim.fn.has("nvim-0.11") == 0 then
    keymap.set("s", "<Tab>", function()
        return vim.snippet.active({ direction = 1 }) and "<cmd>lua vim.snippet.jump(1)<cr>" or "<Tab>"
    end, { expr = true, desc = "Jump Next" })
    keymap.set({ "i", "s" }, "<S-Tab>", function()
        return vim.snippet.active({ direction = -1 }) and "<cmd>lua vim.snippet.jump(-1)<cr>" or "<S-Tab>"
    end, { expr = true, desc = "Jump Previous" })
end

keymap.set("n", "<M-m>", '<cmd>MarksQFListAll<cr>', { desc = "Show all marks" })

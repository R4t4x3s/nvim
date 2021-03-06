local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
keymap("", "s", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Quality of life
keymap("n","<C-s>","<cmd>w!<CR>",opts)
keymap("n","<C-q>","<cmd>q!<CR>",opts)
keymap("n","q","<cmd>q<CR>",opts)
keymap("n","<C-w>","<cmd>Bdelete<CR>",opts)
keymap("n", "<leader>s","<cmd>SymbolsOutline<CR>", opts) -- prevents this anonoying Recording that i can't use for now
keymap("n","<C-d>","*",opts) -- search word under cursor

-- Split Window
keymap("n", "ss", ":split<CR><C-w>", opts)
keymap("n", "sv", ":vsplit<CR><C-w>", opts)
-- Navigate Windows
keymap("n", "sh", "<C-w>h", opts)
keymap("n", "sj", "<C-w>j", opts)
keymap("n", "sk", "<C-w>k", opts)
keymap("n", "sl", "<C-w>l", opts)
-- Resizing windows
keymap("n", "s<c-l>", "<C-w><", opts)
keymap("n", "s<c-h>", "<C-w>>", opts)
keymap("n", "s<c-j>", "<C-w>-", opts)
keymap("n", "s<c-k>", "<C-w>+", opts)


-- Terminal Apps
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<cr>", opts)
keymap("n", "<C-t>", "<cmd>ToggleTerm<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)


-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)

-- Escape --
-- Handled amazingly by better_escape plugin
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Fuzzy search

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and downopts
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
keymap("t", "<C-t>", "<cmd>ToggleTerm<cr>", opts)
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
keymap("n", "<C-p>", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<C-f>", "<cmd>lua require'telescope.builtin'.live_grep(require('telescope.themes').get_dropdown({ previewer = notfalse }))<cr>", opts)
keymap("n","<leader>f","<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ previewer = notfalse }))<CR>",opts)
keymap("n","gw","<cmd>Telescope grep_string<CR>",opts)
-- keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- File Explorer 
keymap("n", "<leader>e", "<cmd>lua _VFILER_EXPLORER()<cr> ", opts)
keymap("n", "sf", "<cmd>lua _VFILER_DEFAULT()<cr> ", opts)

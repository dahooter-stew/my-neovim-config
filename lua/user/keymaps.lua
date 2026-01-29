local opts = { noremap = true, silent = true } 

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-Left>", "<C-w>h", opts)
keymap("n", "<C-Down>", "<C-w>j", opts)
keymap("n", "<C-Up>", "<C-w>k", opts)
keymap("n", "<C-Right>", "<C-w>l", opts)

keymap("n", "<C-A-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-A-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-A-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-A-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

keymap("i", "zx", "<ESC>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

keymap("v", "p", '"_dP', opts)

keymap("n", "<C-l>", "<C-d>zz", opts)
keymap("n", "<C-h>", "<C-u>zz", opts)

keymap("n", "<C-k>", "<C-y>", opts)
keymap("n", "<C-j>", "<C-e>", opts)

keymap("n", "<leader>f", "<cmd>lua require 'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>", opts)
keymap("n", "<C-t>", "<cmd>Telescope live_grep<CR>", opts)

keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

keymap("n", "<leader>/", "<cmd>lua require('Comment').toggle()<CR>", opts)

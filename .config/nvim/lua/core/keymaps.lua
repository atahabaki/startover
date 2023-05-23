vim.g.mapleader = " "

local k = vim.keymap
-- options
local o = { noremap = true, silent = true }
-- terminal options
local to = { noremap = true, silent = true }

-- splits
k.set("n", "<leader>sv", "<C-w>v", o)
k.set("n", "<leader>sh", "<C-w>s", o)
k.set("n", "<leader>se", "<C-w>=", o)
k.set("n", "<leader>sx", ":close<CR>", o)
-- to left
k.set("n", "<leader><left>", "<C-w><C-h>", o)
k.set("n", "<leader>h", "<C-w><C-h>", o)
-- to right
k.set("n", "<leader><right>", "<C-w><C-l>", o)
k.set("n", "<leader>l", "<C-w><C-l>", o)
-- to up
k.set("n", "<leader><up>", "<C-w><C-k>", o)
k.set("n", "<leader>k", "<C-w><C-k>", o)
-- to down
k.set("n", "<leader><down>", "<C-w><C-j>", o)
k.set("n", "<leader>j", "<C-w><C-j>", o)

-- tabs
k.set("n", "<leader>to", ":tabnew<CR>", o)
k.set("n", "<leader>tx", ":tabclose<CR>", o)
k.set("n", "<leader>tn", ":tabn<CR>", o)
k.set("n", "<leader>tp", ":tabp<CR>", o)

-- buffers
k.set("n", "<leader>bn", ":bnext<CR>", o)
k.set("n", "<leader>bp", ":bprevious<CR>", o)

-- terminal
k.set("t", "<C-h>", "<C-\\><C-N><C-w>h", to)
k.set("t", "<C-j>", "<C-\\><C-N><C-w>j", to)
k.set("t", "<C-k>", "<C-\\><C-N><C-w>k", to)
k.set("t", "<C-l>", "<C-\\><C-N><C-w>l", to)

-- stay in visual mode
k.set("v", "<", "<gv", o)
k.set("v", ">", ">gv", o)
-- move text up and down
k.set("v", "<A-j>", ":m .+1<CR>==", o)
k.set("v", "<A-k>", ":m .-2<CR>==", o)
k.set("v", "p", '"_dP', o)
-- stay in visual mode
k.set("x", "J", ":move '>+1<CR>gv-gv", o)
k.set("x", "K", ":move '<-2<CR>gv-gv", o)
k.set("x", "<A-j>", ":move '>+1<CR>gv-gv", o)
k.set("x", "<A-k>", ":move '<-2<CR>gv-gv", o)

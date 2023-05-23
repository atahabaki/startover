local o = vim.opt

-- line numbers
o.relativenumber = true
o.number = true
o.numberwidth = 1

-- tabs & indentations
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.smartindent = true
o.autoindent = true
o.copyindent = true

-- line wrap
o.wrap = false

-- search
o.hlsearch = true
o.ignorecase = true
o.smartcase = true

-- colors
o.termguicolors = true
o.background = "dark"

-- appearance
o.signcolumn = "yes"
o.showmode = false -- prevent --INSERT-- etc. from showing up.
o.showtabline = 2
o.cursorline = true

-- clipboard
o.clipboard:append("unnamedplus")

-- splits
o.splitright = true
o.splitbelow = true

-- keyword
o.iskeyword:append("-")

-- keymaps
o.timeoutlen = 300 -- timer to catch keymap, 1000ms is default.

-- backup
o.backup = false
o.swapfile = false
o.writebackup = false
o.undofile = true

-- completion
o.updatetime = 400 -- in ms. 4000ms.

-- encoding
o.fileencoding = "utf-8"

-- check whether packer is installed or not.
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- compile packer everytime this file changes.
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost pluginßetup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer via protected call
local success, packer = pcall(require, "packer")
if not success then
	return
end

-- packages
return packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'
	-- completion
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lua'
	-- snippets
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	-- colorscheme
	use { "catppuccin/nvim", as = "catppuccin" }
	-- lualine
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	use 'arkav/lualine-lsp-progress'
	-- lsp
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
		run = ":MasonUpdate" -- :MasonUpdate updates registry contents
	}
	-- rust tools
	use 'simrat39/rust-tools.nvim'
	-- treesitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate"
	}
	-- telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{'nvim-lua/plenary.nvim'},
			{'nvim-tree/nvim-web-devicons', opt = true},
			{'nvim-treesitter/nvim-treesitter', opt = true}
		}
	}
	-- autopairs
	use 'windwp/nvim-autopairs'
	-- comments
	use 'numToStr/Comment.nvim'
	-- git
	use 'lewis6991/gitsigns.nvim'
	-- justfiles
	use 'NoahTheDuke/vim-just'
	-- todos
	use {
	  "AmeerTaweel/todo.nvim",
    requires = "nvim-lua/plenary.nvim"
  }
	-- after the packages.
	if packer_bootstrap then
    require('packer').sync()
  end
end)

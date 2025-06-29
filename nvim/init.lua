local data_dir = vim.fn.stdpath('data')
if vim.fn.empty(vim.fn.glob(data_dir .. '/site/autoload/plug.vim')) == 1 then
	vim.cmd('silent !curl -fLo ' .. data_dir .. '/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
	vim.o.runtimepath = vim.o.runtimepath
	vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

vim.opt.termguicolors = true -- this is to fix a treesitter error

local vim = vim
local Plug = vim.fn['plug#']

-- here we are installing all of the plugins
vim.call('plug#begin')

Plug('goolord/alpha-nvim')
Plug('catppuccin/nvim', {['as'] = 'catppuccin'})
Plug('nvim-tree/nvim-web-devicons') --pretty icons
Plug('windwp/nvim-autopairs') --autopairs
Plug('nvim-tree/nvim-tree.lua') --file explorer
Plug('ibhagwan/fzf-lua') --fuzzy finder and grep
Plug('lewis6991/gitsigns.nvim') --git
Plug('norcalli/nvim-colorizer.lua') --color highlight
Plug('nvim-lualine/lualine.nvim') --statusline
Plug('folke/which-key.nvim') --mappings popup
Plug('romgrk/barbar.nvim') -- tabs
Plug('nvim-treesitter/nvim-treesitter') --improved syntax
Plug('nvim-tree/nvim-tree.lua')
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')
Plug('L3MON4D3/LuaSnip')

vim.call('plug#end')

-- here we moving the plugin config to other files
require('plugins.alpha') -- home dashboard
require('plugins.autopairs') -- auto do pairs
require('plugins.fzf-lua') -- fzf
require('plugins.gitsigns') -- show git status in file
require('plugins.lualine') -- status line
require('plugins.whichkey')
require('plugins.barbar')
require('plugins.treesitter')
require('plugins.colorizer')
require('plugins.nvim-tree')
require('plugins.mason-lsp')
require('plugins.cmp')

-- here we move regular config to other files
require('config.theme')
require('config.options')
require('config.mappings')
require('config.autocmd')

load_theme()


local data_dir = vim.fn.stdpath('data')
if vim.fn.empty(vim.fn.glob(data_dir .. '/site/autoload/plug.vim')) == 1 then
	vim.cmd('silent !curl -fLo ' .. data_dir .. '/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
	vim.o.runtimepath = vim.o.runtimepath
	vim.cmd('autocmd VimEnter * PlugInstall --sync | source $MYVIMRC')
end

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

vim.call('plug#end')

-- here we moving the plugin config to other files
require("plugins.alpha")
require("plugins.autopairs")
require("plugins.fzf-lua")
require("plugins.gitsigns")
require("plugins.lualine")

-- here we move regular config to other files
require("config.theme")

load_theme()


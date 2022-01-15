set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

 Plug 'tpope/vim-surround'
 Plug 'mbbill/undotree'
 Plug 'preservim/nerdtree'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'scrooloose/nerdcommenter'
 Plug 'Xuyuanp/nerdtree-git-plugin'
 Plug 'dense-analysis/ale'
 Plug 'kien/ctrlp.vim'
 Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

nmap <C-n> :NERDTreeToggle<CR>


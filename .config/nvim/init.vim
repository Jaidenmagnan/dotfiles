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
set noshowmode

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

 Plug 'itchyny/lightline.vim'
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
set laststatus=2
colorscheme dracula
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
autocmd Filetype java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <F9> :make<Return>:copen<Return>
map <F10> :cprevious<Return>
map <F11> :cnext<Return>

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

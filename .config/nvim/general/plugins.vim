call plug#begin('~/.config/nvim/plugged')
    Plug 'tpope/vim-commentary'" Comment code
    Plug 'sheerun/vim-polyglot'" Syntax support
    Plug 'jiangmiao/auto-pairs'" Autopairs
    Plug 'scrooloose/NERDTree'" File explorer
    Plug 'ryanoasis/vim-devicons'" Icons
    Plug 'neoclide/coc.nvim', {'branch': 'release'}" Intellisense
    Plug 'Yggdroot/indentLine' " Indent guides
    Plug 'mhinz/vim-signify' " Git integration
    Plug 'alvan/vim-closetag' " Autoclose tags
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'} " Ranger
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }" Fzf
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }" Prettier
    " Themes
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'joshdick/onedark.vim'
    Plug 'kaicataldo/material.vim'
    Plug 'tomasiser/vim-code-dark'
    Plug 'crusoexia/vim-monokai'
    Plug 'ayu-theme/ayu-vim'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'tpope/vim-surround'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'jiangmiao/auto-pairs'
    Plug 'machakann/vim-sandwich'
    Plug 'arcticicestudio/nord-vim'
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
    Plug 'kyoz/purify', { 'rtp': 'vim' }
    Plug 'kwsp/halcyon-neovim'
call plug#end()

" Remap escape
nnoremap <C-c> <Esc>
inoremap jk <Esc>
inoremap kj <Esc>
inoremap jj <Esc>
inoremap kk <Esc>

" Use alt + hjkl to resize windows
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit and save
nnoremap <C-q> :wq!<CR>

" Close current buffer
nnoremap <C-b> :bd<CR>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

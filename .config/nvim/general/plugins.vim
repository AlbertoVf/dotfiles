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
    Plug 'norcalli/nvim-colorizer.lua' "Colorized
    Plug 'machakann/vim-sandwich'
    Plug 'tpope/vim-surround'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'airblade/vim-gitgutter' "git
    " Themes
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ayu-theme/ayu-vim'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'arcticicestudio/nord-vim'
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
    Plug 'drewtempelmeyer/palenight.vim'
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


"
" Plugin Config
"

"explorer
nmap <Leader>e :CocCommand explorer<CR>

"indentLine
let g:indentLine_setColors = 239
let g:indentLine_char = '¦'

" NERDTree
" map <Leader>n :NERDTreeToggle<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Prettier
map <Leader>p :Prettier<CR>

" rnvimr
" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1
nmap <space>r :RnvimrToggle<CR>

" vim commentary
nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>

" nvim colorizer
lua require'colorizer'.setup()

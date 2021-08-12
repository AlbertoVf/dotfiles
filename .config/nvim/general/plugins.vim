call plug#begin('~/.config/nvim/plugged')

  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  Plug 'kassio/neoterm' "terminal
  "Plug 'preservim/nerdcommenter'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'terryma/vim-multiple-cursors'
  Plug 'vuciv/vim-bujo' "todo list

  " syntax {
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }" Prettier
    Plug 'sheerun/vim-polyglot'" Syntax support
    Plug 'dense-analysis/ale' "linter
    Plug 'neoclide/coc.nvim', {'branch': 'release'}" Intellisense
    Plug 'mattn/emmet-vim'
    Plug 'zxqfl/tabnine-vim'
    Plug 'klen/python-mode'
    Plug 'pangloss/vim-javascript'
    Plug 'vim-ruby/vim-ruby'
    Plug 'mxw/vim-jsx'
    Plug 'fatih/vim-go'
    Plug 'plasticboy/vim-markdown'
    Plug 'leafgarland/typescript-vim'
    Plug 'elzr/vim-json'
    Plug 'rust-lang/rust.vim'
    Plug 'hail2u/vim-css3-syntax'
    Plug 'cakebaker/scss-syntax.vim'
    Plug 'ekalinin/dockerfile.vim'
    Plug 'stanangeloff/php.vim'
    Plug 'chrisbra/csv.vim'

  " }

  " git {
    Plug 'airblade/vim-gitgutter' "git
    Plug 'mhinz/vim-signify' " Git integration
    Plug 'tpope/vim-fugitive' " git

  " }

  " file explorer{
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }" Fzf
    "Plug 'kevinhwang91/rnvimr', {'do': 'make sync'} " Ranger
    Plug 'scrooloose/NERDTree'" File explorer
  "}

  " Formater{
    "Plug 'airblade/vim-rooter'
    Plug 'alvan/vim-closetag' " Autoclose tags
    Plug 'Yggdroot/indentLine' " Indent guides
    Plug 'editorconfig/editorconfig-vim'
    Plug 'jiangmiao/auto-pairs'" Autopairs
    Plug 'tpope/vim-commentary'" Comment code
    Plug 'tpope/vim-surround'
  " }

  " interface{
    Plug 'vim-airline/vim-airline-themes'
    Plug 'vim-airline/vim-airline'
    Plug 'frazrepo/vim-rainbow'
    Plug 'ryanoasis/vim-devicons'" Icons
    Plug 'norcalli/nvim-colorizer.lua' "Colorized
    Plug 'arcticicestudio/nord-vim'
    Plug 'ayu-theme/ayu-vim'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'Badacadabra/vim-archery'
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
  " }

call plug#end()

"
" Plugin Config
"

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

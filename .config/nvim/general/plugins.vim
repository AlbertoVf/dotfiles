call plug#begin('~/.config/nvim/plugged')

  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'terryma/vim-multiple-cursors'

  " syntax {
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }" Prettier
    Plug 'sheerun/vim-polyglot'" Syntax support
    Plug 'dense-analysis/ale' "linter
    Plug 'neoclide/coc.nvim', {'branch': 'release'}" Intellisense
    Plug 'mattn/emmet-vim'
    Plug 'zxqfl/tabnine-vim'
    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
    Plug 'othree/javascript-libraries-syntax.vim'
    Plug 'fatih/vim-go'
    Plug 'rust-lang/rust.vim'
    Plug 'hail2u/vim-css3-syntax'
    Plug 'tpope/vim-haml'
    Plug 'ekalinin/dockerfile.vim'
    Plug 'stanangeloff/php.vim'
    Plug 'chrisbra/csv.vim'
    Plug 'moll/vim-node'
    Plug 'junegunn/vim-easy-align'
    Plug 'matze/vim-move'
    Plug 'tpope/vim-markdown'
  " }

  " git {
    Plug 'mhinz/vim-signify' " Git integration
    Plug 'tpope/vim-fugitive' " git

  " }

  " file explorer{
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }" Fzf
    "Plug 'kevinhwang91/rnvimr', {'do': 'make sync'} " Ranger
    Plug 'scrooloose/NERDTree'" File explorer
  "}

  " Formater{
    Plug 'airblade/vim-rooter'
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
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
  " }

call plug#end()

"
" Plugin Config
"
"indentLine
let g:indentLine_setColors = 239
let g:indentLine_char = ':'

" rnvimr
" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1

" nvim colorizer
lua require'colorizer'.setup()

"Plug 'matze/vim-move'
let g:move_key_modifier = 'C'
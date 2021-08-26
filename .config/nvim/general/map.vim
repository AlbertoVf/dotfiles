

" Remap escape{
    nnoremap <C-c> <Esc>
    inoremap jk <Esc>
    inoremap kj <Esc>
    inoremap jj <Esc>
    inoremap kk <Esc>
" }

" Use alt + hjkl to resize windows{
    nnoremap <M-j> :resize -2<CR>
    nnoremap <M-k> :resize +2<CR>
    nnoremap <M-h> :vertical resize -2<CR>
    nnoremap <M-l> :vertical resize +2<CR>
" }

" Alternate way to save{
    nnoremap <C-s> :w<CR>
" }

" Alternate way to quit and save{

    nnoremap <C-q> :wq!<CR>
" }

" Close current buffer{
    nnoremap <C-b> :bd<CR>
" }

" Better tabbing{
    vnoremap < <gv
    vnoremap > >gv
" }

" Move selected line / block of text in visual mode{
    " shift + k to move up
    " shift + j to move down
    xnoremap K :move '<-2<CR>gv-gv
    xnoremap J :move '>+1<CR>gv-gv
" }

" Better window navigation{
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-l> <C-w>l
" }

"explorer{
    nmap <Leader>e :CocCommand explorer<CR>
" }

" NERDTree {
    " map <Leader>n :NERDTreeToggle<CR>
    nnoremap <leader>n :NERDTreeFocus<CR>
    nnoremap <C-n> :NERDTree<CR>
    nnoremap <C-t> :NERDTreeToggle<CR>
    nnoremap <C-f> :NERDTreeFind<CR>
" }

" Prettier{
    map <Leader>p :Prettier<CR>
" }

" rnvimr{
    nmap <space>r :RnvimrToggle<CR>
" }

" vim commentary{
    nnoremap <space>/ :Commentary<CR>
    vnoremap <space>/ :Commentary<CR>
" }

" EasyAlign{
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
" }

"Plug 'matze/vim-move' {
    nmap <C-k> Move current line/selections up
    nmap <C-j> Move current line/selections down
" }
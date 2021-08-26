au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+;
function! OpenTerminal()
    split term://zsh
    resize 10
endfunction
nnoremap <c-C> :call OpenTerminal()<CR>

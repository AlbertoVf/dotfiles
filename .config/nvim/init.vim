" General
" checks if your terminal has 24-bit color support
if (has("termguicolors"))
  set termguicolors
endif
syntax on

source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/plugins.vim
" Plugins
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/markdown-preview.vim
source $HOME/.config/nvim/plug-config/multicursor.vim
source $HOME/.config/nvim/plug-config/nerdcommenter.vim
source $HOME/.config/nvim/plug-config/signify.vim
source $HOME/.config/nvim/plug-config/vim-closetag.vim

" Themes. Change source location to change theme
source $HOME/.config/nvim/themes/airline.vim
source $HOME/.config/nvim/themes/archery.vim

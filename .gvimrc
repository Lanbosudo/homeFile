source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

if executable("vimtweak.dll")
    autocmd guienter * call libcallnr("vimtweak.dll","SetAlpha",230)
endif 

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set guifont=Hack:h8

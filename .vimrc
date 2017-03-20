source ~/vimSource/vimrc_example.vim
" source ~/vimSource/mswin.vim
" behave mswin

" original settings, including nocompatible and filetype and syntax...
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

" set language (vim80 set language to chinese)
set langmenu=en_GB.UTF-8

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
syntax on
set hlsearch

" colorschem vividchalk
" let g:solarized_termcolors=16
set t_Co=256
" syntax enable
set background=dark
colorscheme solarized

" file encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" remap the ESC and leader key(used for replace Ctrl)
let mapleader = ","
imap jk <esc>
"imap <leader>n <C-n>
cmap jk <C-C>
nmap ; :
nmap <leader>z zz
nmap <leader>r <C-r>
nmap <leader>w <C-w>
nmap <leader>y <C-y>
nmap <leader>e <C-e>
" stop 'Z''Z' from closing file without saving
nmap ZZ zz
nnoremap <leader>cd :lcd %:p:h<CR>:pwd<CR>

set history=50        " keep 50 lines of command line history
set ruler        " show the cursor position on statuline all the time
set showcmd        " display incomplete commands
set incsearch        " do incremental searching

set number
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nobk
" set wildmenu		" show the waiting-for-selected items on statusline
"                    >_< (hard to find)
"                    prefer  now
set wildmode=list:longest
" set ignorecase

" maps about the compile
" map <F2> :!cls<CR>
map <F5> :!g++ -g -Wall % -o %<.exe <CR>
" map <F6> :!make <CR>
" map <F7> :!g++ -g -Wall *.cpp *.h -o execute.exe <CR>
" map <F8> :!gdb *.exe <CR>

" set the window size
set winheight=10
set winwidth=70

" set the closed buffer to hid instead of unactive, which makes the changes
" remains
set hidden

" disable the mouse
set mouse=""

" set the statusline
set laststatus=2

set noautochdir         " disabled for VimShell


" abbreviate for some usual commands
abbreviate nt NERDTree
abbreviate ntf NERDTreeFromBookmark
abbreviate nh nohlsearch
abbreviate sop System.out.print()
abbreviate sopl System.out.println()
abbreviate vsh VimShell

" set fold flag background black
highlight Folded guibg=black
" set to auto save and load the fold infor
au BufWinLeave _vimrc mkview
" au BufWinLeave *.h mkview
" au BufWinLeave *.cpp mkview
au BufWinLeave *+.* mkview
au BufWinEnter _vimrc silent loadview
" au BufWinEnter *.h silent loadview
" au BufWinEnter *.cpp silent loadview
au BufWinEnter *+.* silent loadview


"""""""""""""""""""""""""""""""""""""""
filetype off
" about the git or curl of vundle plugin
" set rtp+=D:/Vim/vimfiles/.vim/bundle/vundle/
" trying to move the rtp but failed
set rtp+=~/vimfiles/bundle/Vundle.vim/
call vundle#begin('~/vimfiles/bundle/')

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'
"""""""""""""""""""""""""""""""""""""""
" My Bundles here:
"
" statuline replacing powerline(not practical in cygwin)
" Plugin 'millermedeiros/vim-statline'
" not easy to use; too many functions over my head :p
" Plugin 'OmniCppComplete'
Plugin 'ajh17/VimCompletesMe'
" Plugin 'ervandew/supertab'
" auto complete with cache, not cool
" Plugin 'neocomplcache'
" Junst cannot compile and install.....TAT
" Plugin 'Valloric/YouCompleteMe'
" Track the engine (works on Vim 7.4 +)
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" Light statusline
Plugin 'vim-airline/vim-airline'
Plugin 'majutsushi/tagbar'

" vim-scripts repos
Plugin 'ctrlp.vim'
" buffer manager
Plugin 'bufexplorer.zip'
" directory tree
" Plugin 'The-NERD-tree'
" NERD_TREE plugin
" Plugin 'NERD_tree-Project'
" compile error check (installation process unkonwn)
" Plugin 'Syntastic'

" non github repos
" Plugin 'git://git.wincent.com/command-t.git'
"""""""""""""""""""""""""""""""""""""""
call vundle#end()               " required!
filetype plugin indent on     " required!
"
""""""""""""""""""""""""""""""""""""""""""
"	settings for plugin NERDTree:
"
" tell the script NERDTree to change the current working directory (CWD) for vim
" let NERDTreeChDirMode=2

" caseSensitiveSort for NERDTree
" let NERDTreeCaseSensitiveSort=1

" line number
" let NERDTreeShowLineNumbers=1

" toggles whether hidden files are displayed
" let NERDTreeShowHidden=1
"
" set the window size
" let NERDTreeWinSize=52
"
"""""""""""""""""""""""""""""""""""""""
" neocomplcache setting
" let g:neocomplcache_enable_at_startup = 1

""""""""""""""""""""""""""""""""""""""
" ctrlp option
let g:ctrlp_show_hidden = 1
let g:ctrlp_regexp = 0
let g:ctrlp_match_window_bottom = 1

""""""""""""""""""""""""""""""""""""""
" Syntastic option
" let g:syntastic_cpp_check_header = 1
" let g:syntastic_mode_map = { 'mode': 'passive',
"                            \ 'active_filetypes': ['ruby', 'php'],
"                            \ 'passive_filetypes': ['puppet'] }
"
""""""""""""""""""""""""""""""""""""""
" statline option
" let g:statline_filename_relative = 1
" let g:statline_show_charcode = 1
"
""""""""""""""""""""""""""""""""""""""
" BuffExplorer option
let g:bufExplorerShowUnlisted=1      " Show unlisted buffers.
""""""""""""""""""""""""""""""""""""""
" VimShell
" Use current directory as vimshell prompt.
" let g:vimshell_prompt_expr =
" \ 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
" let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '
""""""""""""""""""""""""""""""""""""""
" vim-airline
"let g:airline#extensions#whitespace#checks = [ 'indent', 'mixed-indent-file' ]
""""""""""""""""""""""""""""""""""""""
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<C-j>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

let g:UltiSnipsEditSplit="context"
let g:UltiSnipsSnippetsDir="~/vimfiles/bundle/vim-snippets/UltiSnips/"

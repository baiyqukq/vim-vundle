"============================================================
" \file vimrc
" \date 2016/9/21
" \author baiyqukq@163.com
" \details Install steps:
"	* ctags
"		Install
"	 	$ sudo apt-get install ctags
"	 	Generate tags for header files
"		$ ctags -R -f ~/.vim/tags/systags /usr/include /usr/local/include
"		$ ctags -R --c++-kinds=+p --fields=iaS --extra=+q -f
"		~/.vim/tags/SDL2tags /usr/include/SDL2
"	* 256-color
"		$ vi  ~/.bashrc
"		export TERM="xterm-256color"
"	* git
"		$ sudo apt install git
"	* Vundle
"		git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"============================================================

"------------------------------------------------------------
"Vundle
"------------------------------------------------------------
" Use Vim settings, rather than Vi settings
set nocompatible

filetype off		" Vundle required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.

" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'bkad/CamelCaseMotion'
Plugin 'scrooloose/nerdcommenter'
Plugin 'magic-dot-files/TagHighlight'
Plugin 'MarcWeber/vim-addon-mw-utils' " vim-snipmate required
Plugin 'tomtom/tlib_vim' " vim-snipmate required
Plugin 'honza/vim-snippets' " vim-snipmate optional
Plugin 'garbas/vim-snipmate'
Plugin 'mbbill/echofunc'
Plugin 'scrooloose/nerdtree'

" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'

" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}


" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"------------------------------------------------------------
" non-Plugin stuff
"------------------------------------------------------------
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,ucs-bom,gbk,gb18030,gb2312,cp930

" Do wrap
set nowrap

" Use mouse
set mouse=a

" Show the cursor position all the time
set ruler

" Display incomplete commands
set showcmd

" Display current edit mode
set showmode

" Do incremental searching
set incsearch
"
" Highlight search
set hlsearch

" Show line number 
set number

" Do not generate backup file
set nobackup

" Show match symbal
set showmatch

" Set tab width
set tabstop=4

" Set backspace width
set softtabstop=4

" Set << and >> command to move width
set shiftwidth=4

" C style indent
set cindent 
set cinoptions=t0

" Color scheme
"colorscheme desert
"colorscheme wombat 
"colorscheme inkpot
"colorscheme molokai
"colorscheme wombat256mod
colorscheme jellybeans

" Change background color
set background=dark

" enable modeline(Good thing)
set modeline

" Enable loading indent file for filetype
filetype indent plugin on

" Enable plugins
filetype plugin on

" Search files
let &path.="/usr/include,/usr/local/include,"

" Add tags files
"set tags+=~/.vim/tags/systags
set tags+=~/.vim/tags/SDL2tags

" FileType
autocmd BufNewFile,BufRead *.psql			set filetype=psql
autocmd BufNewFile,BufRead *.postgresql 	set filetype=postgresql
autocmd BufNewFile,BufRead *.proto			set filetype=proto
autocmd BufNewFile,BufRead *.md				set filetype=markdown

" Dictionaries
set dict+=~/.vim/dict/words_c
set dict+=~/.vim/dict/words_cpp
set dict+=~/.vim/dict/words_macro

"------------------------------------------------------------
" Omni code completion
"------------------------------------------------------------
" Enable filetype
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType c      set omnifunc=ccomplete#Complete
autocmd FileType html   set omnifunc=xmlcomplete#Complete
autocmd FileType sql	set omnifunc=sqlcomplete#Complete
autocmd FileType css	set omnifunc=csscomplete#Complete

" enable the menu
set completeopt=menuone,longest

" key map
nnoremap <silent> <F5> :!ctags -R --c++-kinds=+p --fields=iaS --extra=+q ../src<CR>

"------------------------------------------------------------
" Taglist
"------------------------------------------------------------
nnoremap <silent> <F9> :TlistToggle<CR><CR>:TlistUpdate<CR>
let g:Tlist_File_Fold_Auto_Close=1
let g:Tlist_Exit_OnlyWindow=1
let g:Tlist_Show_One_File=1
let g:Tlist_Sort_Type='name'

"------------------------------------------------------------
" EchoFunc
"------------------------------------------------------------
nnoremap <silent> <F6> :!ctags -R --fields=+lS ../src<CR>

"------------------------------------------------------------
" NERDTree
"------------------------------------------------------------
nnoremap <silent> <F10> :NERDTreeToggle ../src<CR>

"------------------------------------------------------------
" TagHighlight
"------------------------------------------------------------
nnoremap <silent> <F7> :UpdateTypesFile <CR>

"------------------------------------------------------------
" CamelCaseMotion
"------------------------------------------------------------
call camelcasemotion#CreateMotionMappings('<leader>')

"------------------------------------------------------------
" Merge
"------------------------------------------------------------
nnoremap <silent> <F8> :!ctags -R --fields=+lS --fields=iaS --c++-kinds=+p --extra=+q ../src<CR><CR>:UpdateTypesFile<CR>

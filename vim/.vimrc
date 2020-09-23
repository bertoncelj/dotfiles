" Vim configuration file 

" Maintainer: Tine Bertoncelj	<tine.bertoncelj@gmail.com>
" Last change:	2019 Jan 25




"----------------------VUNDLE INSTALL PLUGIN---------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Keep Plugin commands between vundle#begin/end.
call vundle#begin()

Plugin 'tmhedberg/SimpylFold'
Plugin 'powerline/powerline'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'majutsushi/tagbar'
"markdown open in web browser
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': 'markdown' }
"git
Plugin 'tpope/vim-fugitive'
"--------NAVIGATION-------
Plugin 'preservim/nerdtree'
"multi nerd trees in seperate tabs
Plugin 'jistr/vim-nerdtree-tabs'
"git in nerd tree
Plugin 'Xuyuanp/nerdtree-git-plugin'
"fuzzy search
Plugin 'kien/ctrlp.vim'
"----------------THEME------------"
Plugin 'NLKNguyen/papercolor-theme'
" for enhancd syntax
Plugin 'vim-python/python-syntax'
Plugin 'NLKNguyen/c-syntax.vim' 
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'pboettch/vim-cmake-syntax'
Plugin 'pprovost/vim-ps1'
"------LANGUAGE----------
"python
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on  
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"------------------------------BASIC CONFIG--------------------------------
set number relativenumber
set nu rnu 

"Copy Past outside of VIM (websites, documents)
set clipboard=unnamed

"TABS
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround

"Set mouse
set mouse=a

set autoindent
set smartindent

set smarttab

"Return to the same line left off when close vim
if has("autocmd")
   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif


"----------------------------KEY MAPPING----------------------------------
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-Enter> <C-w>=
nnoremap <C-Left> <C-w><
nnoremap <C-Right> <C-w>>
nnoremap <C-Up> <C-w>+
nnoremap <C-Down> <C-w>-

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Caps Lock as ESC
au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'


"F2 
nmap <silent> <F2> :terminal Bash<CR> 

"F3 -- F5 NERDTree open project folder
nmap <silent> <F3> :NERDTreeToggle<CR> C:\TFS\IE-MFP
nmap <silent> <F5> :NERDTreeToggle<CR> D:\tine

"F4 TagList
nmap <silent> <F4> :TagbarToggle<CR>


""""""""""""""""""""""""""""""PLUGIN CONFIG""""""""""""""""""""""""""
"::::::::::::::vim-easy-align:::::::::::::::::::
" DEMO with examples on:
" https://github.com/junegunn/vim-easy-align

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"::::::::::::::::::::::: NERDTree:::::::::::::::::::::::::::
let NERDTreeIgnore=['\.pyc$', '\~$']

"show nerdtree when starts up
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"saved sessions like mksession
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif

"NERDTree automaticly open when vim start on opening directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"Close NERDTree when only it is left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

":::::::::::::::::::::::::::::TMUX::::::::::::::::::::::::::::
"Vim-slime adding target to tmux
let g:slime_target = "tmux"

"::::::::::::::::::::::::::::PowerLine::::::::::::::::::::::::
let g:Powerline_symbols = 'fancy'


" :::::::::::::::::::::::::::EASY-FOLD:::::::::::::::::::::
" Enable folding with the spacebar
nnoremap <space> za

""""""""""""""""""""""COLORSCHEME BACKGROUND""""""""""""""""""""""
set background=light
colorscheme PaperColor
if v:progname =~? "evim"
  finish
endif



""""""""""""""""""""""""""""""LANGUAGE CONFIG"""""""""""""""""""""""""""""""
"---------------------------------PYTHON -----------------------------------
" Enable folding
set foldmethod=indent
set foldlevel=99


au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

set encoding=utf-8

" richer highlighting python from Plugin: python-syntax
let g:python_highlight_all = 1

"------------------------------------------------------

"Pathogen setting for bundle automatic install
"execute pathogen#infect()
syntax on
filetype plugin indent on

" Get the defaults that most users want.
"source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif




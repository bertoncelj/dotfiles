" Vim configuration file 

" Maintainer: Tine Bertoncelj	<tine.bertoncelj@gmail.com>
" Last change:	2019 Jan 25

" ---------- VUNDLE INSTALL PLUGIN ----------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" Keep Plugin commands between vundle#begin/end.
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
	Plugin 'itchyny/lightline.vim'
Plugin 'majutsushi/tagbar'
"git
Plugin 'tpope/vim-fugitive'

"debugger
Plugin 'puremourning/vimspector'
Plugin 'mhinz/vim-startify'

" ---------- NAVIGATION ---------- 
Plugin 'preservim/nerdtree'
"multi nerd trees in seperate tabs
Plugin 'jistr/vim-nerdtree-tabs'
"git in nerd tree
Plugin 'Xuyuanp/nerdtree-git-plugin'
"fuzzy search
Plugin 'kien/ctrlp.vim'
"hot-key commenting code
Plugin 'tpope/vim-commentary'
" Doxygen commenting 
Plugin 'vim-scripts/DoxygenToolkit.vim'
" Highlight jump words
Plugin 'unblevable/quick-scope'
" Plugin 'Konfekt/FastFold'

"---------- THEME ----------
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'morhetz/gruvbox' "background
Plugin 'joshdick/onedark.vim'
" for enhancd syntax
Plugin 'vim-python/python-syntax'
Plugin 'NLKNguyen/c-syntax.vim' 
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'pboettch/vim-cmake-syntax'
Plugin 'pprovost/vim-ps1'
"---------- LANGUAGE ----------

"python
Plugin 'vim-scripts/indentpython.vim'
" Bundle 'Valloric/YouCompleteMe'

call vundle#end()            " required
filetype plugin indent on  
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

call plug#begin('~/.vim/plugged')

"plugin on GitHub repo

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': 'markdown' }

call plug#end()            
filetype plugin indent on    

"------------------------------BASIC CONFIG--------------------------------
set number relativenumber
set nu rnu 

"set working directory to file that you editing.
" Heavy usage in grep or vimgrep, because grep looks in current directory
" not under current file in edit
set autochdir

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

"Caps Lock as ESC (Linux only)
if has('unix')
    au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
    au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
endif

"exit INSERT terminal mode
tnoremap <Esc> <C-\><C-n>

"F2 terminal bash 
nmap <silent> <F2> :terminal Bash<CR> 

"F3 -- F5 NERDTree open project folder
nmap <silent> <F3> :NERDTreeTabsToggle<CR>
nmap <silent> <F5> :NERDTreeTabsFind<CR> 

"F4 TagList
nmap <silent> <F4> :TagbarToggle<CR>

"F6 Grep word under cursor
map <F6> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>


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

""show nerdtree when starts up
"autocmd vimenter * NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

""saved sessions like mksession
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif

""NERDTree automaticly open when vim start on opening directory
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"Close NERDTree when only it is left open
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

":::::::::::::::::::::::::::::TMUX::::::::::::::::::::::::::::
"Vim-slime adding target to tmux
let g:slime_target = "tmux"
"::::::::::::::::::::::::::::PowerLine::::::::::::::::::::::::
let g:Powerline_symbols = 'fancy'


" :::::::::::::::::::::::::::EASY-FOLD:::::::::::::::::::::
" Enable folding with the spacebar
nnoremap <space> za

" :::::::::::::::::::::::::::qucik-scope:::::::::::::::::::::
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
let g:qs_hi_priority = 2

" :::::::::::::::::::::::::::STARTUP WINDOW::::::::::::::::::::::::::::

function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]


""""""""""""""""""""""COLORSCHEME BACKGROUND""""""""""""""""""""""
"set background=light

colorscheme gruvbox

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set termguicolors

if v:progname =~? "evim"
  finish
endif

""""""""""""""""""""""""""""""LANGUAGE CONFIG"""""""""""""""""""""""""""""""
"---------------------------------PYTHON -----------------------------------
" Enable folding
" set foldmethod=syntax
nmap zuz <Plug>(FastFoldUpdate)




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

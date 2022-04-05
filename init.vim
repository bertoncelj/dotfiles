" Vim configuration file 

" Maintainer: Tine Bertoncelj	<tine.bertoncelj@gmail.com>
" Last change:	2020 Dec 17

" ---------- VUNDLE INSTALL PLUGIN ----------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=C:\Users\t_bertoncelj\AppData\Local\nvim\bundle\Vundle.vim

" Keep Plugin commands between vundle#begin/end.
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" ---------- LSP ---------- 
Plugin 'neovim/nvim-lspconfig'
Plugin 'hrsh7th/nvim-compe'
Plugin 'L3MON4D3/LuaSnip'
Plugin 'glepnir/lspsaga.nvim'

" ---------- Telescope ---------- 
Plugin 'nvim-lua/popup.nvim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim'

Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 

" Logging page too choose source
Plugin 'mhinz/vim-startify'
" Doxygen commenting 
Plugin 'vim-scripts/DoxygenToolkit.vim'

" ---------- NAVIGATION ---------- 
Plugin 'preservim/nerdtree'
"multi nerd trees in seperate tabs
Plugin 'jistr/vim-nerdtree-tabs'
"git in nerd tree
Plugin 'Xuyuanp/nerdtree-git-plugin'
"fuzzy search

"---------- APPS ------------
" Markdownpreview
Plugin 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" hot-key commenting code
Plugin 'tpope/vim-commentary'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"---------- THEME ----------
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'rafamadriz/neon'
Plugin 'ryanoasis/vim-devicons'


" Currenty used
Plugin 'morhetz/gruvbox'
Plugin 'tomasr/molokai'
" for enhancd syntax
"Plugin 'vim-python/python-syntax'
"Plugin 'NLKNguyen/c-syntax.vim' 
"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'pboettch/vim-cmake-syntax'
"Plugin 'pprovost/vim-ps1'
"---------- LANGUAGE ----------
"python
Plugin 'vim-scripts/indentpython.vim'


call vundle#end()            " require
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

" Return to the same line left off when close vim
if has("autocmd")
   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif


"----------------------------KEY MAPPING----------------------------------
" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-Enter> <C-w>=
nnoremap <C-Left> <C-w><
nnoremap <C-Right> <C-w>>
nnoremap <C-Up> <C-w>+
nnoremap <C-Down> <C-w>-

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"quick save
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Find files using Telescope command-line sugar.
nmap <silent> ff :Telescope find_files<CR>
nmap <silent> fg :Telescope live_grep<CR>
nmap <silent> fb :Telescope buffers<CR>

" Caps Lock as ESC (Linux only)
if has('unix')
    au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
    au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
endif

" Exit INSERT terminal mode
tnoremap <Esc> <C-\><C-n>

" F2 terminal bash 
nmap <silent> <F2> :terminal Bash<CR> 

" F3 -- F5 NERDTree open project folder
nmap <silent> <F3> :NERDTreeTabsToggle<CR>
nmap <silent> <F5> :NERDTreeTabsFind<CR> 

" F4 TagList
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

" Do NOT use it, better to use POWER

":::::::::::::::::::::::::::::TMUX::::::::::::::::::::::::::::
" Vim-slime adding target to tmux
let g:slime_target = "tmux"

"::::::::::::::::::::::::::::PowerLine::::::::::::::::::::::::
let g:Powerline_symbols = 'fancy'


" :::::::::::::::::::::::::::EASY-FOLD:::::::::::::::::::::
" Enable folding with the spacebar
nnoremap <space> za

" :::::::::::::::::::::::::::STARTUP WINDOW::::::::::::::::::::::::::::

function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" Same as above, but show untracked files, honouring .gitignore
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
" set background=light

" Choose one:
colorscheme gruvbox
"colorscheme neon
" colorscheme darkone

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set termguicolors

if v:progname =~? "evim"
  finish
endif

""""""""""""""""""""""""""""""LANGUAGE CONFIG"""""""""""""""""""""""""""""""
"---------------------------------PYTHON -----------------------------------
" Enable folding
set foldmethod=indent
set foldlevel=99

let g:python_host_prog = 'C:\Users\t_bertoncelj\AppData\Local\Microsoft\WindowsApps\python.exe'

let g:python3_host_prog = 'C:\Users\t_bertoncelj\AppData\Local\Microsoft\WindowsApps\python3.exe'

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

lua << EOF
-- LSP-SAGA configuration
local saga = require 'lspsaga'
saga.init_lsp_saga()
EOF
"lsp provider to find the cursor word definition and reference
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
"or use command LspSagaFinder
nnoremap <silent> gh :Lspsaga lsp_finder<CR>

""rename
nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>
""or command
nnoremap <silent>gr :Lspsaga rename<CR>

""preview definition
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
""or use command
nnoremap <silent> gd :Lspsaga preview_definition<CR>

lua << EOF
require('telescope').setup{}
EOF


lua << EOF
require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
EOF


lua << EOF
require'lspconfig'.pyright.setup{}
require'lspconfig'.clangd.setup{}
EOF


lua << EOF
-- Compe setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

--This line is important for auto-import
vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', { expr = true })
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = ture,
  },
}
EOF

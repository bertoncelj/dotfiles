# pisi o temu

#GIT

"git
Plugin 'tpope/vim-fugitive'
Plugin 'puremourning/vimspector'

"hot-key commenting code
Plugin 'tpope/vim-commentary'
" Doxygen commenting 
Plugin 'vim-scripts/DoxygenToolkit.vim'

............................


# VIM & TMUX IDE setup

Portable dot configuration files to setup VIM IDE with tmux.

### Prerequisites VIM Version

* VIM - Vi IMproved 8.1 (2018 May 18, compiled Oct 10 2018 15:24:01)

* NeoVim must have 24bit colors

* Terminal where Vim is running, must support 24 bit colors


### Install  

 **Linux:** Bash terminal

  For Linux in your bash terminal run, in your dotfile:

    ./install
    
It will copy *.vimrc* into *$HOME* directory

  **Windows**: Best option to run Vim on is [NeoVim](https://neovim.io/)

  * **NeoVim** Copy content from [git repo](https://github.com/bertoncelj/dotfiles) `dotfiles/vim/.vimrc` into windows file `init.vim`


        C:\Users\T_Bertoncelj\AppData\Local\nvim\init.vim


  * **ConEmu** [ConEmu](https://conemu.github.io/) Copy content from [git repo](https://github.com/bertoncelj/dotfiles) `dotfiles/vim/.vimrc` into windows file `.vimrc` which is in LocalUser directory 


##### VIM for Windows 10 on ConEmu (obsolete, rather use [NeoVim](https://neovim.io/))

In Windows it runs in Bash terminal on [ConEmu](https://conemu.github.io/). Follow few steps to set it up:

1.) Install Bash for Windows 10, follow [site](https://www.howtogeek.com/249966/how-to-install-and-use-the-linux-bash-shell-on-windows-10/)

2.) Install [ConEmu](https://conemu.github.io/)

3.) In Bash run ./install

Remap CapsLock with ESC:

4.) For reamaping CapsLock for ESC for now its manually download [AutoHotKey](https://www.autohotkey.com/). For AutoHotKey script past simple code:

    ; AutoHotkey for VIM replace CapsLock with ESC
    ; make capslock do esc
    Capslock::ESC

Save it as vim_remap_esc.ahk and run it with AutoHotKey. It will perma replace CapsLock with Esc. 
More [details](http://ergoemacs.org/emacs/vi_remap_escape_key.html)

5.) Manually coment out in .vimrc:
   
    "Caps Lock as ESC
    "au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
    "au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
## Key Mapping

#### Short-Cuts

`Ctrl+c` copy (all/selected) content 

`<F2>` Terminal Bash

`<F3>` nerdtree toggle (file explorer) 

`<F4>` tagbar toggle (functions navigator)

`<C-HJKL>` change window 

`<C-p>` find files 

`Ctrl` + `hjkl` walk around Vim splits

#### Keys switchup

supported only on Linux Vim:

    `CapsLock` == `ESC`

## Plugins

use [**Vundle**](https://github.com/VundleVim/Vundle) to manage plugin：

In vim use `:PluginInstall` to add new plugin, `:PluginClean` delete unused plugin, `PluginList` show all used plugins.

[SimpyFold](https://github.com/tmhedberg/SimpylFold) Use `space` to close functions down

[lightline](https://github.com/itchyny/lightline.vim)  Fancy NORMAL, INSERT, VISUAL statusline

[Markdown](https://github.com/iamcco/markdown-preview.vim) For editing MarkDown files `.md`. Write `:MarkDownPreview` when you have `.md` file open in Vim

[tagbar](https://github.com/preservim/tagbar) Show sidebar funcitons in file, press `<F4>`

[vim-fugitive](https://github.com/tpope/vim-fugitive) Use git inside vim, type `:Git status`

[Debbuger](https://github.com/puremourning/vimspector) TODO: configure settings, maybe useful

[Doxygen comments](https://github.com/vim-scripts/DoxygenToolkit.vim) Create comments in doxygen style, go to function and press `:Dot`

##### Navigation

[nerdtree](https://github.com/scrooloose/nerdtree) A tree explorer plugin for vim, press `<F3>`

Plugin 'jistr/vim-nerdtree-tabs'
[vim_nerdtree-tabs](https://github.com/jistr/vim-nerdtree-tabs) TODO: figure out what does it do??

[nerdtree-git-plugin](https://github.com/Xuyuanp/nerdtree-git-plugin) TODO: figure out what does it do??

[ctrlp](https://github.com/kien/ctrlp.vim) Fuzzy file, buffer, mru, tag, etc finder, type `:Ctrlp`


TODO add: under LANGUAGE

### Color background fond style

+ Change in .vimrc or in Vim:

  `colorscheme #name` options are:

   `gruvbox`
`onedark`
`PaperColor`

+ Set light or dark theme: 

  `set backgroud=light`
 or `set backgroud=dark`

+ For enhanced syntax style for different languagles `C` `python` `markdown` `cmake` use

    `syntax on`

### Info
ALE:
[!alt text](https://raw.githubusercontent.com/w0rp/ale/master/img/example.gif)
<img src="img/example.gif?raw=true" alt="A linting example with the darkspectrum color scheme in GVim." title="A linting example with the darkspectrum color scheme in GVim.">

....

## Authors
* **Tine Bertoncelj** - *Initial work* - [GitHub](https://github.com/bertoncelj)


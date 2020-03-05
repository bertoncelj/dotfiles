# VIM & TMUX IDE setup

Portable dot configuration files to setup VIM IDE with tmux.

This project is extracted from [my dot files](https://github.com/axiaoxin/mac-dotfiles)

## Install  

For Linux in your bash terminal run, in your dotfile:

    ./install

Windows run same ./install in [ConEmu](https://conemu.github.io/) terminal for Bash terminal.

## VIM Version

VIM - Vi IMproved 8.1 (2018 May 18, compiled Oct 10 2018 15:24:01)

## VIM for Windows 10

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

## Plugins

**use vundle manage plugins**：

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

- [nerdtree](https://github.com/scrooloose/nerdtree) A tree explorer plugin for vim.
- [ctrlp](https://github.com/kien/ctrlp.vim) Fuzzy file, buffer, mru, tag, etc finder.
- [vim-surround](https://github.com/tpope/vim-surround) quoting/parenthesizing made simple
- [indentLine](https://github.com/Yggdroot/indentLine) A vim plugin to display the indention levels with thin vertical lines
- [ALE](https://github.com/w0rp/ale) ALE is a lugin for provinding linting (checking syntax and semantics)

### Info
ALE:
[!alt text](https://raw.githubusercontent.com/w0rp/ale/master/img/example.gif)
<img src="img/example.gif?raw=true" alt="A linting example with the darkspectrum color scheme in GVim." title="A linting example with the darkspectrum color scheme in GVim.">

....
### Short Keys

- copy (all/selected) content: `Ctrl+c`
- nerdtree toggle: `<F3>`
- tagbar toggle: `<F4>`
- change window: `<C-HJKL>`
- find files: `<C-p>`

## Authors

* **Tine Bertoncelj** - *Initial work* - [GitHub](https://github.com/bertoncelj)


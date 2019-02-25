# VIM & TMUX IDE setup

Portable dot configuration files to setup VIM IDE with tmux.

This project is extracted from [my dot files](https://github.com/axiaoxin/mac-dotfiles)

## Install  

In your bash terminal run, in your dotfile:

    ./install

## VIM Version

VIM - Vi IMproved 8.1 (2018 May 18, compiled Oct 10 2018 15:24:01)

### Plugins

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


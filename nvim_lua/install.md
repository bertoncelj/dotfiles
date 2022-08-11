sudo apt update && sudo apt install build-essential 
sudo apt upgrade 
sudo apt install python3 pip3 gcc lua5.4 git tree 
sudo apt install curl 
sudo apt install python 
sudo apt install npm 
sudo apt-get install software-properties - common

sudo add-apt-repository ppa: neovim-ppa/unstable 
sudo apt-get update 
sudo apt-get install neovim

sudo apt install python3-neovim

# Install manual or can easy toggle between Win or Linux https://github.com/neovim/neovim/releases/
git clone --depth 1 https://github.com/wbthomason/packer.nvim 
-/ .local/share/nvim/site/pack/packer/start/packer.nvim

#copy from dotfiles to yours .config...> 
touch -/.config/nvim/init.vim

#set up fonts 
https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Hack
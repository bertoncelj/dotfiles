#! /usr/bin/env bash

path_vimrc_f="vim/.vimrc"
path_tmux_f="tmux/.tmux.conf"

files="$path_vimrc_f $path_tmux_f"

echo "HOME : $HOME"
for file in $files; do
	name_f=$( basename "${file}" )
	
	echo $name_f
	if [ -f $HOME/$name_f ]; then

        #first run make backup directory
		if [ ! -d "$HOME/.backup_vim" ]; then
			mkdir $HOME/.backup_vim
		fi	
			
        #save backup file 
		bak_file_loc=$HOME/.backup_vim/$name_f\.backup_$(date "+%Y%m%d%H%M%S")
		echo " Backing up previous dot files settings: from $name_f to $bak_file_loc"
		mv $HOME/$name_f $bak_file_loc
		cp $file $HOME/
	else
		echo "$name_f is not added to your $HOME"
		echo "$name_f will be created at your $HOME"
		cp $file $HOME/
	fi
done

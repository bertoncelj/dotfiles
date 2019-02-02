#! /usr/bin/env bash
dir_vim="vim/.vim"


vimrc_f="vim/.vimrc"
tmux_f="tmux/.tmux.conf"

files="$vimrc_f $tmux_f"


echo "HOME : $HOME"
HOME="./test"
echo "HOME : $HOME"
for file in $files; do
	name_f=$( basename "${file}" )
	
	echo $name_f
	if [ -f $HOME/$name_f ]; then
		bak_file_loc=$HOME/$name_f\.backup_$(date "+%Y%m%d%H%M%S")
		echo " Backing up previous dot files settings: from $name_f to $bak_file_loc"
		mv $HOME/$name_f $bak_file_loc
		cp $file $HOME/
	else
		echo "$name_f is not added to your $HOME"
		echo "$name_f will be created at your $HOME"
		cp $file $HOME/
	fi
done

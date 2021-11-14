#! /usr/bin/env bash
source dbg.sh


# software to install

# PATHS
# GLOBALS
g_platform="unkonwn"
g_typeVim="unkonwn"
g_reqInstall=( "git" "vim" "tmux" "ctags") 

# Linux
# Programs
# HOME PATH
PATH_LNX_HOME=$HOME
VIM_PATH=".vimrc/"

VUNDLE_GIT_HTTPS="https://github.com/VundleVim/Vundle.vim.git"
VUNDLE_PATH="~/.vim/bundle/Vundle.vim"


# BUNDLE PATHS



function detectOperationSystem 
{

    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        g_platform="linux"
        echo "OS: LINUX"
    elif [[ "$OSTYPE" == "win32" ]]; then
        g_platform="win"
        echo "OS: WINDOWS"
    elif [[ "$OSTYPE" == "cygwin" ]]; then
        # POSIX layer compatibility layer and Linux enviroment emulation for Windows
        g_platforg_platform="win"
        echo "OS: WINDOWS"
    elif [[ "$OSTYPE" == "msys" ]]; then
        # Lightweight shell and HnU 
        g_platform="win"
        echo "OS: WINDOWS"
    else 
        #error type
        assert_HARD_fail "Can't detect operation system.
        It detected this: $OSTYPE"
    fi
}


function detectIfInBashTerminal 
{

if [ -t 1 ] ; then 
    echo "TERMINAL: terminal bash" 
else 
    assert_HARD_fail "not a terminal bash. Open in treminal bash"
fi
}

function userInputTypeVim 
{
    echo "What type of vim you wana install?"
    echo "Press number: "
    echo "1.) VIM"
    echo "2.) NEOVIM"

    read inputType

    case $inputType in 
        "1")
            g_typeVim="VIM"
            echo "Instalation for: VIM"
        ;;
        "2")
            g_typeVim="NEOVIM"
            echo "Instalation for: NEOVIM"
        ;;
        *)
            assert_HARD_fail "You can only choose 1 for Vim and 2 NeoVim"
        ;;
    esac
}

function updateAndUpgradeCommands 
{

    echo "Do you wana update & upgrade apt?"
    echo "Do you [Y/n] ?"

    read inp_upt

    if [ -z $inp_upt ] || [ $inp_upt == "Y" ]; then
        echo "Starting update!"
        sudo apt update
        echo "Starting upgrade!"
        sudo apt upgrade
    else
        echo "Apt will not be updated & upgraded!"
    fi
}

function autoInstall 
{
	program=$1
	echo "Program $program is not installed, but if you want to install it right now with command sudo apt install $program press Y or if not installation will exit delete everything done, and you must install requiered program manually."
	echo "If you want to install $program now press [Y/n]"
	read install_answ
	if [ -z $install_answ ] || [ $install_answ == "Y" ];  then
		echo "Installation will start now!"
		sudo apt install $program

	else
		echo "You choose to install $program manually!
             Come back when you done it
	         This will exit now"
		exit 1
	fi
}

function checkIfProgramsInstalled
{
	for prog in "${g_reqInstall[@]}"
	do
		echo "Testing if $prog is installed."

		if ! [ -x "$(command -v $prog )" ]; then
			msg_INFO "$prog is not installed." >&2
			autoInstall $prog
			checkIfProgramsInstalled
		fi
	done
}


function updateVimrc
{
    echo "here"
    diff -q vim/.vimrc $HOME/.vimrc 
    RTN_DIFF=$?
    
    echo $RTN_DIFF
    # detect diffrent .vimrc used to orignial
    if [[ "$RTN_DIFF" == "1" ]]; then
        echo "Differ"
        echo "------------"
        # kva pa zdej
        # copy
        ./copy_files.sh
        echo "------------"
    else
        echo "Same"
    fi

    # if [ -z "$RTN_DIFF" ]; then
    #     echo "SAME"
    #     echo "$RTN_DIFF"  
    # else
    #     echo "DIFF"
    #     echo "$RTN_DIFF"  
    # fi

}

function copy_file
{
    PATH_FROM=$1
    PATH_TO=$2

    #save backup file 
    bak_file_loc=$HOME/.backup_vim/$name_f\.backup_$(date "+%Y%m%d%H%M%S")
    echo " Backing up previous dot files settings: from $name_f to $bak_file_loc"
    mv $HOME/$name_f $bak_file_loc
    cp $PATH_FROM $PATH_TO
}


function checkFirstInstall
{

    echo "check if previous installed"

    FILE=$HOME/.vimrc
    FILE_VUNDLE=$HOME/.vim/bundle
    FILE_PLUG=$HOME/.vim/plugged
    FILE_NEOVIM_UNIX=~/.config/nvim/init.vim

    # file
    if [ -f "$FILE" ]; then 
        echo "$FILE exist"
        updateVimrc
    fi

    # directorey
    if [ -d "$FILE_VUNDLE" ]; then 
        echo "$FILE_VUNDLE exist"
    fi

    # directorey
    if [ -d "$FILE_PLUG" ]; then 
        echo "$FILE_PLUG exist"
    fi

    if [ -f "$FILE_NEOVIM_UNIX" ]; then 
        echo "$FILE_PLUG exist"
    else
        echo "does not"
    fi
}


# PLAN 

# detect change detect directories

# start
# [DONE] check if in bash terminal 
# [DONE] detect win or linux
# [DONE] ask where to install neovim or vim 
# [DONE] update commands 

# [DONE] chech if next progmras are installed


# detectIfInBashTerminal 
# detectOperationSystem 
# userInputTypeVim 
# updateAndUpgradeCommands 
# checkIfProgramsInstalled

checkFirstInstall


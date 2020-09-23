#! /usr/bin/env bash

echo "INSTALL"


#Config paths
PATH_FILE_CONF=.config

arrConfigParams=()

#creaete configure file
function assert_HARD_fail {
    echo "ERROR: $1"
    echo "FAIL installing" 
    echo "exiting installer" 
    exit 1
}

function get_OperationSystem {
    echo " chose OS "
    echo "What OS do you using?"
    echo "Press number: "
    echo "1.) LINUX"
    echo "2.) WINDOWS"

    read input_chooser

    if [ $input_chooser == "1" ]; then 
        echo "U choose Linux"
        arrConfigParams+=("LINUX")
    elif [ $input_chooser == "2" ]; then 
        arrConfigParams+=("WINDOWS")
        echo " U choose Windows"
    else 
        assert_HARD_fail "You can only choose 1 for Linux and 2 Windows"
    fi
}

function which_win_on_windows {
    echo "What are you using?"
    echo "Press number:"
    echo "1.) NenVim"
    echo "2.) BASH Terminal"
    echo "3.) gVim "

    read input

    if [ $input == "1" ]; then 
        estimeted_path="C:\Users\T_Bertoncelj\AppData\Local\nvim"
        echo "U choose NeoVim"
        arrConfigParams+=("NeoVim")
        echo "predicted path"
        echo $estimeted_path
        arrConfigParams+=("$estimeted_path")

    elif [ $input == "2" ]; then 
        echo "U choose BASH Terminal"
        estimeted_path="$HOME"
        arrConfigParams+=("BASH")
        echo "predicted path"
        echo "$estimeted_path"
        arrConfigParams+=("$estimeted_path")

    elif [ $input == "3" ]; then 
        echo "U choose gVim"
        estimeted_path="Add your path to .vimrc of gVim"
        arrConfigParams+=("BASH")
        echo "predicted path"
        echo "$estimeted_path"
        arrConfigParams+=("$estimeted_path")

    else 

        assert_HARD_fail "You can only choose 1 for Linux and 2 Windows"
    fi

}

function get_vim_path {
    echo "OS is: ${arrConfigParams[0]}"

    if [ ${arrConfigParams[0]} == "LINUX" ]; then 
        find_if_path_exist "$HOME" 
        arrConfigParams+=("BASH")
        arrConfigParams+=("$HOME")


    elif [ ${arrConfigParams[0]} == "WINDOWS" ]; then 
        echo ""
        which_win_on_windows 
    else 
        assert_HARD_fail "You can only choose 1 for Linux and 2 Windows"
    fi
}

function first_run_installer {
    get_OperationSystem
    get_vim_path

    echo ${arrConfigParams[@]}
}


#check if config file exist
if [ -f "$PATH_FILE_CONF" ];then 
    echo "$PATH_FILE_CONF was created".
else 
    echo "we create .config file in same directory"
    touch .config
    echo "VIM INSTALLER CONFIGUREATION FILE" > .config
    first_run_installer
fi




rm .config

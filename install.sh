#!/bin/bash
cyan='\033[0;36m'
orange='\033[0;33m'
NC='\033[0m'

function help {
    echo -e "${cyan}usage: ./install {emacs, mg, subl, subl-icons, vim}${NC}"
}
function warning {
    echo -e "${orange}WARNING: This will overwrite any current configuration files. Press [ENTER]"
    echo -e "to continue or [CTRL+c] to exit the script without changing any files.${NC}"
    read
}
function quit {
    echo -e "${cyan}done installing!${NC}"
    exit 1
}

# no arguments? echo help
if [[ -z $1 ]] ; then
    help
    exit 0
fi



# emacs
if [[ $1 = "emacs" ]] ; then
    warning
    echo -e "${cyan}setting up emacs...${NC}"
    ln -frvs ./prelude/ ~/.emacs.d
    quit
fi


# mg
if [[ $1 = "mg" ]] ; then
    warning
    echo -e "${cyan}setting up mg...${NC}"
    ln -frvs ./mg ~/.mg
    quit
fi

# sublime text 3
if [[ $1 = "subl" ]] ; then
    warning
    echo -e "${cyan}setting up sublime text 3...${NC}"
    ln -frvs ./subl/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/
    ln -frvs ./subl/Default\ \(Linux\).sublime-keymap ~/.config/sublime-text-3/Packages/User/
    quit
fi

# sublime text 3 icons
if [[ $1 = "subl-icons" ]] ; then
    warning
    echo -e "${cyan}replacing sublime text 3 icons...${NC}"
    sudo mv -v /opt/sublime_text_3/Icon/ /opt/sublime_text_3/Icon-backup/
    sudo cp -vr ./subl/Icon/ /opt/sublime_text_3/Icon/
    quit
fi

# vim
if [[ $1 = "vim" ]] ; then
    warning
    echo -e "${cyan}setting up vim...${NC}"
    ln -frvs ./vim ~/.vim
    ln -frvs ./vimrc ~/.vimrc
    quit
fi



# wrong arguments? echo help
help

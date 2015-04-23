#!/bin/bash
cyan='\033[0;36m'
NC='\033[0m'

# no arguments? echo help
if [[ -z $1 ]] ; then
    echo -e "${cyan}usage: ./install {all, subl, subl-icons, vim, mg}${NC}"
    echo -e "${cyan}note: subl-icons will not install if \"all\" argument is passed${NC}"
    exit 0
fi



# sublime text 3
if [[ $1 = "all" ]] || [[ $1 = "subl" ]] ; then
    echo -e "${cyan}setting up sublime text 3...${NC}"
    cp -v ./subl-preferences/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/
    cp -v ./subl-preferences/Default\ \(Linux\).sublime-keymap ~/.config/sublime-text-3/Packages/User/
    if [[ ! $1 = "all" ]] ; then
        echo -e "${cyan}done installing!${NC}"
        exit 1
    fi
fi

# sublime text 3 icons
if [[ $1 = "subl-icons" ]] ; then
    echo -e "${cyan}replacing sublime text 3 icons...${NC}"
    sudo mv -v /opt/sublime_text_3/Icon/ /opt/sublime_text_3/Icon-backup/
    sudo cp -vr ./subl-preferences/Icon/ /opt/sublime_text_3/Icon/
    if [[ ! $1 = "all" ]] ; then
        echo -e "${cyan}done installing!${NC}"
        exit 1
    fi
fi

# vim
if [[ $1 = "all" ]] || [[ $1 = "vim" ]] ; then
    echo -e "${cyan}setting up vim...${NC}"
    cp -vr ./.vim ~
    cp -v ./.vimrc ~
    if [[ ! $1 = "all" ]] ; then
        echo -e "${cyan}done installing!${NC}"
        exit 1
    fi
fi

# mg
if [[ $1 = "all" ]] || [[ $1 = "mg" ]] ; then
    echo -e "${cyan}setting up mg...${NC}"
    cp -v ./.mg ~
    if [[ ! $1 = "all" ]] ; then
        echo -e "${cyan}done installing!${NC}"
        exit 1
    fi
fi



# exit if $1 is all
if [[ $1 = "all" ]] ; then
    echo -e "${cyan}done installing!${NC}"
    exit 1
fi

# if $1 is not the list, echo help
echo -e "${cyan}usage: ./install {all, subl, vim, mg}${NC}"

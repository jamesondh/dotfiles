#!/bin/bash

# check if ST3 preferences folder exists
if [ ! -d ~/.config]; then
    mkdir ~/.config
fi
if [ ! -d ~/.config/sublime-text-3]; then
    mkdir ~/.config/sublime-text-3
fi
if [ ! -d ~/.config/sublime-text-3/Packages]; then
    mkdir ~/.config/sublime-text-3/Packages
fi
if [ ! -d ~/.config/sublime-text-3/Packages/User]; then
    mkdir ~/.config/sublime-text-3/Packages/User
fi

# link files
ln -fvs ~/.dotfiles/.sublime-text-3/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/
ln -fvs ~/.dotfiles/sublime-text-3/Default\ \(Linux\).sublime-keymap ~/.config/sublime-text-3/Packages/User/

if [ ! -d ~/.emacs.d ]; then
    git clone git@github.com:jamesondh/emacs.d ~/.emacs.d
else 
    echo -n "~/.emacs.d found. Do you wish to update? (y/n): "
    read userchoice
    case $userchoice in
        [yY] | [yY][Ee][Ss] )
            git -C ~/.emacs.d pull
            ;;
        [nN] | [n|N][O|o] )
            exit 1
            ;;
        *) echo "Invalid input"
    esac
fi

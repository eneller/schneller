#!/bin/bash
GITMIRROR=git@github.com:eneller
#----------------------------------------#



# SET UP DOTFILES
git clone --bare "$GITMIRROR/.dotfiles.git" $HOME/.dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
#TODO find a way to move files to file.old (ansible?)
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no

# Set up some basic stuff
cd ~ && mkdir -p Arbeit Code Uni Downloads/Torrent; 
cd ~/Code && git clone "$GITMIRROR/.dotfiles" dotfiles; \
  git clone "$GITMIRROR/ansible"


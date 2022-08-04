#!/bin/bash
GITMIRROR=git@github.com:eneller
#----------------------------------------#
# INSTALL i3 



# SET UP DOTFILES
git clone --bare "$GITMIRROR/.dotfiles.git" $HOME/.dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
#TODO find a way to move files to file.old (ansible?)
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no

# Set up some basic stuff
cd ~ && mkdir Code Arbeit; 
cd ~/Code && git clone "$GITMIRROR/.dotfiles" dotfiles; \
  git clone "$GITMIRROR/ansible"

# Stuff from the initial clean i3 install attempt
#install_pulse # run the manjaro pulseAudio install script
#sudo pacman -S network-manager-applet # install network manager + applet here


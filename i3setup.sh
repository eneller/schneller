#!/bin/bash

#----------------------------------------#
# This is a setup script for my custom manjaro install, based on manjaro-xfce with i3 as my main window manager.


# INSTALL i3 



# SET UP DOTFILES
git clone --bare git@github.com:eneller/.dotfiles.git $HOME/.dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
#TODO find a way to move files to file.old (ansible?)
dotfiles checkout


# Stuff from the initial clean i3 install attempt
#install_pulse # run the manjaro pulseAudio install script
#sudo pacman -S network-manager-applet # install network manager + applet here


#!/bin/bash
install_pulse # run the manjaro pulseAudio install script
git clone --bare git@github.com:eneller/.dotfiles.git $HOME/.dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout

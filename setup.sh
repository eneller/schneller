#!/bin/bash
# TODO set up ddcutil, firefox, thunderbird
packages_main=('ansible' 'git' 'i3-wm' 'xfce4-power-manager' 'nm-applet' 'blueman-applet' 'ddcutil' 'zsh' 'alacritty' 'neovim' 'firefox' 'picom' 'tmux' 'exa' 'ripgrep' 'nerd-fonts' 'bitwarden-desktop' 'joplin-appimage')
packages_aur=('anki' 'ulauncher' 'intellij-idea-ultimate-edition' 'intellij-idea-ultimate-edition-jre' 'android-sdk' 'android-sdk-platform-tools')

install_dotfiles(){
  git clone --bare git@github.com:eneller/.dotfiles.git $HOME/.dotfiles
  alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
  dotfiles config --local status.showUntrackedFiles no
  dotfiles ls-files | while read -r line; do
      mv $HOME/$line $HOME/$line.bak
  done
  dotfiles checkout
}

install_packages(){
  for item in ${packages_base[@]}; do
    echo $item
  done
}

create_directories(){
  mkdir Arbeit Code Documents Downloads Pictures Uni
}

install_yay(){
  pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  rm -rf yay/
}


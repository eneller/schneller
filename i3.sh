#!/bin/bash
# manjaro i3 settings can be found at https://gitlab.manjaro.org/profiles-and-settings/desktop-settings/-/tree/master/community/i3
# Execute basic setup first
./basic.sh
# Stuff from the initial clean i3 install attempt
#install_pulse # run the manjaro pulseAudio install script
#sudo pacman -S network-manager-applet # install network manager + applet here

# remove manjaro-i3-settings and install i3-wm (will remove i3-gaps which is a dependency of the settings)
# remove palemoon-bin, mousepad

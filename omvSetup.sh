#!/bin/bash 
# why does this not work 
sudo useradd -m en
sudo usermod -aG sudo en

# from own machine
ssh-copy-id -i sshKeyFile en@openmediavault

# remote
vi /etc/ssh/sshd_config
disable root login, password login

# enable ssl
# configure drives
# smb
# docker stuff?

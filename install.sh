#! /usr/bin/bash

#sudo echo -e "[archlinuxcn]\nSigLevel=Never\nServer = https://mirrors.ustc.edu.cn/archlinuxcn/\$arch" >> /etc/pacman.conf
# ssh
sudo pacman -S openssh
mkdir ~/.ssh
cd ~/.ssh
ssh-keygen -t rsa -C "1403341393@qq.com"
cat id_rsa.pub
# git
git clone git@github.com:178me/178me.github.io.git
git clone git@github.com:178me/My_Arch.git
# 基本base包
sudo pacman -S binutils
sudo pacman -S base-devel
# 软件
sudo pacman -S yay 
sudo pacman -S alacritty 
sudo pacman -S variety feh
sudo pacman -S compton
sudo pacman -S electron-ssr
sudo pacman -S telegram-desktop
sudo pacman -S netease-cloud-music
sudo pacman -S xorg-xbacklight
sudo pacman -S man-pages-zh_cn man-pages-zh_tw
sudo pacman -S wqy-bitmapfont wqy-microhei wqy-microhei-lite wqy-zenhei
sudo pacman -S network-manager-applet

yay -S pulseaudio-ctl
yay -S utools

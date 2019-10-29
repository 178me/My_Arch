#! /usr/bin/bash

# vim
rm -rf ~/.vim
rm ~/.vimrc
cp ~/My_Arch/.vimrc ~/.vimrc
cp ~/My_Arch/.vim ~/.vim

#i3
rm ~/.config/i3/config
cp ~/My_Arch/i3/config ~/.config/i3/config

# polybar
rm  -rf ~/.config/polybar
cp -r ~/My_Arch/polybar ~/.config/polybar

# fish
rm-r ~/.config/fish
cp -r ~/My_Arch/fish

# wallpaper
cp ~/My_Arch/wallpaper ~/wallpaper

# xmodmap
cp ~/My_Arch/.xmodmap ~/.xmodmap

# xprofile
cp ~/My_Arch/.xprofile ~/.xprofile

# hexo
git clone git@github.com:178me/178me.github.io.git
mv 178me.github.io Blog
cd Blog
git config –global user.email "1403341393@qq.com"
git config –global user.name "178me"
sudo pacman -S nodejs npm
npm config set registry https://registry.npm.taobao.org
npm install -g hexo-cli
npm install hexo-deployer-git –save






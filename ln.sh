#! /usr/bin/bash
##############################################
## 此脚本用于建立配置文件的链接，同步。。。 ##
##############################################

user=/home/yzl178me
arch=/home/yzl178me/My_Arch
cfg=/home/yzl178me/.config

fln(){
if [ $4 == 0 ]; then
    ln -f $1/$3 $2/$3
elif [ $4 == 1 ]; then
    trash-put $2/$3
    cp -r $1/$3 $2/$3
}
# 放一些系统配置
fln $arch $user .xprofile 0

# move .vimrc
fln $arch $user .vimrc 0

# move .vim
fln $arch $user .vim 1

## xmodmap ##
fln $arch $user .Xmodmap 0
xmodmap $user/.Xmodmap

# xorg
ln -f $arch/30-synaptics.conf /etc/X11/xorg.conf.d/30-synaptics.conf

# 亮度
ln -f $arch/20-intel.conf /etc/X11/xorg.conf.d/20-intel.conf

# i3
fln $arch $cfg i3 1
fln $arch $cfg i3/config 0

# twmn
fln $arch $cfg twmn 1

# alacritty
fln $arch $cfg alacritty 1
fln $arch $cfg compton.conf 0

# fish
fln $arch $cfg fish 1
fln $arch $cfg fish/conf.d/omf.fish 0

# polybar
fln $arch $cfg polybar 1
fln $arch $cfg polybar/config 0


# ranger
fln $arch $cfg ranger 1
fln $arch $cfg ranger/rc.conf 0
fln $arch $cfg fontconfig 1

# neovim
fln $arch $cfg nvim 1
fln $arch $cfg nvim/init.vim 0
cd $cfg/nvim
pip3 install flake8

# zsh
fln $arch $usr .zshrc 0












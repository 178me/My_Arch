#! /usr/bin/bash
##############################################
## 此脚本用于主机文件比远程新的情况，和备份 ##
##############################################

user=/home/yzl178me
arch=/home/yzl178me/My_Arch
cfg=/home/yzl178me/.config


update(){
if [ $1 == 0 ]; then
    # 用户文件
    if [ -e $user/$2 ]; then
        ln -f $user/$2  $arch/$2
    fi
elif [ $1 == 1 ]; then
    # 配置文件
    if [ -e $cfg/$2/$3 ]; then
        ln -f $cfg/$2/$3  $arch/$2/$3
    fi
elif [ $1 == 2 ]; then
    # 用户目录
    if [ -e $user/$2 ]; then
        trash-put $arch/$2
        cp -rp $user/$2  $arch/$2
    fi
elif [ $1 == 3 ]; then
    # 配置目录
    if [ -e $cfg/$2 ]; then
        trash-put $arch/$2
        cp -rp $cfg/$2  $arch/$2
    fi
fi
}

# 放一些系统配置
update 0 .xprofile 

# Xmodmpa
update 0 .Xmodmap 

# move .vimrc
update 0 .vimrc

# move .vim
update 2 .vim 

# xorg
if [ -e /etc/X11/xorg.conf.d/30-synaptics.conf ]; then
    ln -f /etc/X11/xorg.conf.d/30-synaptics.conf $arch/30-synaptics.conf 
fi

# 亮度
if [ -e /etc/X11/xorg.conf.d/20-intel.conf ]; then
    ln -f /etc/X11/xorg.conf.d/20-intel.conf  $arch/20-intel.conf 
fi

# i3
update 3 i3

# alacritty
update 3 alacritty

# fish
update 3 fish

# polybar
update 3 polybar

# ranger
update 3 ranger

# neovim
update 3 nvim













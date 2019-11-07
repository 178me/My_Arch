#! /usr/bin/bash
##############################################
## 此脚本用于建立配置文件的链接，同步。。。 ##
##############################################

passwd=
echo 请输入密码
read passwd

# 放一些系统配置
if [ -e ~/.xprofile ]; then
    rm -f ~/.xprofile
fi
    ln ~/My_Arch/.xprofile ~/.xprofile

# move .vimrc
if [ -e ~/.vimrc ]; then
    rm -f ~/.vimrc
fi
    ln ~/My_Arch/.vimrc ~/.vimrc
# move .vim
if [ -e ~/.vim ]; then
    rm -rf ~/.vim
fi
    cp -r ~/My_Arch/.vim ~/.vim

## xmodmap ##
if [ -e ~/.Xmodmap ]; then
    rm -f ~/.Xmodmap
fi
    ln ~/My_Arch/.Xmodmap ~/.Xmodmap
    xmodmap ~/.Xmodmap

if [ -e /etc/X11/xorg.conf.d/30-synaptics.conf ]; then
    echo $passwd | sudo -S rm -f /etc/X11/xorg.conf.d/30-synaptics.conf
fi
    echo $passwd | sudo -S ln ~/My_Arch/30-synaptics.conf /etc/X11/xorg.conf.d/30-synaptics.conf

# 亮度
if [ -e /etc/X11/xorg.conf.d/20-intel.conf ]; then
    echo $passwd | sudo -S rm -f /etc/X11/xorg.conf.d/20-intel.conf
fi
    echo $passwd | sudo -S ln ~/My_Arch/20-intel.conf /etc/X11/xorg.conf.d/20-intel.conf

# i3
if [ -e ~/.config/i3/config ]; then
    rm -f ~/.config/i3/config
fi
    ln ~/My_Arch/i3/config ~/.config/i3/config

# alacritty
if [ -e ~/.config/alacritty/alacritty.yml ]; then
    rm -f ~/.config/alacritty/alacritty.yml
    rm -f ~/.config/compton.conf
fi
    ln ~/My_Arch/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
    ln ~/My_Arch/compton.conf ~/.config/compton.conf

# fish
if [ -e ~/.config/fish/conf.d/omf.fish ]; then
    rm -f ~/.config/fish/conf.d/omf.fish
fi
    ln  ~/My_Arch/fish/conf.d/omf.fish ~/.config/fish/conf.d/omf.fish

# polybar
if [ -e ~/.config/polybar/config ]; then
    rm -f ~/.config/polybar/*
fi
    ln ~/My_Arch/polybar/config ~/.config/polybar/config
    ln ~/My_Arch/polybar/launch.sh ~/.config/polybar/launch.sh














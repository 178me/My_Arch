#! /usr/bin/bash
#####################################################
##############此脚本用于安装和配置文件###############
#####################################################
#
##### 变量区 ######
# 密码
# 选择
choice=0
user=yzl178me
aa(){
if [ $1 == 0 ]; then
while true
do
    if [ -e /usr/bin/$2 ]; then
        echo $2已安装
        break
    fi
        pacman -S $2 $3 $4 $5 $6
done
fi
}
# 获得passwd   
echo 直接安装跳过基本设置请输入回车,否则输入1回车
read choice
if [ $choice == 1 ]; then
## 设置中国时区 ##
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc --utc

## 本地化也就是中文 ##
# 修改/etc/locale.gen文件，将zh_CN.UTF-8 UTF-8和en_US.UTF-8 UTF-8取消注释
chmod 777 /etc/locale.gen
echo -e "zh_CN.UTF-8 UTF-8\nen_US.UTF-8 UTF-8" >> /etc/locale.gen
chmod 644 /etc/locale.gen
# 输入  locale-gen  生成 locale 信息
locale-gen
pacman -S wqy-bitmapfont wqy-microhei wqy-microhei-lite wqy-zenhei

## pacman软件源设置 ##
# 修改/etc/pacman.conf 启用 Multilib 仓库，以下内容添加到文件结尾
chmod 777 /etc/pacman.conf
echo -e "[archlinuxcn]\nServer = https://mirrors.ustc.edu.cn/archlinuxcn/\$arch" >> /etc/pacman.conf
chmod 644 /etc/pacman.conf
# 输入pacman -S archlinuxcn-keyring 安装 archlinuxcn-keyring 包以导入 GPG key。
pacman -S archlinuxcn-keyring
# 输入pacman -Sy更新软件列表，也可以pacman -Syy强制更新
pacman -Syyu
# 更新系统：pacman -Syu
fi
aa 0 yay

## 克隆我的配置 ##
## ssh ##
aa 0 openssh
# 生成导入ssh
echo 输入1生成密钥
read choice
if [ choice == 1 ]; then
mkdir /home/$user/.ssh
cd /home/$user/.ssh
ssh-keygen -t rsa -C "1403341393@qq.com"
cat id_rsa.pub
echo 请导入密钥
read choice
fi
# 克隆配置文件
cd /home/$user
while true
do
    if [ -e /home/$user/My_Arch ]; then
        echo "配置文件已存在"
        break
    fi
        cd /home/$user
        git clone git@github.com:178me/My_Arch.git
    if [ -e /home/$user/Blog ]; then
        echo 博客已存在
        break
    fi
        git clone git@github.com:178me/178me.github.io.git
        mv 178me.github.io Blog
done

## vim ##
aa 0 vim xclip figlet

## NetworkManager ##
# 设置开机自启 systemctl enable NetworkManager.service 
aa 0 networkmanager
systemctl enable NetworkManager.service
aa 0 network-manager-applet

## lightdm ##
# 这里情况有点复杂，就不自动开启服务了,可以讲一下步骤
# 找到你现在的登录管理器服务，然后使用systemctl disable XXX.service关掉
# 再开启lightdm，使用lightdm enable lightdm.service
aa 0 lightdm lightdm-gtk-greeter

# lightdm比较轻量，但是该有的功能都会有，修改背景图片，头像，位置都有
# 详细配置  https://wiki.archlinux.org/index.php/LightDM_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)

## 硬件配置 ##
# 触摸板
aa 0 xf86-input-libinput

# 蓝牙
# 需手动开启蓝牙服务
aa 0 blueberry
systemctl enable bluetooth.service


# 音量和亮度的调节
aa 0 pulseaudio-ctl xorg-xbacklight

## i3 ##
aa 0 i3

## alacritty ##
aa 0 alacritty compton

## fish ##
aa 0 fish
curl -L https://get.oh-my.fish | fish

## polybar ##
aa 0 polybar
aa 0 awesome-terminal-fonts

## fcitx-sogoupinyin ##
aa 0 fcitx fcitx-sogoupinyin fcitx-qt5 fcitx-configtool

## utools ##
while true
do
    if [ -e /usr/bin/utools ]; then
        echo utools已安装
        break
    fi
        yay -S utools
done

## unzip ##
aa 0 unzip

## variety ##
aa 0 variety

## chrome ##
aa 0 google-chrome

## 网易云 ##
aa 0 netease-cloud-music

## 梯子 ##
aa 0 electron-ssr

## telegram ##
aa 0 telegram-desktop

## ranger ##
aa 0 ranger  trash-cli  nerd-fonts-complete
aa 0 w3m
aa 0 fzf

## twmn
yay -S twmn-git

## zj
aa 0 neofetch

## smplayer ##
aa 0 smplayer

## chromium ##
aa 0 chromium

## flameshot ##
aa 0 flameshot

## xscreensaver ##
aa 0 xscreensaver

## man中文帮助 ##
pacman -S man-pages-zh_cn man-pages-zh_tw

## hexo ##
while true
do
    if [ -e /usr/bin/npm ]; then
        echo npm已安装
    fi
        pacman -S nodejs npm
        if [ -e /usr/bin/hexo ]; then
            echo hexo已安装
            break
        else
            npm config set registry https://registry.npm.taobao.org
            npm install -g hexo-cli
            npm install hexo-deployer-git –save
        fi
done

## neovim ##
aa 0 ctags  python-pip 
npm install -g neovim

# zsh
aa 0 zsh-completions










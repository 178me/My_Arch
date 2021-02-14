''' 管理配置文件'''
import os
import time

class ProFile():
    ''' 文件方法 '''
    root = "/home/yzl178me/My_Arch/"

    def exists(self,path):
        ''' 判断文件是否存在
        :return: True || False
        '''
        return os.path.exists(path)

    def basename(self, path):
        ''' 提取文件名
        :param path: 路径
        :return: 文件名
        '''
        return os.path.basename(path)

    def create_profile(self, path):
        ''' 创建配置文件
        :param path: 路径
        :return: void
        '''
        if not self.exists(path):
            print(path+" 该文件不存在")
            return
        create_file = self.root + self.basename(path)
        if self.exists(create_file):
            os.system("rm -rf " + create_file)
            print("删除过时的配置文件"+create_file)
        os.system("cp -r " + path + " " + create_file)\
            if os.path.isdir(path)\
            else os.link(path,create_file)
        print("文件夹 ",end="")\
            if os.path.isdir(path)\
            else print("文件 ",end="")
        print(create_file,"创建成功")

def main():
    home = "/home/yzl178me/"
    etc = "/etc/"
    profile = ProFile()
    home_path = [
                home+".config/nvim/init.vim",
                home+".config/alacritty",
                home+".config/fish",
                home+".config/flameshot",
                home+".config/i3",
                home+".config/lxsession",
                home+".config/oh-my-fish",
                home+".config/omf",
                home+".config/polybar",
                home+".config/pulseaudio-ctl",
                home+".config/qv2ray",
                home+".config/ranger",
                home+".config/twmn",
                home+".emacs.d",
                home+".oh-my-zsh",
                home+".xprofile",
                home+".Xmodmap",
                home+".config/picom.conf",
                home+".config/coc/extensions/node_modules/coc-python/snippets/python.json",
                home+".vim/Markdown.vim",
                home+".vimrc",
                home+".zshrc",
                home+".pip/pip.conf",
                home+".bashrc",
                home+".i2c_hid.sh",
                home+".xinitrc",
            ]
    etc_path = [
            etc+"hosts",
            etc+"X11/xorg.conf.d/30-synaptics.conf",
            etc+"X11/xorg.conf.d/20-intel.conf",
            ]
    for value in home_path:
        profile.create_profile(value)
    for value in etc_path:
        profile.create_profile(value)

main()
#  home = "/home/yzl178me/My_Arch/"
#  arr = os.listdir(home)

#  for value in arr:
    #  print(os.system("du -sh "+value))
    #  time.sleep(0.1)


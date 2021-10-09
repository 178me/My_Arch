''' ArchLinux 的一些自动化操作 '''
import os
import logging
# 日志模块设置
log = logging.getLogger('ArchAutomation')
log.setLevel(level=logging.INFO)
formatter = logging.Formatter(
    '%(asctime)s.%(msecs)d-%(levelname)s: %(message)s')
formatter.datefmt = "%H:%M:%S"
file_handler = logging.FileHandler('log.txt')
file_handler.setLevel(level=logging.INFO)
file_handler.setFormatter(formatter)
stream_handler = logging.StreamHandler()
stream_handler.setLevel(logging.INFO)
stream_handler.setFormatter(formatter)
log.addHandler(file_handler)
log.addHandler(stream_handler)


class ArchAutomation:
    def __init__(self, user_name):
        self.config_path = f"/home/{user_name}/My_Arch/"
        self.user_path = f"/home/{user_name}/"
        self.etc_path = "/etc/"

    def ln_to_local(self, config_path, local_path):
        """ 链接到本地 """
        # 判断路径是否存在
        if not os.path.exists(config_path):
            log.info("配置文件路径不存在")
            return False
        # 判断文件类型
        if os.path.isdir(config_path):
            # 本地文件 -> 配置文件
            os.system(f"cp -rf '{config_path}' '{os.path.dirname(local_path)}")
            log.info(f"复制文件夹: {config_path} -> {local_path} ")
        else:
            # 本地文件 -> 配置文件
            os.system(f"ln -f '{config_path}' '{local_path}'")
            log.info(f"创建文件链接: {local_path} -> {config_path} ")

    def ln_to_config(self, local_path, config_path):
        """ 链接到本配置文件 """
        # 判断路径是否存在
        if not os.path.exists(local_path):
            log.info("本地文件路径不存在")
            return False
        # 判断文件类型
        if os.path.islink(local_path):
            log.info(f"{local_path} 是链接文件")
            return True
        if os.path.isdir(local_path):
            # 复制本地文件夹到配置文件夹,删除本地文件夹  然后 本地文件夹 -> 配置文件夹
            if os.path.basename(local_path) == ".config":
                self.copy_config(local_path, config_path)
            else:
                os.system(
                    f"cp -rf '{local_path}' '{os.path.dirname(config_path)}'")
            log.info(f"复制文件夹: {local_path} -> {config_path} ")
        else:
            # 复制本地文件到配置文件  然后 本地文件 -> 配置文件
            if os.path.exists(config_path):
                os.system(f"rm -rf '{config_path}'")
            os.system(f"mkdir -p '{os.path.dirname(config_path)}'")
            os.system(f"cp -f '{local_path}' '{config_path}'")
            os.system(f"ln -f '{config_path}' '{local_path}'")
            log.info(f"创建文件链接: {local_path} -> {config_path} ")

    def copy_config(self, local_path, config_path):
        listdir = os.listdir(local_path)
        size = 0
        for filename in listdir:
            filepath = local_path + "/" + filename
            print(filepath)
            if not os.path.exists(filepath):
                continue
            if os.path.isdir(filepath):
                size = self.getdirsize(filepath)
            elif os.path.isfile(filepath):
                size = os.path.getsize(filepath)
                os.system(f"rm -f '{config_path + os.sep + filename}'")
            if size < 10 * 1024 * 1024:
                os.system(
                    f"cp -rf '{filepath}' '{config_path}'")

    @classmethod
    def getdirsize(cls, dir_path):
        size = 0
        for root, dirs, files in os.walk(dir_path):
            try:
                size += sum([os.path.getsize(os.path.join(root, name))
                            for name in files])
            except:
                pass
        return size

    def install_script(self):
        pass


if __name__ == "__main__":
    arch_auto = ArchAutomation("yzl178me")
    home_config_path = [
        # 文件夹
        ".config",
        #  ".emacs.d",
        #  ".oh-my-zsh",
        #  ".pip",
        # 文件
        #  ".vim/Markdown.vim",
        #  ".xprofile",
        #  ".Xmodmap",
        #  ".vimrc",
        #  ".zshrc",
        #  ".bashrc",
        #  ".i2c_hid.sh",
        #  ".xinitrc",
    ]
    etc_path = [
        # 文件夹
        "X11",
        # 文件
        "hosts",
        "pacman.conf",
        "sudoers",
        "pacman.d/mirrorlist",
    ]
    for config_path in home_config_path:
        try:
            arch_auto.ln_to_config(arch_auto.user_path + config_path,
                                   arch_auto.config_path + config_path)
        except Exception as e:
            log.exception(e)
            log.info(config_path + "发生错误")
    #  for config_path in etc_path:
    #  try:
    #  arch_auto.ln_to_config(arch_auto.etc_path + config_path,
    #  arch_auto.config_path + config_path)
    #  except:
    #  log.info(config_path + "发生错误")
    #  root = arch_auto.config_path + ".config/i3/"
    #  print(os.path.basename(root))
    #  print(file)

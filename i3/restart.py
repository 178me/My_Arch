''' i3 重新加载之后交换键位 '''
import os
import time

os.system("i3-msg restart")
time.sleep(0.5)
os.system("xmodmap ~/.Xmodmap")
time.sleep(1.5)
os.system('i3-msg kill window')

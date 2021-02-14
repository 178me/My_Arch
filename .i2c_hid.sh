#! /usr/bin/bash

# 重载触摸板 
echo yzl995 | sudo -S rmmod i2c-hid
echo yzl995 | sudo -S modprobe i2c_hid

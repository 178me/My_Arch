#
# ~/.bashrc
#
# editor
export EDITOR=nvim
export VBOX_USB=usbfs
export TZ='Asia/Shanghai'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export http_proxy=''
export https_proxy=''
export ftp_proxy=''
export socks_proxy=''

# User specific environment
# PATH="$HOME/.local/bin:$PATH"
# export PATH
export PATH=/home/yzl178me/.local/bin:$PATH

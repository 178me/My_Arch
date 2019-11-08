# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"
# alias
alias c='clear'
alias v='vim'
alias R='shutdown -r now'
alias r='ranger'
alias off='shutdown now'
alias vrc='vim ~/.vimrc'
alias vi3='vim ~/.config/i3/config'
alias vfi='vim ~/.config/fish/conf.d/omf.fish'
alias vpo='vim ~/.config/polybar/config'
alias cdmd='cd ~/Blog/source/_posts'
alias aa='sudo pacman -S'
alias yy='yay -S'
alias as='pacman -Ss'
alias zj='neofetch'
alias gitc="git commit -m "updata""
alias gitp='git push'
alias gits='git status'
set -g -x RANGER_LOAD_DEFAULT_RC FALSE
# alias xevv="xev | grep -A2 --line-buffered '^KeyRelease' | sed -n '/keycode /s/^.*keycode \([0-9]*\).* (.*, \(.*\)).*$/\1 \2/p'"


# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

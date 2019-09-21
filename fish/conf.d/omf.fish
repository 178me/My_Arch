# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

# set alias
alias c='clear'
alias off='shutdown now'
alias R='shutdown -r now'
alias zj='neofetch'
alias az='sudo pacman -S'

# set https
#export http_proxy="http://127.0.0.1:12333"



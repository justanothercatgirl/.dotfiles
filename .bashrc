
source /etc/profile
source /etc/environment
source "$HOME/.cursed_bash.sh"
source /usr/share/git/git-prompt.sh
source /usr/share/doc/pkgfile/command-not-found.bash

eval "$(zoxide init --cmd cd bash)"

# application shortcuts
alias ls="ls --color"
alias cat=lolcat
alias dl="~/.local/bin/download"
alias qmake="/usr/lib/qt6/bin/qmake"
alias psiphon="psiphon-console-client"
alias cppreference="microsoft-edge-dev /usr/share/doc/cppreference/en/cpp.html"
alias lan="/home/main/zerotierconnect.sh"
alias python=/home/main/coding/py/venv/bin/python3
alias pdf=mupdf
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias siskictl=systemctl
alias boobs=systemctl
alias tmux="tmux -f ~/.config/tmux.conf"

# shell options
shopt -s autocd
# # 256 colors
# C_VIOLETISH="\[\e[38;5;183m\]"
# C_="\[\e[38;5;183m\]"
# # ANSII colors
# C_RED="\[\e[31m\]"
# C_GREEN="\[\e[32m\]"
# C_YELLOW="\[\e[33m\]"
# C_BLUE="\[\e[34m\]"
# C_MAGENTA="\[\e[35m\]"
# C_CYAN="\[\e[36m\]"
# C_WHITE="\[\e[37m\]"
# # bright colors
# C_BRED="\[\e[91m\]"
# C_BGREEN="\[\e[92m\]"
# C_BYELLOW="\[\e[93m\]"
# C_BBLUE="\[\e[94m\]"
# C_BMAGENTA="\[\e[95m\]"
# C_BCYAN="\[\e[96m\]"
# C_BWHITE="\[\e[97m\]"
# # font modifiers
# C_BOLD="\[\e[1m\]"
# C_BLINK="\[\e[5m\]"
# # reset
# C_RESET="\[\e[0m\]"

export JAVA_HOME="/usr/lib/jvm/default/"
export PS1='[\[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[36m\]\W\[\e[93m\]$(__git_ps1 "(%s" | cut_dots 15 ")")\[\e[37m\]]\[\e[38;5;183m\]\$\[\e[0m\] '
# dotfiles

# zerotier 
export ZEROTIER_CENTRAL_TOKEN="/etc/zerotier/token"



GHC_PACKAGE_PATH="/usr/lib/ghc-9.0.2/package.conf.d"
# Created by `pipx` on 2023-08-09 18:40:17
append_path '/home/main/.local/bin'
append_path '/home/main/.cargo/bin'


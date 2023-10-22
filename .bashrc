# application shortcuts
alias ls="ls --color"
alias dl="bash download.sh"
alias qmake="/usr/lib/qt6/bin/qmake"
alias psiphon="psiphon-console-client"
alias cppreference="microsoft-edge-dev /usr/share/doc/cppreference/en/cpp.html"
alias nv=nvim
alias whatsapp=whatsie
alias lan="bash zerotierconnect.sh"

export c="/mnt/C"
export d="/mnt/D"

function swap() { mv "$1" "$1._tmp" && mv "$2" "$1" && mv "$1._tmp" "$2"; }

function kboff() { xinput float `xinput \
    | grep "AT Translated" \
    | sed -r 's/.+id=([0-9]+).+/\1/'`; }
function kbon() { xinput reattach `xinput \
    | grep "AT Translated" \
    | sed -r 's/.+id=([0-9]+).+/\1/'` \
    `xinput \
    | grep "Virtual core keyboard" \
    | sed -r 's/.+id=([0-9]+).+/\1/'` ; }

# dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME'

GHC_PACKAGE_PATH="/usr/lib/ghc-9.0.2/package.conf.d"
# Created by `pipx` on 2023-08-09 18:40:17
export PATH="$PATH:/home/main/.local/bin"
export VISUAL=vim


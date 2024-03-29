# disable fish greeting
set fish_greeting ""

# reference: https://gist.github.com/netmute/6761892
# make Vim the default editor
set --export EDITOR "nvim -f"
# make Vim usable with git
set --export GIT_EDITOR "nvim -f"

# have z
source ~/Github/z-fish/z.fish

#           oooo   o8o
#           `888   `"'
#  .oooo.    888  oooo   .oooo.    .oooo.o  .ooooo.   .oooo.o
# `P  )88b   888  `888  `P  )88b  d88(  "8 d88' `88b d88(  "8
#  .oP"888   888   888   .oP"888  `"Y88b.  888ooo888 `"Y88b.
# d8(  888   888   888  d8(  888  o.  )88b 888    .o o.  )88b
# `Y888""8o o888o o888o `Y888""8o 8""888P' `Y8bod8P' 8""888P'

# better ls
if type -q exa
    alias ls='exa --group-directories-first --icons -la --no-user --no-permissions'
else
    alias ls='ls -lGFah'
end

# task related aliases
alias t='python3 ~/t/t.py --task-dir ~/mytasks --list tasks.txt'
alias today='fish ~/mytasks/doing.fish today'
alias now='t -g @now'
alias done='python3 ~/t/done.py'

alias caplog='python3 ~/projects/caplog/caplog.py'
alias capnow='caplog -p (date +%Y-%m-%d\ %H:%M)'
alias desktop='bash ~/scripts/desktop.sh'
alias icat='kitty +kitten icat'

alias doing 'fish ~/mytasks/doing.fish tasks'
alias projects 'fish ~/mytasks/doing.fish'

alias haskell='ghci'
alias vim="nvim"
alias figlet="figlet -f roman"

# use kitty diff tool
abbr -a -g d 'kitty +kitten diff'

# git abbreviations
abbr -a -g gd 'git difftool'
abbr -a -g gs 'git status'
abbr -a -g gitl 'git log --pretty=oneline'

# show me job id
alias jobs='jobs -l'

# rm files to trash
alias rm=trash

# source local overrides
source ~/.localoverrides

# In order for gpg to find gpg-agent, gpg-agent must be running,
# and there must be an env variable pointing GPG to the gpg-agent socket.
# This little script, which must be sourced
# in your shell's init script (ie, .bash_profile, .zshrc, whatever),
# will either start gpg-agent or set up the
# GPG_AGENT_INFO variable if it's already running.
set -gx GPG_TTY (tty)
set -g PINENTRY_USER_DATA "USE_CURSES=1"

set gpgstart "gpg-agent --daemon"

if [ -z (pgrep gpg-agent) ]
    eval $gpgstart
end > /dev/null

fish_add_path "/usr/local/opt/ruby/bin"
fish_add_path "/usr/local/sbin"

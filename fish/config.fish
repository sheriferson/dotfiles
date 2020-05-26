# disable fish greeting
set fish_greeting ""

# reference: https://gist.github.com/netmute/6761892
# make Vim the default editor
set --export EDITOR "nvim -f"
# make Vim usable with git
set --export GIT_EDITOR "nvim -f"

# have z
source ~/Github/z-fish/z.fish

# make directories look better
set --export LSCOLORS "excxfxdxbxegedabagacad"

#           oooo   o8o
#           `888   `"'
#  .oooo.    888  oooo   .oooo.    .oooo.o  .ooooo.   .oooo.o
# `P  )88b   888  `888  `P  )88b  d88(  "8 d88' `88b d88(  "8
#  .oP"888   888   888   .oP"888  `"Y88b.  888ooo888 `"Y88b.
# d8(  888   888   888  d8(  888  o.  )88b 888    .o o.  )88b
# `Y888""8o o888o o888o `Y888""8o 8""888P' `Y8bod8P' 8""888P'

# better ls
if type -q exa
    alias ls='exa -la'
else
    alias ls='ls -lGFah'
end

# task related aliases
alias t='python3 ~/t/t.py --task-dir ~/mytasks --list tasks.txt'
alias music='python3 ~/t/t.py --task-dir ~/mytasks --list music.txt'
alias goals='python3 ~/t/t.py --task-dir ~/mytasks --list goals.txt'

alias today='fish ~/mytasks/doing.fish today'
alias now='t -g @now'
alias done='python3 ~/t/done.py'

# b for bug/task tracking
alias b='python3 ~/t/t.py --task-dir . --list _todo.txt'
alias bdone='echo $bdcount'

alias caplog='python3 ~/projects/caplog/caplog.py'
alias capnow='caplog -p (date +%Y-%m-%d\ %H:%M)'
alias desktop='bash ~/scripts/desktop.sh'
alias mylint='pylint -d \'invalid-name, len-as-condition, superfluous-parens, unidiomatic-typecheck\' *.py'
alias icat='kitty +kitten icat'

alias doing 'fish ~/mytasks/doing.fish tasks'
alias projects 'fish ~/mytasks/doing.fish'

# haskell
alias haskell='ghci'

# use kitty diff tool
abbr -a -g d 'kitty +kitten diff'

# jekyll aliases
alias serve='bundle exec jekyll serve'

# abbreviations
abbr -a -g ga 'git add'
abbr -a -g gb 'git branch'
abbr -a -g gc 'git checkout'
abbr -a -g gd 'git difftool'
abbr -a -g gs 'git status'

#     .
#   .o8
# .o888oo ooo. .oo.  .oo.   oooo  oooo  oooo    ooo
#   888   `888P"Y88bP"Y88b  `888  `888   `88b..8P'
#   888    888   888   888   888   888     Y888'
#   888 .  888   888   888   888   888   .o8"'88b
#   "888" o888o o888o o888o  `V88V"V8P' o88'   888o

alias tnew='tmux new -s'
alias tgo='tmux a -t'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'
alias tkillall='tmux kill-server'

# shotcuts to running tmux workspace scripts
alias tmsimple='fish ~/dotfiles/tmux-workspaces/simplestatistics.sh'
alias tmjsimple='fish ~/dotfiles/tmux-workspaces/jsimplestats.sh'

#                    o8o
#                    `"'
# ooo. .oo.  .oo.   oooo   .oooo.o  .ooooo.
# `888P"Y88bP"Y88b  `888  d88(  "8 d88' `"Y8
#  888   888   888   888  `"Y88b.  888
#  888   888   888   888  o.  )88b 888   .o8
# o888o o888o o888o o888o 8""888P' `Y8bod8P'

# show me job id
alias jobs='jobs -l'

# better git log
alias gitl='git log --pretty=oneline'

# better figlet font
alias figlet="figlet -f roman"

# vim should be = nvim
alias vim="nvim"
alias mvim="reattach-to-user-namespace mvim"

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

# Add completion for kitty commands to fish
/Applications/kitty.app/Contents/MacOS/kitty + complete setup fish | source

# use Homebrew's ruby
set -g fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths
set -g fish_user_paths "/Users/sherif/.gem/ruby/2.6.0/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

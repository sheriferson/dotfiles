# use powerline (pip install powerline-status)
set fish_function_path $fish_function_path "/usr/local/lib/python3.5/site-packages/powerline/bindings/fish"
powerline-setup

# disable fis greeting
# set fish_greeting
function fish_greeting
    Rscript /Users/sherif/scripts/fortune.R
end

funcsave fish_greeting

# colors
export LSCOLORS=xeGxBxCxxxEgEdxBxBxexe

# reference: https://gist.github.com/netmute/6761892
# make Vim the default editor
set --export EDITOR "nvim -f"
# make Vim usable with git
set --export GIT_EDITOR "nvim -f"

#           oooo   o8o                                        
#           `888   `"'                                        
#  .oooo.    888  oooo   .oooo.    .oooo.o  .ooooo.   .oooo.o 
# `P  )88b   888  `888  `P  )88b  d88(  "8 d88' `88b d88(  "8 
#  .oP"888   888   888   .oP"888  `"Y88b.  888ooo888 `"Y88b.  
# d8(  888   888   888  d8(  888  o.  )88b 888    .o o.  )88b 
# `Y888""8o o888o o888o `Y888""8o 8""888P' `Y8bod8P' 8""888P' 

# better ls
alias ls='ls -lGFah'

# task related aliases
alias t='python ~/t/t.py --task-dir ~/Dropbox/text/tasks --list tasks.txt'
alias macl='t -g @macl'
alias music='t -g @music'
alias today='t -g @today'

# b for bug/task tracking
alias b='python ~/t/t.py --task-dir . --list _todo.txt'
alias bdone='echo $bdcount'

alias caplog='python3 ~/projects/caplog/caplog.py'

alias desktop='bash ~/scripts/desktop.sh'

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

# export some to do counts that I use in shell prompt
# code from: https://github.com/oh-my-fish/theme-agnoster/blob/master/fish_prompt.fish
# with tiny modifications to export the clean/dirty indicator for powerline segment
function -v _ todos
    # For doing a check over dates in t tasks - commented out for now
    # python ~/t/t.py --list ~/Dropbox/Text/tasks/tasks.txt > /dev/null ^&1
    export tnum=(cat ~/Dropbox/Text/tasks/tasks.txt | grep "@today" | wc -l | sed -e's/ *//')
    export tDoneCount=(cat ~/Dropbox/Text/tasks/.tasks.txt.done | wc -l | sed -e's/ *//')
end

#             o8o      .   
#             `"'    .o8   
#  .oooooooo oooo  .o888oo 
# 888' `88b  `888    888   
# 888   888   888    888   
# `88bod8P'   888    888 . 
# `8oooooo.  o888o   "888" 
# d"     YD                
# "Y88888P'                

# put dirty branch indicator in prompt
set -g __fish_git_prompt_char_dirty '±'
set -g __fish_git_prompt_char_stashed '✈︎'
set -g __fish_git_prompt_char_dirty_and_stashed '± ✈︎'

function -v _ parse_git
    set -l submodule_syntax
    set submodule_syntax "--ignore-submodules=dirty"
    set git_dirty (command git status -s $submodule_syntax  2> /dev/null)
    set git_stashed (command git rev-parse --verify --quiet refs/stash 2>/dev/null)
    set git_commit_count (command git rev-list --all --count 2> /dev/null)

    #  reference: https://github.com/oh-my-fish/theme-bobthefish/blob/master/fish_prompt.fish
    # I don't like the solution below. Ideally I would use multiple
    # conditionals in the if statement, but apparently that is either
    # impossible or really hard to do in fish. I spent a long time looking.
    # and I don't want to waste any more time.
    set -e branchStatus
    if [ -n "$git_dirty" ]
        if [ "$git_stashed" ]
            export branchStatus="$__fish_git_prompt_char_dirty_and_stashed"
        else
            export branchStatus="$__fish_git_prompt_char_dirty"
        end
    else
        if [ "$git_stashed" ]
            export branchStatus="$__fish_git_prompt_char_stashed"
        else
            set -e branchStatus
        end
    end

    if [ -n "$git_commit_count" ]
        if [ -n "$branchStatus" ]
            export branchStatus="($git_commit_count) ""$branchStatus"
        else
            export branchStatus="($git_commit_count)"
        end
    else
        set -e branchStatus
    end
end

# In order for gpg to find gpg-agent, gpg-agent must be running,
# and there must be an env variable pointing GPG to the gpg-agent socket.
# This little script, which must be sourced
# in your shell's init script (ie, .bash_profile, .zshrc, whatever),
# will either start gpg-agent or set up the
# GPG_AGENT_INFO variable if it's already running.
set gpgstart "gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info"

if [ -z (pgrep gpg-agent) ]
    eval $gpgstart
end > /dev/null

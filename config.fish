# use powerline (pip install powerline-status)
set fish_function_path $fish_function_path "/usr/local/lib/python2.7/site-packages/powerline/bindings/fish"
powerline-setup

# Improve fish greeting with some fortune
# reference: https://gist.github.com/montanaflynn/04246fc5da998d15e713
function fish_greeting
    if not type fortune > /dev/null 2>&1
        brew install fortune
    end

    if not type cowsay > /dev/null 2>&1
        brew install cowsay
    end

    fortune | cowsay -f moose
end

funcsave fish_greeting

# colors
export LSCOLORS=xeGxBxCxxxEgEdxBxBxexe

# reference: https://gist.github.com/netmute/6761892
# make Vim the default editor
set --export EDITOR "mvim -f"
# make Vim usable with git
set --export GIT_EDITOR "mvim -f"

#           oooo   o8o                                        
#           `888   `"'                                        
#  .oooo.    888  oooo   .oooo.    .oooo.o  .ooooo.   .oooo.o 
# `P  )88b   888  `888  `P  )88b  d88(  "8 d88' `88b d88(  "8 
#  .oP"888   888   888   .oP"888  `"Y88b.  888ooo888 `"Y88b.  
# d8(  888   888   888  d8(  888  o.  )88b 888    .o o.  )88b 
# `Y888""8o o888o o888o `Y888""8o 8""888P' `Y8bod8P' 8""888P' 

# better ls
alias ls='ls -lGFah'

# easier python 3
alias p3='python3'

# task related aliases
alias t='python ~/t/t.py --task-dir ~/Dropbox/text/tasks --list tasks.txt'
alias tg='t -g'
alias macl='t -g @macl'
alias music='t -g @music'
alias today='t -g @today'
alias site='t -g @site'

# b for bug/task tracking
alias b='python ~/t/t.py --task-dir . --list _todo.txt'
alias bdone='echo $bdcount'

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

# vim should be = mvim
alias vim="reattach-to-user-namespace mvim"

# export some to do counts that I use in shell prompt
# code from: https://github.com/oh-my-fish/theme-agnoster/blob/master/fish_prompt.fish
# with tiny modifications to export the clean/dirty indicator for powerline segment
function -v _ todos
    export tnum=(python ~/t/t.py --list ~/Dropbox/Text/tasks/tasks.txt -g @today | wc -l | sed -e's/ *//')
    export tDoneCount=(python ~/t/t.py --list ~/Dropbox/Text/tasks/.tasks.txt.done | wc -l | sed -e's/ *//')
end

# put dirty branch indicator in prompt
set -g __fish_git_prompt_showdirtystate 'yes'
set -g __fish_git_prompt_char_dirtystate '±'

function -v _ parse_git_dirty
  set -l submodule_syntax
  set submodule_syntax "--ignore-submodules=dirty"
  set git_dirty (command git status -s $submodule_syntax  2> /dev/null)
  if [ -n "$git_dirty" ]
    if [ $__fish_git_prompt_showdirtystate = "yes" ]
      export branchStatus="$__fish_git_prompt_char_dirtystate"
    end
  else
    if [ $__fish_git_prompt_showdirtystate = "yes" ]
      set -e branchStatus
    end
  end
end

#!/usr/local/bin/fish

# detach from a tmux session if in one
tmux detach > /dev/null ^ /dev/null

# don't set up the workspace if there's already a simplestatistics session running
if tmux list-sessions -F "#{session_name}" | grep -q "simplestatistics";
    echo "simplestatistics session already running"
else
    # okay no simplestatistics session is running

    cd ~/projects/simplestatistics
    tmux new -d -s simplestatistics

    # window 0 - main
    tmux rename-window main

    # set up window 1 - documentation
    # - index.rst
    # - README.md
    # - __init__.py
    # fourth empty pane
    tmux new-window -n documentation

    tmux split-window -h
    tmux select-pane -t 0
    tmux split-window -v
    tmux select-pane -t 0
    tmux send-keys "cd ~/projects/simplestatistics/simplestatistics/" C-m
    tmux send-keys "vim __init__.py" C-m

    tmux select-pane -t 1
    tmux send-keys "cd ~/projects/simplestatistics/" C-m
    tmux send-keys "vim README.md" C-m

    tmux select-pane -t 2
    tmux send-keys "cd ~/projects/simplestatistics/simplestatistics/" C-m
    tmux send-keys "vim index.rst" C-m
    tmux split-window -v

    # set up window 2 - changelogs
    tmux new-window -n changelogs
    tmux send-keys "cd ~/projects/simplestatistics/" C-m
    tmux send-keys "vim changelog.txt" C-m
    
    tmux split-window -h
    tmux send-keys "cd ~/projects/simplestatistics/" C-m
    tmux send-keys "vim HISTORY.rst" C-m

    # back to window 0 - main
    # 2 vertical panes: both will be used to edit main statistics functions
    tmux select-window -t 0
    tmux send-keys "cd ~/projects/simplestatistics/simplestatistics/statistics" C-m
    tmux send-keys "ls" C-m
    tmux split-window -h
    tmux send-keys "cd ~/projects/simplestatistics/simplestatistics/statistics" C-m

    tmux select-pane -t 0
    tmux split-window -v
    tmux send-keys "cd ~/projects/simplestatistics" C-m
    tmux send-keys "bpython" C-m
    tmux select-pane -t 0

    tmux attach-session -t simplestatistics
end

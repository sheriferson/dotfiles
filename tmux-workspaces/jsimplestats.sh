
#!/usr/local/bin/fish

# detach from a tmux session if in one
tmux detach > /dev/null ^ /dev/null

# don't set up the workspace if there's already a simplestatistics session running
if tmux list-sessions -F "#{session_name}" | grep -q "jsimplestats";
    echo "jsimplestats session already running"
else
    # okay no simplestatistics session is running

    cd ~/.julia/v0.5/jsimplestats/src
    tmux new -d -s jsimplestats

    # window 0 - main
    tmux rename-window main

    # back to window 0 - main
    tmux split-window -h -p 60

    # top left
    tmux select-pane -t 0
    tmux split-window -v
    tmux send-keys "julia" C-m

    # right and split
    tmux select-pane -t 2
    tmux split-window -v

    tmux attach-session -t jsimplestats
end

function fish_right_prompt -d "Write out the right prompt with non zero exit status and date/time"
    set nstat $status
    __git_status
    t_today
    if test $nstat -ne 0
        print_bubble '⮾ '(fish_status_to_signal $nstat) red eeeeee
    end
    print_bubble (echo "$CMD_DURATION 1000" | awk '{printf "%.3fs", $1 / $2}') 6d8cb8 eeeeee
end

function t_today
    print_bubble ' '(cat ~/mytasks/tasks.txt | grep '@today' | wc -l | sed -e's/ *//') 907193 eeeeee
end

function __git_status
    set git_branch (command git rev-parse --abbrev-ref HEAD 2> /dev/null)
    set git_tracked (git for-each-ref --format='%(upstream:short)' (command git symbolic-ref -q HEAD 2> /dev/null) 2> /dev/null)
    set git_stashed (command git rev-parse --verify --quiet refs/stash 2> /dev/null)

    set -l submodule_syntax
    set submodule_syntax "--ignore-submodules=dirty"
    set git_dirty (command git status -s $submodule_syntax  2> /dev/null)

    set  __fish_git_prompt_char_stashed ' '

    if [ -n "$git_branch" ]
        set git_behind (command git rev-list "$git_branch".."$git_tracked" --count 2> /dev/null)
        set git_ahead (command git rev-list "$git_tracked".."$git_branch" --count 2> /dev/null)

        set git_status " $git_branch"
        if [ "$git_stashed" ]
            set git_full "$git_status $__fish_git_prompt_char_stashed"
        else
            set git_full "$git_status"
        end

        if [ "$git_branch" != "HEAD" ]
            if test $git_behind -gt 0
                set git_full "$git_full  $git_behind"
            end
            if test $git_ahead -gt 0
                set git_full "$git_full  $git_ahead"
            end
        end
        if [ -n "$git_dirty" ]
            set branch_color fb9420  # dirty, orange
        else
            set branch_color 29c37b  # clean, green

        end
        print_bubble $git_full $branch_color eeeeee
    end
end

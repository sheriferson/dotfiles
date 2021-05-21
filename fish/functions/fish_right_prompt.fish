function fish_right_prompt -d "Write out the right prompt with non zero exit status and date/time"
    __git_status

    set nstat $status
    if test $nstat -ne 0
        echo (set_color red)(set_color eeeeee)(set_color -b red)(fish_status_to_signal $nstat)(set_color -b normal)(set_color red)(set_color red)
    end
    echo -n (set_color 6d8cb8)(set_color eeeeee)(set_color -b 6d8cb8)(date +"%H:%M:%S")(set_color -b normal)(set_color 6d8cb8)(set_color normal)

end

function __git_status
    set git_branch (command git rev-parse --abbrev-ref HEAD 2> /dev/null)
    set git_tracked (git for-each-ref --format='%(upstream:short)' (command git symbolic-ref -q HEAD 2> /dev/null) 2> /dev/null)
    set git_stashed (command git rev-parse --verify --quiet refs/stash 2> /dev/null)

    set -l submodule_syntax
    set submodule_syntax "--ignore-submodules=dirty"
    set git_dirty (command git status -s $submodule_syntax  2> /dev/null)

    set  __fish_git_prompt_char_stashed ℎ

    if [ -n "$git_branch" ]
        set git_behind (command git rev-list "$git_branch".."$git_tracked" --count 2> /dev/null)
        set git_ahead (command git rev-list "$git_tracked".."$git_branch" --count 2> /dev/null)

        set git_status " $git_branch"
        if [ "$git_stashed" ]
            set git_full "$git_status $__fish_git_prompt_char_stashed"
        else
            set git_full "$git_status"
        end

        if test $git_behind -gt 0
            set git_full "$git_full $git_behind↓"
        end
        if test $git_ahead -gt 0
            set git_full "$git_full $git_ahead↑"
        end
        if [ -n "$git_dirty" ]
            set branch_color fb9420
        else
            set branch_color 29c37b

        end
        echo -n (set_color $branch_color)(set_color eeeeee)(set_color -b $branch_color)$git_full(set_color -b normal)(set_color $branch_color)(set_color normal)
    end
end

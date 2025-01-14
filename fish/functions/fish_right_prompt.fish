function fish_right_prompt -d "Write out the right prompt with non zero exit status and date/time"
    __git_status

    if test "$CMD_DURATION" -gt 3000
        print_bubble (echo -n $CMD_DURATION | __human_time) purple ededed
    end
end


function __git_status
    set git_dirty (command git status -s $submodule_syntax  2> /dev/null)
    if [ -n "$git_dirty" ]
        set branch_fg fb9420  # dirty, orange
        set branch_bg fff4e8
    else
        set branch_fg 29c37b  # clean, green
        set branch_bg effcf6

    end

    print_bubble ""(string replace -r -a '\(|\)' '' (fish_git_prompt)) $branch_fg $branch_bg
end

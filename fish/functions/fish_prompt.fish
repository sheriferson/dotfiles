function fish_prompt
    test $SSH_TTY
    and printf (set_color ff6961)'['$USER(set_color fdfd96)'@'(prompt_hostname)'] '
    test $USER = 'root'
    and echo (set_color red)"#"

    set git_branch (command git rev-parse --abbrev-ref HEAD 2> /dev/null)
    set git_tracked (git for-each-ref --format='%(upstream:short)' (command git symbolic-ref -q HEAD 2> /dev/null) 2> /dev/null)
    set git_stashed (command git rev-parse --verify --quiet refs/stash 2> /dev/null)

    set -l submodule_syntax
    set submodule_syntax "--ignore-submodules=dirty"
    set git_dirty (command git status -s $submodule_syntax  2> /dev/null)

    # put dirty branch indicator in prompt
    set -g __fish_git_prompt_char_dirty ＊
    set -g __fish_git_prompt_char_stashed ℎ
    set -g __fish_git_prompt_char_dirty_and_stashed ＊ ℎ

    if [ -n "$git_branch" ]
        set git_behind (command git rev-list "$git_branch".."$git_tracked" --count 2> /dev/null)
        set git_ahead (command git rev-list "$git_tracked".."$git_branch" --count 2> /dev/null)

        set git_status "  $git_branch"
        if [ -n "$git_dirty" ]
            if [ "$git_stashed" ]
                set git_full "$git_status$__fish_git_prompt_char_dirty_and_stashed"
            else
                set git_full "$git_status$__fish_git_prompt_char_dirty"
            end
        else
            if [ "$git_stashed" ]
                set git_full "$git_status $__fish_git_prompt_char_stashed"
            else
                set git_full "$git_status"
            end
        end

        if test $git_behind -gt 0
            set git_full "$git_full $git_behind⇣ "
        end
        if test $git_ahead -gt 0
            set git_full "$git_full $git_ahead⇡ "
        end
    end

    # what's on deck today?
    set n_today (command python3 ~/t/t.py --task-dir ~/mytasks --list tasks.txt -g @today | wc -l | sed -e's/ *//')

    # should I be focusing on something I'm doing now?
    set what_now (command cat ~/mytasks/tasks.txt | grep '@now' | wc -l | sed -e's/ *//')

    # Main
    echo -n (prompt_pwd)(set_color 008E00)"$git_full "
    if test $n_today -gt 0
        echo -n (set_color e71a1a)"$n_today✔"' '(set_color normal)
    end
    if test $what_now -gt 0
        echo -n (set_color FF0800)'!->> '
    else
        echo 🌳' '
    end
end

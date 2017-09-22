function fish_prompt
	test $SSH_TTY
    and printf (set_color red)$USER(set_color brwhite)'@'(set_color yellow)(prompt_hostname)' '
    test $USER = 'root'
    and echo (set_color red)"#"

    set git_branch (command git rev-parse --abbrev-ref HEAD 2> /dev/null)
    set git_stashed (command git rev-parse --verify --quiet refs/stash 2>/dev/null)

    set -l submodule_syntax
    set submodule_syntax "--ignore-submodules=dirty"
    set git_dirty (command git status -s $submodule_syntax  2> /dev/null)

    # put dirty branch indicator in prompt
    set -g __fish_git_prompt_char_dirty ±
    set -g __fish_git_prompt_char_stashed \u2708
    set -g __fish_git_prompt_char_dirty_and_stashed ± \u2708

    if [ -n "$git_branch" ]
        set git_status "  $git_branch"
        if [ -n "$git_dirty" ]
            if [ "$git_stashed" ]
                set git_full "$git_status $__fish_git_prompt_char_dirty_and_stashed"
            else
                set git_full "$git_status $__fish_git_prompt_char_dirty"
            end
        else
            if [ "$git_stashed" ]
                set git_full "$git_status $__fish_git_prompt_char_stashed"
            else
                set git_full "$git_status"
            end
        end

    else
        set git_status ""
    end

    # Main
    echo -n (set_color grey)(prompt_pwd)(set_color green)"$git_full" (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
end

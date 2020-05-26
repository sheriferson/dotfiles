# The following guide by Brett Terpstra was very helpful
# https://brettterpstra.com/2019/11/11/fish-further-exploration/

function __ntoday
    set n_today (command cat ~/mytasks/tasks.txt | grep '@today' | wc -l | sed -e's/ *//')
    if test $n_today -gt 0
        echo -n (set_color red)"✔$n_today"(set_color normal)
    else
        echo -n "☀️"
    end
end

function __decoration_char
    set n_what_now (command cat ~/mytasks/tasks.txt | grep '@now' | wc -l | sed -e's/ *//')
    if test $n_what_now -gt 0
        echo -n (set_color red -b d3d3d3)' ‼ '(set_color normal)' '
    else
        echo -n (set_color -b d3d3d3)' ᠅ '(set_color normal)' '
    end
end

function __ssh_badge
	if test -n "$SSH_CLIENT$SSH2_CLIENT$SSH_TTY"
		set_color -b d6aeec -o 2a0a8b
		echo -n " "(string upper (string sub -s 1 -l 1 (hostname -s)))" "
		set_color normal
	end
end

function __current_path
	# Replace HOME with ~
	set -l path (string replace "$HOME" (set_color a86ec8)"~"(set_color -d white) (pwd))
	# Highlight last path element
	set -l parts (string split "/" $path)
	set parts[-1] (set_color normal)(set_color -o brwhite)$parts[-1](set_color normal)
	set path (string join "/" $parts)

	echo -n " "$path(set_color normal)
end

function __git_status
    set git_branch (command git rev-parse --abbrev-ref HEAD 2> /dev/null)
    set git_tracked (git for-each-ref --format='%(upstream:short)' (command git symbolic-ref -q HEAD 2> /dev/null) 2> /dev/null)
    set git_stashed (command git rev-parse --verify --quiet refs/stash 2> /dev/null)

    set -l submodule_syntax
    set submodule_syntax "--ignore-submodules=dirty"
    set git_dirty (command git status -s $submodule_syntax  2> /dev/null)

    # put dirty branch indicator in prompt
    set  __fish_git_prompt_char_dirty ＊
    set  __fish_git_prompt_char_stashed ℎ
    set  __fish_git_prompt_char_dirty_and_stashed ＊ ℎ

    if [ -n "$git_branch" ]
        set git_behind (command git rev-list "$git_branch".."$git_tracked" --count 2> /dev/null)
        set git_ahead (command git rev-list "$git_tracked".."$git_branch" --count 2> /dev/null)

        set git_status "  $git_branch"
        if [ -n "$git_dirty" ]
            if [ "$git_stashed" ]
                set git_full "$git_status$__fish_git_prompt_char_dirty_and_stashed"
            else
                set git_full "$git_status"
            end
        else
            if [ "$git_stashed" ]
                set git_full "$git_status $__fish_git_prompt_char_stashed"
            else
                set git_full "$git_status"
            end
        end

        if test $git_behind -gt 0
            set git_full "$git_full $git_behind↓"
        end
        if test $git_ahead -gt 0
            set git_full "$git_full $git_ahead↑"
        end
    end

    if [ -n "$git_dirty" ]
        echo -n (set_color e67e00)$git_full (set_color normal)
    else
        echo -n (set_color brgreen)"$git_full "(set_color normal)
    end
end

function fish_prompt
    test $USER = 'root'
    and echo (set_color red)"#"

    # Main
    __ntoday
    __current_path
    __git_status
    __decoration_char
end

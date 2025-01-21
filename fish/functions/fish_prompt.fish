# The following guide by Brett Terpstra was very helpful
# https://brettterpstra.com/2019/11/11/fish-further-exploration/

function __ssh_badge
    if test -n "$SSH_CLIENT$SSH2_CLIENT$SSH_TTY"
        set_color -b d6aeec -o 2a0a8b
        echo " "(string upper (string sub -s 1 -l 1 (hostname -s)))" "(set_color normal)" "
    end
end

function __current_path
    # Replace HOME with ~
    set -l path (string replace "$HOME" "~" (pwd))
    echo $path
end

function __line
    set_color a6a6a6 # grey
    echo "* * *"
    set_color normal
end

function fish_prompt
    set -l status_num $status

    echo (__line)
    echo -n (__current_path)
    echo (venv_prompt)

    if test $status_num -eq 0
        echo -n "  »"
    else
        echo -n (print_bubble '⮾ '(fish_status_to_signal $status_num) red eeeeee)
    end

    echo -n (check_env)

    test $USER = 'root'
    and echo (set_color red)"#"

    __ssh_badge
end

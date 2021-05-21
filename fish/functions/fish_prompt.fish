# The following guide by Brett Terpstra was very helpful
# https://brettterpstra.com/2019/11/11/fish-further-exploration/

function __ssh_badge
	if test -n "$SSH_CLIENT$SSH2_CLIENT$SSH_TTY"
		set_color -b d6aeec -o 2a0a8b
		echo -n " "(string upper (string sub -s 1 -l 1 (hostname -s)))" "(set_color normal)" "
	end
end

function __current_path
	# Replace HOME with ~
	set -l path (string replace "$HOME" (set_color 6d8cb8)"~" (pwd))
	# Highlight last path element
	set -l parts (string split "/" $path)
	set parts[-1] (set_color normal)(set_color eca3c5)$parts[-1](set_color normal)
	set path (string join "/" $parts)

	echo -n $path(set_color normal)
end

function fish_prompt
    test $USER = 'root'
    and echo (set_color red)"#"

    echo -e '\r'
    __ssh_badge
    __current_path
    echo -e ' '(random choice ◐ ◑ ◒ ◓ ◔ ◕) ' '
end

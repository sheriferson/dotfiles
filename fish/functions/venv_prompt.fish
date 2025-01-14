function venv_prompt -d "Check if in a Python venv, and add a segment noting path of the venv."
    if test -n "$VIRTUAL_ENV"
        set -l parts (string split "/" (which python))
        print_bubble '  '(string join "/" $parts[-4..]) cyan f4ffff
    end
end

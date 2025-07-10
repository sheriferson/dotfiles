function check_env -d "Check if $ENV_BASE is set, if the string 'prod' appears in $ENV_BASE and add a warning segment if so"
    if test -n "$ENV_BASE"
        if [  (string match -r '.*prod.*' $ENV_BASE) ]
            echo (print_bubble "  "$ENV_BASE $fish_color_normal ff8861)
        else
            echo (print_bubble "󰓽  "$ENV_BASE $fish_color_normal dae2f4)
        end
    else
        echo " "
    end
end

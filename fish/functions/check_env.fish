function check_env -d "Check if the string prod appears in $ENV_BASE and add a warning segment if so"
    if [  (string match -r '.*prod.*' $ENV_BASE) ]
        echo " "(print_bubble "  "$ENV_BASE $fish_color_error f5ddea)" "
    else
        echo " "(print_bubble "󰓽  "$ENV_BASE $fish_color_normal dae2f4)" "
    end
end

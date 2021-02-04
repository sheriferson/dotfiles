function fish_right_prompt -d "Write out the right prompt with non zero exit status and date/time"
    set nstat $status
    if test $nstat -ne 0
        echo (set_color red)(set_color eeeeee)(set_color -b red)$nstat(set_color -b normal)(set_color red)(set_color red)
    end
    echo -n (set_color 00a4f7)(set_color eeeeee)(set_color -b 00a4f7)(date +"%m-%d %H:%M:%S")(set_color -b normal)(set_color 00a4f7)(set_color normal)
end

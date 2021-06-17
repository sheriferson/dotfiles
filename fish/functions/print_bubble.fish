function print_bubble -a message fcolor bcolor -d "Print text with bubble surrounds"
    echo (set_color $bcolor)(set_color $fcolor)(set_color -b $bcolor)$message(set_color -b normal)(set_color $bcolor)(set_color normal)
end

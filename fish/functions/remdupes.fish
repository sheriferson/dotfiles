# this really should not be necessary
# but I am including it for now until fish adds
# a function that does this
function remdupes --description 'Remove duplicates from environment variable'
    if test (count $argv) = 1
        set -l newvar
        set -l count 0
        for v in $$argv
            if contains -- $v $newvar
                set count (math $count + 1)
            else
                set newvar $newvar $v
            end
        end
        set $argv $newvar
        test $count -gt 0
    else
        for a in $argv
            remdupes $a
        end
    end
end

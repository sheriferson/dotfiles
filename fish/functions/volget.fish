function volget -d "Get system volume setting."
    osascript -e "return output volume of (get volume settings)"
end

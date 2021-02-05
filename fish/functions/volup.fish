function volup -d "Turn system volume up."
    osascript -e "
        set theoutput to output volume of (get volume settings)
        set volume output volume (theoutput + 6.25)
        "
end

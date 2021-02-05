function volset -d "Set system volume setting."
    osascript -e "set volume output volume $argv"
end

#!/usr/bin/env fish

set API_ENDPOINT "https://api.sherif.in"

set response (curl -s "$API_ENDPOINT/nowplaying")
set playing_something (echo $response | jq 'if . == {} then "false" else "true" end' -r)

if test "$playing_something" = "true"
    set output " "(echo $response | jq -r '"\(.artist) - \(.title)"')
    set playingstatus "nowplaying"
else
    set response (curl -s "$API_ENDPOINT/lastplayed")
    set output "󰥠 "(echo $response | jq -r '"\(.title) by \(.artist) from <i>\(.album)</i>, \(.time_since) ago."')
    set playingstatus "lastplayed"
end

echo (jq -n --arg text "$output" --arg class "$playingstatus" '{text: $text, class: $class}')

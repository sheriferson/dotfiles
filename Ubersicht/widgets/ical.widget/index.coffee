# A widget that displays your calendar events for today and tomorrow
# Made by David Brooks
# Edited by Sherif Soliman
# First time ever writing in JavaScript
# Using icalBuddy found here: http://hasseg.org/icalBuddy/

# This command shows all of your events for today and tomorrow
command: "'ical.widget/icalBuddy' -n -b '' -nnr '\r' -ea -npn -nc -eep 'url,notes,attendees' -ps '| </br><span>☕︎</span> | </br><span>@</span> |' -po 'datetime,title,location' eventsToday 2>/dev/null"

# Uncomment this command if you want to not show which calendar the events are for
#command: "'ical.widget/icalBuddy' -sd -nc -n eventsToday+1 2>/dev/null"

# the refresh frequency is 1 hour
refreshFrequency: '5m'

style: """
  bottom: 70px
  left: 10px
  color: #fff
  font-family: -apple-system
  padding-bottom:30px

  div
    display: block
    text-shadow: 0 0 1px rgba(#000, 0.5)
    font-size: 16px
    font-weight: 100
    padding-left: 22px
    text-indent: -22px

  span
    display: inline-block
"""

renderLine: (string) -> """
  <div class='ical'>
    <div class='label'>#{string}</div>
    </p>
"""

update: (output, domEl) ->
  lines = output.split('\n')
  $(domEl).html ''
  $(domEl).html '<i style="color:grey;">Nothing scheduled. Maybe you should read something.</i>' if output is ""
  for line in lines
  	$(domEl).append @renderLine(line)

# Übersicht widgets

[Übersicht](http://tracesof.net/uebersicht/) is a neat utility that lets you create widgets to display information on your desktop or perform invisible actions. Widgets are easy to create using an `index.coffee` file, and each widget can run on a different schedule.

If you're interested, you should check out Übersicht's [thriving gallery of widgets](http://tracesof.net/uebersicht-widgets/ "Übersicht widget gallery").

These widgets contain hardcoded paths and dependencies that mean they might not work for you without some modification. Feel free to repurpose them as you please.

Here's a list of the widgets I use:

- **`ical.widget`** shows me a list of event names, times, and locations in the bottom left. If I have no events, it wisely suggests I read something. I should listen more often.

- **`kindle-clippings.widget`** helps with an annoyance that has always nagged at me: how do I remind myself of all the good things I've read in books? How do I revisit important or meaningful parts? `kindle-clippings` parses the `My Clippings.txt` file you find on your Kindle and which holds all your highlights and notes, and displays a random chunk in the top right of my desktop. I won't pretend I always read it, but sometimes I do, and that's better than nothing.

    Here's the current clipping for posterity:

    > The Last Lion: Winston Spencer Churchill, Alone 1932-1940 (William Manchester) October 19, 2015 No title  
    > — to reach the House of Commons MPs had to pass through a line of pickets carrying signs bearing the single name CHURCHILL in a blue circle.

- **`spotify-art.widget`** I love album art. For some reason, Spotify puts a limit on how big the album art can be, and that won't do. This widget downloads the album art of the current track to `~/albumArtSpotify`.

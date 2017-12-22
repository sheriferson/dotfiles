"""
Script to download album art of current Spotify track and save it in
Artist - Album.jpg
"""
import os
import subprocess
import sys
import urllib.request

home = os.path.expanduser('~')
applescript_path = os.path.join(home,
                                'dotfiles',
                                'Ubersicht',
                                'widgets',
                                'spotify-art.widget',
                                'spotifyart.applescript')

try:
    spotify_processes = str.split(subprocess.check_output(['pgrep', 'Spotify']).decode())
    if len(spotify_processes) < 2:
        sys.exit()
except:
    sys.exit()

spotify = subprocess.check_output(['osascript', applescript_path])
artist, album, track_name, album_art_url = str.splitlines(spotify.decode())

artFileName = artist + " - " + album + ".jpg"
artFileName.replace(':', ';')
artFilePath = os.path.join(home, 'albumArtSpotify', artFileName)

if os.path.isfile(artFilePath) is False:
    urllib.request.urlretrieve(album_art_url, artFilePath)

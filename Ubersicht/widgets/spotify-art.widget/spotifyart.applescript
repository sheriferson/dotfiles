tell application "Spotify"
        set theTrack to current track
        set theArtist to artist of theTrack
	set theAlbum to album of theTrack
        set theName to name of theTrack
	set image_url to artwork url of theTrack

	return theArtist & "\n" & theAlbum & "\n" & theName & "\n" & image_url
end tell

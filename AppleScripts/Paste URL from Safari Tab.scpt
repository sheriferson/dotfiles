set _old_delims to AppleScript's text item delimiters
set AppleScript's text item delimiters to {""}

tell application "System Events"
	set _current_app to name of the first process whose frontmost is true
end tell

tell application "Safari"
	set _urls to {}
	repeat with i from 1 to 6 -- how many Safari windows to show URLs from
		try
			set _urls_from_this_window to URL of every tab of window i
			if (count of _urls_from_this_window) > 0 then
				-- Insert blank line between each window of tabs
				if i > 1 then set _urls to _urls & ""
				set _urls to _urls & _urls_from_this_window
			end if
		end try
	end repeat
end tell

repeat with _url in _urls
	# Strip the "http://", which allows type-ahead in the list.
	# Doesn't strip "https://", and doesn't strip "www.".
	if _url begins with "http://" then
		set contents of _url to characters 8 thru -1 of _url as string
	end if
end repeat

tell application _current_app
	if (count of _urls) > 1 then
		set _choice to choose from list _urls OK button name "Paste" with prompt "Paste URL from Safari:"
		try
			set _chosen_url to item 1 of _choice
			if _chosen_url is "" then return
		on error
			return -- when hit Cancel button
		end try
	else
		set _chosen_url to item 1 of _urls
	end if
	try
		if _chosen_url does not start with "http" then
			set _chosen_url to "http://" & _chosen_url
		end if
		-- `set the clipboard` always adds style attributes, so use pbcopy hack instead
		-- Must specify /bin/echo because do shell script uses sh not bash, which has a built-in echo that doesn't support options like -n
		do shell script "/bin/echo -n " & quoted form of _chosen_url & " | pbcopy"
		tell application "System Events" to keystroke "v" using {command down} -- shift down here caused problems with BBEdit, where that means Paste Previous Clipboard; had only used that to get plain text from the clipboard in the first place
	end try
end tell


set AppleScript's text item delimiters to _old_delims

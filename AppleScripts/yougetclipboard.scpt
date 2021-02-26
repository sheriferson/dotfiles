# The script uses you-get to download the video whose url is in the clipboard
set dest_folder to choose folder with prompt "Select folder for video download:"
set dest_folder to POSIX path of dest_folder
set url to (the clipboard as text)

set yougetcommand to "/usr/local/bin/you-get -o " & dest_folder & " '" & url & "'"
do shell script yougetcommand

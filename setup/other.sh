#!/bin/bash

dotfiles_path="/Users/$USER/dotfiles"

# ooo        ooooo ooo        ooooo
# `88.       .888' `88.       .888'
#  888b     d'888   888b     d'888
#  8 Y88. .P  888   8 Y88. .P  888
#  8  `888'   888   8  `888'   888
#  8    Y     888   8    Y     888
# o8o        o888o o8o        o888o

# link MailMate Resources
printf "\n"
echo "Linking MailMate Resources directory..."
ln -ns "$dotfiles_path/MailMate/Resources/" /Users/$USER/Library/Application\ Support/MailMate/
ln -ns "$dotfiles_path/MailMate/Styles.plist" /Users/$USER/Library/Application\ Support/MailMate/Styles.plist

#       .o.        .oooooo..o
#      .888.      d8P'    `Y8
#     .8"888.     Y88bo.
#    .8' `888.     `"Y8888o.
#   .88ooo8888.        `"Y88b
#  .8'     `888.  oo     .d8P
# o88o     o8888o 8""88888P'

# link AppleScripts

printf "\n"
echo "Linking iTunes AppleScripts..."
mkdir -p "/Users/$USER/Library/iTunes/Scripts/"
ln -ns "$dotfiles_path/AppleScripts/Play Random Album.scptd" /Users/$USER/Library/iTunes/Scripts/

echo "Linking user AppleScripts..."
mkdir -p "/Users/$USER/Library/Scripts/"
cp $dotfiles_path/AppleScripts/iTunes* "/Users/$USER/Library/Scripts/"
cp ln -ns "$dotfiles_path/AppleScripts/Paste URL from Safari Tab.scpt" "/Users/$USER/Library/Scripts/"
cp ln -ns "$dotfiles_path/AppleScripts/yougetclipboard.scpt" "/Users/$USER/Library/Scripts/"

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

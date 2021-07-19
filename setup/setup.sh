#!/bin/bash

lightblue='\033[1;34m'
nc='\033[0m'
function sprint () {
    echo -e "\n${lightblue}$1${nc}\n"
}

dotfiles_path="/Users/$USER/dotfiles"

# Xcode command line tools
sprint "Installing Xcode Command Line Tools..."
xcode-select --install

# link dotfiles
sprint "Running dotfile and configuration linking script..."
bash $(dirname $0)/dotfiles.sh

# homebrew
sprint "Installing homebrew and homebrew packages..."
sprint "\nChecking if Homebrew is installed..."

if ! type "brew" > /dev/null; then
    sprint "Installing Homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

sprint "Installing Homebrew recipes"
brew bundle --file ../Brewfile

# pip
sprint "Installing pip packages (for Python3)"
pip3 install -r ../requirements.txt

# personal projects
sprint "Checking for and cloning personal projects..."
bash $(dirname $0)/projects.sh

# Github reops
sprint "Cloning Github repos..."
bash $(dirname $0)/github-repos.sh

# R packages
sprint "Installing R packages"
Rscript $(dirname $0)/rpackages.R

# hidden preferences
sprint "Setting some hidden preferences..."
bash $(dirname $0)/hiddenprefs.sh

# link MailMate Resources
printf "\n"
echo "Linking MailMate Resources directory..."
ln -ns "$dotfiles_path/MailMate/Resources/" /Users/$USER/Library/Application\ Support/MailMate/
ln -ns "$dotfiles_path/MailMate/Styles.plist" /Users/$USER/Library/Application\ Support/MailMate/Styles.plist

# link AppleScripts
echo "Linking user AppleScripts..."
mkdir -p "/Users/$USER/Library/Scripts/"
ln -ns "$dotfiles_path/AppleScripts/Paste URL from Safari Tab.scpt" "/Users/$USER/Library/Scripts/"
ln -ns "$dotfiles_path/AppleScripts/yougetclipboard.scpt" "/Users/$USER/Library/Scripts/"

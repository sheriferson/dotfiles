#!/bin/bash

lightblue='\033[1;34m'
nc='\033[0m'

function sprint () {
    echo -e "\n${lightblue}$1${nc}\n"
}

# check to see if homebrew is available
# ig not, install it
sprint "\nChecking if Homebrew is installed..."

if ! type "brew" > /dev/null; then
    sprint "Installing Homebrew"

	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

sprint "Installing Homebrew recipes"

brew tap homebrew/science

brewarray=(
    cmake
    figlet
    fish
    gcc
    git
    gnupg
    gpg-agent
    icdiff
    neovim
    pinentry-mac
    python3
    reattach-to-user-namespace
    tmux
    youtube-dl
)

for ii in "${brewarray[@]}"
do
    brew install $ii
done

sprint "Installing Homebrew cask recipes"

caskarray=(
    1password
    bitbar
    firefox
    google-chrome
    itsycal
    julia
    keyboard-maestro
    launchbar
    launchcontrol
    musicbrainz-picard
    numi
    ubersicht
    vlc
    xld
)

for ii in "${caskarray[@]}"
do
    brew cask install $ii
done

# R specific
R CMD javareconf JAVA_CPPFLAGS=-I/System/Library/Frameworks/JavaVM.framework/Headers

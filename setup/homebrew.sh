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

brewarray=(
    cmake
    exa
    ffmpeg
    figlet
    fish
    font-mplus-1mn-nerd-mono
    gcc
    git
    gnupg
    gpg-agent
    harfbuzz
    imagemagick
    inetutils
    librsvg
    neovim
    optipng
    pandoc
    pinentry
    python3
    r
    tmux
    yarn
)

for ii in "${brewarray[@]}"
do
    brew install $ii
done

sprint "Installing Homebrew cask recipes"

caskarray=(
    1password
    bbedit
    bitbar
    fastscripts
    iina
    itsycal
    keyboard-maestro
    launchbar
    launchcontrol
    mactex
    moom
    musicbrainz-picard
    pkg-config
    shortcat
    soulver
    ubersicht
    vanilla
    xld
)

for ii in "${caskarray[@]}"
do
    brew cask install $ii
done

sprint "Tapping universal-tags"
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags

# R specific
R CMD javareconf JAVA_CPPFLAGS=-I/System/Library/Frameworks/JavaVM.framework/Headers

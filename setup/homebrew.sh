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
    ffmpeg
    figlet
    fish
    gcc
    git
    gnupg
    gpg-agent
    harfbuzz
    icdiff
    imagemagick
    inetutils
    librsvg
    neovim
    optipng
    pandoc
    pinentry-mac
    python3
    r
    tmux
    yarn
    you-get
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
    firefox
    google-chrome
    iina
    itsycal
    julia
    keyboard-maestro
    launchbar
    launchcontrol
    mactex
    musicbrainz-picard
    numi
    pkg-config
    rest
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

sprint "Tapping caskroom/fonts"

brew tap caskroom/fonts
brew cask install font-fira-code

sprint "Tapping universal-tags"
brew tap universal-ctags/universal-ctags
brew install --HEAD universal-ctags

# R specific
R CMD javareconf JAVA_CPPFLAGS=-I/System/Library/Frameworks/JavaVM.framework/Headers

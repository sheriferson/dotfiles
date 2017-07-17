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

array=(
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
    r
    reattach-to-user-namespace
    tmux
)

for ii in "${array[@]}"
do
    brew install $ii
done

# R specific
R CMD javareconf JAVA_CPPFLAGS=-I/System/Library/Frameworks/JavaVM.framework/Headers

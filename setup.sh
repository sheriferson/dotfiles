#!/bin/bash

lightblue='\033[1;34m'
nc='\033[0m'

function sprint () {
    echo -e "${lightblue}$1${nc}\n"
}

function clone_project () {
    if [ ! -d "/Users/sherif/projects/${1}" ]
    then
        sprint "Cloning ${1}..."
        git clone git@github.com:sheriferson/$1.git /Users/sherif/projects/$1
    else
        sprint "Found ${1}"
    fi
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
    neovim
    pinentry-mac
    python3
    r
    tmux
)

for ii in "${array[@]}"
do
    brew install $ii
done

# R specific
R CMD javareconf JAVA_CPPFLAGS=-I/System/Library/Frameworks/JavaVM.framework/Headers

sprint "Installing pip packages"
# pip

piparray=(
    bpython
    jupyter
    neovim
    notebook
    numpy
    powerline-status
    scipy
)

for ii in "${piparray[@]}"
do
    pip3 install $ii
done

# personal projects

sprint "Checking for and cloning personal projects"

mkdir -p /Users/sherif/projects

projectarray=(
    caplog
    KSComCheck
    punread
    sherifsoliman.com
    simplestatistics
    t
    Visualize.mmBundle
)

for ii in "${projectarray[@]}"
do
    clone_project $ii
done

# R packages

sprint "Installing R packages"

Rscript $(dirname $0)/setup-rpackages.R

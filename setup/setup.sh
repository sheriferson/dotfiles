#!/bin/bash

lightblue='\033[1;34m'
nc='\033[0m'

function sprint () {
    echo -e "\n${lightblue}$1${nc}\n"
}

# Xcode command line tools
sprint "Installing Xcode Command Line Tools..."
xcode-select --install

# link dotfiles
sprint "Running dotfile and configuration linking script..."
bash $(dirname $0)/dotfiles.sh

# homebrew
sprint "Installing homebrew and homebrew packages..."
bash $(dirname $0)/homebrew.sh

# pip
sprint "Installing pip packages (for Python3)"
bash $(dirname $0)/pip.sh

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

# Other (e.g., MailMate linking)
sprint "Some final links..."
bash $(dirname $0)/other.sh

#!/bin/bash

lightblue='\033[1;34m'
nc='\033[0m'

function sprint () {
    echo -e "\n${lightblue}$1${nc}\n"
}

# homebrew

sprint "Installing homebrew and homebrew packages..."
bash $(dirname $0)/homebrew.sh

# pip

sprint "Installing pip packages (for Python3)"
bash $(dirname $0)/pip.sh

# personal projects

sprint "Checking for and cloning personal projects..."
bash $(dirname $0)/projects.sh

# R packages

sprint "Installing R packages"
Rscript $(dirname $0)/rpackages.R

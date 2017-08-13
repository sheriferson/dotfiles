#!/bin/bash

lightblue='\033[1;34m'
nc='\033[0m'

function sprint () {
    echo -e "\n${lightblue}$1${nc}\n"
}

function clone_repo () {
    sprint "Cloning ${1}..."
    git clone $1
}

mkdir -p /Users/sherif/Github
cd /Users/sherif/Github

repoarray=(
    https://github.com/sjl/z-fish.git
)

for ii in "${repoarray[@]}"
do
    clone_repo $ii
done

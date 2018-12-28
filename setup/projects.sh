#!/bin/bash

lightblue='\033[1;34m'
nc='\033[0m'

function sprint () {
    echo -e "\n${lightblue}$1${nc}\n"
}

function clone_project () {
    if [ ! -d "/Users/sherif/projects/${1}" ]
    then
        sprint "Cloning ${1}..."
        git clone git@github.com:sheriferson/$1.git /Users/sherif/projects/$1
    else
        sprint "Found ${1}, running git pull"
        git -C "/Users/sherif/projects/${1}" pull
    fi
}

mkdir -p /Users/sherif/projects

projectarray=(
    caplog
    jsimplestats
    KSComCheck
    punread
    sherif.io
    sherif.in
    simplestatistics
    t
    Visualize.mmBundle
)

for ii in "${projectarray[@]}"
do
    clone_project $ii
done

#!/bin/bash

piparray=(
    dateparser
    flake8
    jedi
    jedi-language-server
    matplotlib
    mypy
    numpy
    pandas
    pycodestyle
    pyflakes
    pylint
    pynvim
    python-dateutil
    python-language-server
    scikit-learn
    scipy
    termcolor
    terminaltables
    you-get
)

for ii in "${piparray[@]}"
do
    pip3 install -U $ii
done

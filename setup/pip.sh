#!/bin/bash

piparray=(
    bpython
    dateparser
    jupyter
    jupyter_contrib_nbextensions
    matplotlib
    neovim
    notebook
    numpy
    powerline-status
    scikit-learn
    scipy
    seaborn
    termcolor
    terminaltables
)

for ii in "${piparray[@]}"
do
    pip3 install -U $ii
done

# enable jupyter notebook nbextensions
jupyter contrib nbextension install --user

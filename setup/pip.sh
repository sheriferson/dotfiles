#!/bin/bash

piparray=(
    bpython
    dateparser
    jupyter
    jupyter_contrib_nbextensions
    jupyterlab
    matplotlib
    neovim
    notebook
    numpy
    pandas
    radian
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

# install jupyter lab contents extension
jupyter labextension install jupyterlab-toc

#!/bin/bash

piparray=(
    bpython
    dateparser
    flake8
    jupyter
    jupyter_contrib_nbextensions
    jupyterlab
    matplotlib
    mypy
    notebook
    numpy
    pandas
    pycodestyle
    pyflakes
    pynvim
    python-dateutil
    python-language-server
    radian
    scikit-learn
    scipy
    seaborn
    termcolor
    terminaltables
    you-get
)

for ii in "${piparray[@]}"
do
    pip3 install -U $ii
done

# enable jupyter notebook nbextensions
jupyter contrib nbextension install --user

# install jupyter lab contents extension
jupyter labextension install jupyterlab-toc

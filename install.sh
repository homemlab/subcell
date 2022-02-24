#!/usr/bin/env bash

echo "Preparing"
unset CONDA_OVERRIDE_GLIBC
echo "Installing environment..."
ls $PWD/*.yaml > envs.tmp
while read i; do
    ENV_NAME=$(cat $i | grep 'name:' | awk '{print$2}')
    if [[ $(conda env list | grep $ENV_NAME | awk '{print$1}') == 'subcell' ]] ; then
        echo "A conda environment with the same name already exists, make sure env.yaml requirements are met or remove this environment (\$ conda env remove -n subcell) and re-run this install script"
    else
        conda env create -q -f $i
    fi
done < envs.tmp
rm envs.tmp
#!/usr/bin/env bash

echo "Preparing"
# Install Anaconda (Modified to install latest 64bit Linux Anaconda release - https://stackoverflow.com/questions/48230953/permanent-link-to-latest-anaconda)
if [ -x "$(command -v conda)" ]; then
  echo 'Anaconda is already installed!'
else
  curl -fsSL -o anaconda_repo.tmp "https://repo.continuum.io/archive/"
  RELEASE=$(cat anaconda_repo.tmp | grep Anaconda3 | grep Linux | awk 'END{print}' | sed 's/^.*"\(.*\)".*$/\1/')
  echo 'Downloading Anaconda...'
  curl -fSL -o anaconda_install.sh "https://repo.continuum.io/archive/$RELEASE"
  echo 'Installing Anaconda'
  bash anaconda_install.sh -b
  rm anaconda_*.sh
  echo 'Anaconda successfully installed'
fi
source ~/.bash_profile >& /dev/null
source ~/.bashrc >& /dev/null

unset CONDA_OVERRIDE_GLIBC

# Install Anaconda environment from .yaml files in the same folder as this script

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
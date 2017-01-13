#!/bin/bash

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "=== Installing Oh-My-ZSH"
  if [ $(command -v curl) ]; then 
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  else
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
  fi
fi

echo "=== Installing local config"

cd $HOME/.oh-my-zsh
rm -rf custom
if [ $(command -v git) ]; then
  git clone http://github.com/sabinmarcu/zshrc.git custom
else 
  if [ $(command -v curl) ]; then 
    sh -c "$(curl -OL http://github.com/sabinmarcu/zshrc/archive/master.zip)"
  else
    sh -c "$(wget http://github.com/sabinmarcu/zshrc/archive/master.zip)"
  fi
  unzip master.zip
  mv zshrc-master custom
  rm master.zip
fi

if [ -e $HOME/.zshrc ]; then
    mv $HOME/.zshrc $HOME/.zshrc.old
fi

ln -s $HOME/.oh-my-zsh/custom/zshrc $HOME/.zshrc
touch $HOME/.zshaliases

echo "=== Done"

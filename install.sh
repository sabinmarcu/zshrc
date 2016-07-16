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

cd $HOME/.oh-my-zsh/custom
mv plugins plugins.old
if [ $(command -v git) ]; then
  git clone http://github.com/sabinmarcu/zshrc.git plugins
else 
  if [ $(command -v curl) ]; then 
    sh -c "$(curl -OL http://github.com/sabinmarcu/zshrc/archive/master.zip)"
  else
    sh -c "$(wget http://github.com/sabinmarcu/zshrc/archive/master.zip)"
  fi
  unzip master.zip
  mv zshrc-master plugins
  rm master.zip
fi
cd plugins
ln -s $HOME/.zshrc $HOME/.oh-my-zsh/custom/plugins/zshrc

echo "=== Done"

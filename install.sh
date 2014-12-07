#!/bin/bash

echo "Installing zsh-config"
if [ -d $HOME/.zsh ] ; then
    mv $HOME/.zsh $HOME/.zsh.old
fi
ln -s $PWD $HOME/.zsh
if [ -e $HOME/.zshrc ] ; then
    echo "Found old .zshrc, moving to .zshrc.old"
    mv $HOME/.zshrc $HOME/.zshrc.old
fi
echo "ZSH=$HOME/.zsh" > $HOME/.zshrc
echo "source \$ZSH/zshrc" >> $HOME/.zshrc

echo "Installation complete."

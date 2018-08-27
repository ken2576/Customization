#!/bin/sh
# Ubuntu fresh install setup script

echo "Updating package list..."
sudo apt-get update

echo "Installing basic packages..."
sudo apt-get -q -y install wget python3-dev python3-pip htop openssh python python-pip python-setuptools curl tmux

echo "Installing zsh..."
sudo apt-get -q -y install zsh

echo "Installing oh-my-zsh..."
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo "Using zsh..."
chsh -s $(which zsh)

echo "Installing virtualenv..."
easy_install virtualenv

echo "Installing node..."
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.1/install.sh | bash
nvm install node

echo "Installing thefuck"
sudo pip3 install thefuck
sudo cat <<EOT>> ~/.zshrc
"eval "$(thefuck --alias FUCK)""
EOT

echo "Installing tldr"
sudo pip install tldr



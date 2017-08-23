#!/bin/sh

# Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cp ./zshrc $HOME/.zshrc
cp -r ./oh-my-zsh/ $HOME/.oh-my-zsh/

# i3
cp -r ./config/i3/ $HOME/.config/i3/

# vim
cp ./vimrc $HOME/.vimrc

mkdir .vim
cp ./ycm_extra_conf.py $HOME/.vim/.ycm_extra_conf.py

# Get git subrepo
GIT_EXT = $HOME/.config/git
mkdir -p $GIT_EXT
git clone https://github.com/ingydotnet/git-subrepo $GIT_EXT/git-subrepo

cp ./gitignore_global $HOME/.gitignore_global

python3 ./install.py

# Install Rust
curl https://sh.rustup.rs -sSf | sh

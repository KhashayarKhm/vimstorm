#! /bin/bash

# install simple dependecies
sudo pacman -S neovim git perl git-delta curl fzf bat

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# config git-delta
git config --global core.pager delta
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.navigate true
git config --global merge.conflictstyle diff3
git config --global diff.colorMoved default

# integration bat with fzf
fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'

# init ternjs config file
echo "{
  “plugins”:
  {
    “node”: {}
  }
}" >> ~/.tern-config

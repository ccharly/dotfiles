Personal configuration (.* files)
====

# Preriquisites

> Install `zsh` and `curl` on your system

Install oh-my-zsh using this command

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

# Install

Move to the git repository and execute:

```
ln -sf $(pwd)/dot.gitconfig $HOME/.gitconfig
ln -sf $(pwd)/dot.vim $HOME/.vim
ln -sf $(pwd)/dot.vim/vimrc $HOME/.vimrc
mkdir -p $HOME/.config
```

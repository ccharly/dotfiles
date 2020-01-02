Personal configuration (.* files)
====

# Preriquisites

> Install `zsh` and `curl` on your system

Install `oh-my-zsh`:

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install `powerlevel10k` zsh theme:

> Make sure to install `oh-my-zsh` first as the following depends on specific env variables!

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

# Install

Move to the git repository and execute:

```
ln -sf $(pwd)/dot.zshrc $HOME/.zshrc
ln -sf $(pwd)/dot.gitconfig $HOME/.gitconfig
ln -sf $(pwd)/dot.vim $HOME/.vim
ln -sf $(pwd)/dot.vim/vimrc $HOME/.vimrc
mkdir -p $HOME/.config
```

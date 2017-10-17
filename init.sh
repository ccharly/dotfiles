#!/bin/bash

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
THIS_TMP="$( mktemp -d )"

make_symlink() {
	ln -sf $THIS_DIR/$1 $HOME/$2
}

make_home_symlink() {
	make_symlink $1 $2
	ln -sf $HOME/$2 $HOME/$3
}

make_vim_old_rec() {
    if [ -e "$1" ]; then
        make_vim_old_rec $1.old
    else
        echo $1
    fi
}

make_vim_old() {
    make_vim_old_rec $HOME/.vim.old
}

##
echo ":: Let's go"

## Powerline-fonts
git clone https://github.com/Lokaltog/powerline-fonts.git $THIS_TMP/powerline-fonts
$THIS_TMP/powerline-fonts/install.sh

## Pathogen
mkdir -p dot.vim/autoload
curl -LSso dot.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

## Install vim addons
mkdir -p dot.vim/bundle
cd dot.vim/bundle
git clone https://github.com/tpope/vim-fugitive
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/scrooloose/syntastic
git clone https://github.com/tpope/vim-surround
git clone https://github.com/kien/ctrlp.vim
git clone https://github.com/altercation/vim-colors-solarized
git clone https://github.com/bling/vim-airline
git clone https://github.com/majutsushi/tagbar
git clone https://github.com/valloric/youcompleteme
git clone https://github.com/altercation/vim-colors-solarized
git clone https://github.com/flazz/vim-colorschemes


## Backing up if possible
if [ -e "$HOME/.vim" ]; then
    OLD_VIM="$( make_vim_old )"
	echo ":: .vim -> $OLD_VIM"
  	mv $HOME/.vim $OLD_VIM
fi

##
make_symlink "dot.vim" ".vim"
make_home_symlink "dot.vimrc" ".vim/vimrc" ".vimrc"

##
echo ":: Done!"

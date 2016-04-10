#!/bin/sh

PWD=$( pwd )

make_symlink() {
	ln -sf $PWD/$1 $HOME/$2
}

make_home_symlink() {
	make_symlink $1 $2
	ln -sf $HOME/$2 $HOME/$3
}

has() {
    if ! which $1; then
      echo "error: install '$1' first"
      exit 1
    fi
}

# Move to init.sh directory
cd $( dirname $0 )

# Check required stuff
has curl
has ctags

# Move existing .vim/ to .vim.$$.bk if existing
if [ -e $HOME/.vim ] && [ ! -e $HOME/.vim/vimrc.plugins ]; then
	echo "Backing up your old .vim directory"
  	mv $HOME/.vim $HOME/.vim.$$.bk
fi

# Get NeoBundle for vim
if [ ! -e $HOME/.vim/bundle/neobundle.vim ]; then
    curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
fi

# Get powerline-fonts
if [ ! -e /tmp/powerline-fonts ]; then
    git clone https://github.com/Lokaltog/powerline-fonts.git /tmp/powerline-fonts
fi
bash /tmp/powerline-fonts/install.sh # Does not work with `sh`..

make_symlink      "dot.vim" ".vim"
make_home_symlink "dot.vimrc" ".vim/vimrc" ".vimrc"
make_home_symlink "dot.vimrc.plugins" ".vim/vimrc.plugins" ".vimrc.plugins"

# Everything is done now!
echo "Done!"

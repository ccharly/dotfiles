#!/bin/sh

PWD=$( pwd )

make_symlink() {
	ln -sf $PWD/$1 $HOME/$2
}

make_home_symlink() {
	make_symlink $1 $2
	ln -sf $HOME/$2 $HOME/$3
}

# Get NeoBundle for vim
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh

# Get powerline-fonts
if [ ! -e /tmp/powerline-fonts ]; then
    git clone https://github.com/Lokaltog/powerline-fonts.git /tmp/powerline-fonts
fi
bash /tmp/powerline-fonts/install.sh # Does not work with `sh`..

# Move existing .vim/ to .vim.$$.bk if existing
if [ -e "$HOME/.vim" ]; then
	echo "Backing up your old .vim directory"
  	mv $HOME/.vim $HOME/.vim.$$.bk
fi

make_symlink "dot.vim" ".vim"
make_home_symlink "dot.vimrc" ".vim/vimrc" ".vimrc"
make_home_symlink "dot.vimrc.plugins" ".vim/vimrc.plugins" ".vimrc.plugins"

# Everything is done now!
echo "Done!"

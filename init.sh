#!/bin/sh

PWD=$( pwd )
HOME=~

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
git clone https://github.com/Lokaltog/powerline-fonts.git /tmp/powerline-fonts && bash /tmp/powerline-fonts/install.sh

make_symlink "dot.vim" ".vim"
make_home_symlink "dot.vimrc" ".vim/vimrc" ".vimrc"
make_home_symlink "dot.vimrc.plugins" ".vim/vimrc.plugins" ".vimrc.plugins"

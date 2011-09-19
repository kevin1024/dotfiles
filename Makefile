all: install-vim

install-vim:
	rm -rf ~/.vim ~/.vimrc
	rm -rf `pwd`/vim/bundle
	ln -s `pwd`/vim ~/.vim
	ln -s ~/.vim/vimrc ~/.vimrc
	git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	vim -c ":BundleInstall"


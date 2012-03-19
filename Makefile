all: install-vim install-xdefaults install-sshconfig install-xmonad

install-vim:
	rm -rf ~/.vim ~/.vimrc
	rm -rf `pwd`/vim/bundle
	ln -s `pwd`/vim ~/.vim
	ln -s ~/.vim/vimrc ~/.vimrc
	git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	vim -c ":BundleInstall"
	cd ~/.vim/bundle/command-t/ruby/command-t && ruby extconf.rb && make

install-xdefaults:
	rm -f ~/.Xdefaults
	ln -s `pwd`/Xdefaults ~/.Xdefaults

install-sshconfig:
	rm -f ~/.ssh/config
	mkdir -p ~/.ssh/
	ln -s `pwd`/ssh_config ~/.ssh/config

install-xmonad:
	rm -f ~/.xmonad/xmonad.hs
	mkdir -p ~/.xmonad/
	ln -s `pwd`/xmonad.hs ~/.xmonad/xmonad.hs

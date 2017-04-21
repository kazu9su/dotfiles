HOMEBREW=$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)
all: install

help:
	cat Makefile

install:
	git submodule init
	git submodule update
	perl ./copies.pl

anyenv:
	git clone https://github.com/riywo/anyenv.git ~/.anyenv
	git clone https://github.com/znz/anyenv-update.git ~/.anyenv/plugins/anyenv-update

mac: brew_install

brew_install:
	which brew || ruby -e ${HOMEBREW}
	brew tap homebrew/bundle
	brew bundle
	brew update

brew_dump:
	rm -rf Brewfile
	brew bundle dump

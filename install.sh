#!/usr/bin/env bash

command -v git >/dev/null 2>&1 && echo Git is already installed \
	|| yay -S git

cd $HOME

# TODO: clone dotfiles from github or similar

# TODO: replace config files with symlinks to dotfiles

# TODO: install appropriate apps

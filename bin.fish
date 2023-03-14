#!/usr/bin/env fish

set target "$HOME/.local/bin/"


for b in $HOME/.dotfiles/_bin/*
    if test -e $target(basename $b)
        echo $target(basename $b) "-- Link exists. Skipping..."
    else
        ln -sv "$b" "$target"
    end
    # echo -e "$bin --> $target$SUCCESS SUCCESS $NOCOLOR"
end

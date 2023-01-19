#!/usr/bin/env bash

ERROR='\033[0;31m'
SUCCESS='\033[1;32m'
NOCOLOR='\033[0m'

# We'll need git...
command -v git >/dev/null 2>&1 && echo Git is already installed \
	|| yay -S git

# Make sure we're working at home (heh)
# cd $HOME/

# Temp folder for existing files
temp_folder="$HOME/Desktop/lost_and_found_$(date +'%Y%m%d%H%M%S')"
mkdir $temp_folder

# Clone dotfiles repo
[ -d $HOME/.dotfiles/ ] && mv $HOME/.dotfiles $temp_folder
git clone git@github.com:miltsghostrehab/dotfiles_1.git ~/.dotfiles

# Symlinks
dotfiles_in_home=(fehbg bashrc)
dotfiles_in_xdg_config=(alacritty fish nvim qtile rofi zsh)


for file in "${dotfiles_in_home[@]}"; do
	dot="$HOME/.dotfiles/${file}"
	dot_name_fixed=".${file}"
	target="$HOME/${dot_name_fixed}"
	if [[ -f $target ]]
	then
		if [[ -L $target ]]
		then
			unlink $target
		else
			mv $target "$HOME/Desktop/"
		fi
	fi
	if [[ -f $dot ]]
	then
		ln -s $dot $target
		echo -e "$dot_name_fixed --> $target$SUCCESS SUCCESS $NOCOLOR"
	else
		echo -e "$ERROR$file NOT FOUND IN ./.dotfiles/ $NOCOLOR"
	fi
done

for folder in "${dotfiles_in_xdg_config[@]}"; do
	dot="$HOME/.dotfiles/${folder}"
	target="$HOME/.config/${folder}"
	if [[ -d $target ]]
	then
		if [[ -L $target ]]
		then
			unlink $target
		else
			mv $target "$HOME/Desktop/"
		fi
	fi
	if [[ -d $dot ]]
	then
		ln -s $dot $target
		echo -e "./$folder/ --> $target$SUCCESS SUCCESS $NOCOLOR"
	else
		echo -e "$ERROR./$folder/ NOT FOUND IN ./.dotfiles/ $NOCOLOR"
	fi
done

# Delete temp_folder if it's empty
[ ! $(ls -A $temp_folder) ] && rm -fr $temp_folder


# Install My Apps

yay_programs=(fish cups eos-sddm-theme sddm feh ffmpeg fzf ranger imagemagick keepassxc lua python python-pip neofetch noto-fonts tree sxlock-git)
flatpak_programs=(com.discordapp.Discord com.spotify.Client org.kde.kdenlive org.kde.krita)

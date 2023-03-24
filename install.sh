#!/usr/bin/env bash

ERROR='\033[0;31m'
SUCCESS='\033[1;32m'
NOCOLOR='\033[0m'

# We'll need yay
command -v yay >/dev/null 2>&1 && echo Yay is already installed \
		|| pacman -S yay

# Also git
command -v git >/dev/null 2>&1 && echo Git is already installed \
	|| yay -S git

# Temp folder for existing files
# temp_folder="$HOME/Desktop/lost_and_found_$(date +'%Y%m%d%H%M%S')"
# mkdir $temp_folder

# git dotfiles
if [ ! -d $HOME/.dotfiles/ ]; then 
	git clone /run/media/lacy/FAYE_FAYE/dotfiles.git ~/.dotfiles
fi

# Symlinks
dotfiles_in_home=(fehbg bashrc)
dotfiles_in_xdg_config=(alacritty fish nvim qtile rofi)


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

# Symlinks -- SPECIAL CASES

star_conf="$HOME/.config/starship.toml" 
star_dot="$HOME/.dotfiles/starship.toml" 

if [[ -f $star_conf ]]
then
	if [[ -L $star_conf ]]
	then
		unlink $star_conf
	else
		mv $star_conf "$Home/Desktop/"
	fi
fi

if [[ -f $star_dot ]]
then
	ln -s $star_dot $star_conf
	echo -e "starship.toml --> $star_conf$SUCCESS SUCCESS $NOCOLOR"
else
	echo -e "$ERROR starship.toml NOT FOUND IN ./.dotfiles/ $NOCOLOR"
fi

# Install My Apps

yay -Syu

yay_programs=()
flatpak_programs=()

while IFS="," read -r pk name; do
	case $pk in
		F) flatpak_programs+=("$name"); ;;
		Y) yay_programs+=("$name"); ;;
	esac;
done < <(tail -n +2 apps.csv)

for yp in "${yay_programs[@]}"; do
	yay -S --noconfirm $yp
done

for fp in "${flatpak_programs[@]}"; do
	flatpak info $fp
	flatpak install $fp
done


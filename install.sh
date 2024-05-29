#!/usr/bin/env bash

ERROR='\033[0;31m'
SUCCESS='\033[1;32m'
NOCOLOR='\033[0m'

# fix time issue with Windows dual boot
timedatectl set-local-rtc 1 --adjust-system-clock

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
dotfiles_in_home=(fehbg bashrc gitconfig)
dotfiles_in_xdg_config=(alacritty fish nvim qtile rofi picom polybar starship.toml)


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
			mv $target $target.old
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
	if [[ -d $target ]] || [[ -f $target ]]
	then
		if [[ -L $target ]]
		then
			unlink $target
		else
			mv $target $target.old
		fi
	fi
	if [[ -d $dot ]] || [[ -f $dot ]]
	then
		ln -s $dot $target
		echo -e "./$folder/ --> $target$SUCCESS SUCCESS $NOCOLOR"
	else
		echo -e "$ERROR./$folder/ NOT FOUND IN ./.dotfiles/ $NOCOLOR"
	fi
done

# xinput conf for tablet

# xinput_conf="$HOME/.dotfiles/xinput/52-tablet.conf"
# xinput_link="/etc/X11/xorg.conf.d/52-tablet.conf"
#
# if [[ -f $xinput_link ]]
# then
# 	if [[ -L $xinput_link ]]
# 	then
# 		sudo unlink $xinput_link
# 	else
# 		sudo mv $xinput_link "$HOME/Desktop"
# 	fi
# fi
# if [[ -f $xinput_conf ]]
# then
# 	sudo ln -s $xinput_conf $xinput_link
# 	echo -e "$xinput_conf --> $xinput_link$SUCCESS SUCCESS $NOCOLOR"
# else
# 	echo -e "$ERROR$xinput_conf NOT FOUND... $NOCOLOR"
# fi

# Option to Bypass Installation
echo ""
read -p "Shall I install your apps (y/n)? " choice
echo ""
case "$choice" in
  y|Y ) echo "Installing apps...";;
  * ) exit 9;;
esac

# Install My Apps

yay -Syu

yay_programs=()
flatpak_programs=()
cargo_programs=()
gem_programs=()

while IFS="," read -r pk name; do
	case $pk in
		F) flatpak_programs+=("$name"); ;;
		Y) yay_programs+=("$name"); ;;
		C) cargo_programs+=("$name"); ;;
		G) gem_programs+=("$name"); ;;
	esac;
done < <(tail -n +2 "$HOME/.dotfiles/apps.csv")

for yp in "${yay_programs[@]}"; do
	yay -S --noconfirm --needed $yp
done

for fp in "${flatpak_programs[@]}"; do
	flatpak info $fp
	flatpak install -y --noninteractive $fp
done

for cp in "${cargo_programs[@]}"; do
	cargo install $cp
done

for gp in "${gem_programs[@]}"; do
	gem install $cp
done


# Set default Java version

java_version="java-17-openjdk"

sudo archlinux-java set $java_version


# Set up AwesomeWM

if command -v awesome &> /dev/null
then
  if [ ! -d "~/.config/awesome/themes/" ]
  then
    git clone --recurse-submodules --remote-submodules --depth 1 -j 2 https://github.com/lcpz/awesome-copycats.git
    mv -bv awesome-copycats/* ~/.config/awesome; rm -rf awesome-copycats
  fi

	dot="$HOME/.dotfiles/${folder}"
	target="$HOME/.config/${folder}"
  ln -s ~/.dotfiles/awesome/rc.lua ~/.config/awesome/rc.lua
  ln -s ~/.dotfiles/awesome/theme-personal.lua ~/.config/awesome/themes/powerarrow/theme-personal.lua
fi

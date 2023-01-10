#!/bin/sh

DISTRO=$(lsb_release -is) #Install lsb_release before hand
if [[ $DISTRO == "Fedora" ]] then
	packet_manager_install='dnf install -y'
elif [[ $DISTRO == "Ubuntu" ]] then
	packet_manager_install='apt-get install -y'
fi

# Packages
sudo $packet_manager_install firefox vlc gcc g++ vim i3-gaps thunderbird
redshift steam keepassxc polybar brightnessctl @virtualization rofi \
feh neofetch blueman ranger ipython3 htop pnpm exa ripgrep fzf

pnpm install -g vtop

# Install kitty terminal emulator
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

#### NEOVIM ####
# Build dependencies
$packet_manager_install ninja-build libtool autoconf automake cmake gcc gcc-c++ make pkgconfig unzip patch gettext curl

# Build
git clone https://github.com/neovim/neovim ~/git/neovim
if !$ ; then
	cd ~/git/neovim
	make CMAKE_BUILD_TYPE=RelWithDebInfo
	sudo make install
fi

#### RUST ######

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Check that cargo is installed
if ! cargo --version ; then

	# Install onefetch
	cargo install onefetch
fi

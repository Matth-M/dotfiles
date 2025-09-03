#!/bin/sh
sudo pacman -Syu --needed - < ~/package_list.txt
# AUR
sudo pacman -S --needed base-devel
mkdir ~/install -p
git clone https://aur.archlinux.org/paru.git ~/install/paru-git/
cd ~/install/paru-git
makepkg -si
paru -S --needed - < ~/foreignpkglist.txt

# Change default shell to zsh
chsh -s /bin/zsh $USER

# Install Zap
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1 --keep

# Install starship prompt
curl -sS https://starship.rs/install.sh | sh

# Install kitty terminal emulator
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# Allow tap to click in i3wm
sudo mkdir -p /etc/X11/xorg.conf.d && sudo tee <<'EOF' /etc/X11/xorg.conf.d/90-touchpad.conf 1> /dev/null
Section "InputClass"
        Identifier "touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "Tapping" "on"
EndSection

EOF

# Ran into issues with firefox and thunderbird when hostname was
# not set. It would take a lot of time to open a new windown
# (outside of CTRL+N) and same for a link cliked outside of 
# firefox to open in it.
hostnamectl hostname laptop

# Set default application for opening html
xdg-mime default floorp.desktop text/html

# firewall
sudo ufw limit 22/tcp # SSH
sudo ufw allow 80/tcp # HTTP
sudo ufw allow 443/tcp # HTTPS
sudo ufw default deny incoming # Deny access to all other ports
sudo ufw default allow outgoing

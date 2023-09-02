#!/bin/sh

# Packages
sudo dnf install -y firefox vlc gcc g++ vim i3-gaps thunderbird \
redshift steam keepassxc polybar brightnessctl @virtualization rofi \
feh neofetch blueman ranger ipython3 htop pnpm exa ripgrep fzf zsh \
make cmake acpi xsel xclip spectacle xrandr util-linux-user nodejs \
xclip feh rofi polybar brightnessctl

# Change default shell to zsh
chsh -s /bin/zsh $USER

# Install Zap
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1

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

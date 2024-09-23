#!/bin/sh

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


# Make firefox the default application to open html files
xdg-mime default firefox.desktop text/html

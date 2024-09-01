#!/bin/bash

echo -e "   _             _       _ _                   "
echo -e "  (_) __ ___   _(_)     | (_)_ __  _   ___  __ "
echo -e "  | |/ _' \ \ / / |_____| | | '_ \| | | \ \/ / "
echo -e "  | | (_| |\ V /| |_____| | | | | | |_| |>  <  "
echo -e " _/ |\__,_| \_/ |_|     |_|_|_| |_|\__,_/_/\_\ "
echo -e "|__/                                           "
echo ""

##### FUNCTIONS #####
ask_yes_no() {
    while true; do
        read -p "$1 (y/n): " answer
        case $answer in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}
##### END #####


##### LAPTOP #####
if ask_yes_no "Is it a laptop?"; then
    echo "Installing laptop software..."
    sudo pacman --needed --noconfirm -S brightnessctl
    echo "Done!"
fi
##### END #####


##### PACMAN #####
echo "Installing base..."
sudo pacman --needed --noconfirm -S xorg base-devel curl wget nmcli nsxiv unzip xorg-xrandr dosfstools dmenu xclip firefox \
    xautolock xorg-xinit vi less scrot startx figlet tree imagemagick alacritty pass lf peek bluez bluez-utils mpv transmission-cli
echo "Done!"

echo "Installing office apps..."
sudo pacman --needed --noconfirm -S libreoffice-still ttf-iosevka-nerd zathura zathura-pdf-mupdf gimp translate-shell typst
echo "Done!"

echo "Installing programming tools..."
sudo pacman --needed --noconfirm -S neovim lua lua-language-server jdk21-openjdk go gopls rust rust-analyzer \
    delve clang netcat lsof maven jq tidy docker docker-compose docker-buildx minikube kubectl ripgrep jwt-cli plantuml gdb
echo "Done!"
##### END #####


cd ~


##### EXTERNAL #####
echo "Installing dwm..."
git clone https://github.com/javiorfo/dwm
cd dwm
sudo make clean install
cd ..
echo "Done!"

echo "Installing xtatusbar..."
git clone https://github.com/javiorfo/xtatusbar
cd xtatusbar
sudo make clean install
cd ..
echo "Done!"

echo "Setting nvim config..."
cd .config
git clone https://github.com/javiorfo/nvim
cd ..
echo "Done!"

echo "Setting bash config..."
wget https://github.com/javiorfo/dotfiles/blob/master/.bashrc
echo "Done!"

echo "Installing yay..."
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rdf yay
echo "Done!"
##### END #####


##### AUR #####
echo "Installing programs from AUR..."
yay --noconfirm -S jdtls slides jdk21-graalvm-ee-bin lombok-common java-debug codelldb-bin
echo "Done!"
##### END #####


##### CONFIG FILES #####
echo "Installing config files..."
sudo cp javi-linux/files/.bash_profile .
sudo cp javi-linux/files/.xinitrc .
sudo cp javi-linux/files/00-keyboard.conf /etc/X11/xorg.conf.d/
echo "Done!"

echo "Setting bluetooth config..."
sudo sed -i 's/#AutoEnable=true/AutoEnable=true/g' /etc/bluetooth/main.conf
echo "Done!"
##### END #####


echo "javi-linux finished. Reboot your computer."

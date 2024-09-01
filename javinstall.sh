#!/bin/bash

echo -e "   _             _       _ _                   "
echo -e "  (_) __ ___   _(_)     | (_)_ __  _   ___  __ "
echo -e "  | |/ _' \ \ / / |_____| | | '_ \| | | \ \/ / "
echo -e "  | | (_| |\ V /| |_____| | | | | | |_| |>  <  "
echo -e " _/ |\__,_| \_/ |_|     |_|_|_| |_|\__,_/_/\_\ "
echo -e "|__/                                           "
echo ""

echo "Installing base..."
sudo pacman --needed -S xorg base-devel curl wget git nsxiv unzip xorg-xrandr dosfstools dmenu xclip \
    xautolock xorg-xinit vi less scrot startx figlet tree imagemagick alacritty pass lf peek bluez bluez-utils mpv transmission-cli
echo "Done!"

echo "Installing office apps..."
sudo pacman --needed -S libreoffice-still ttf-iosevka-nerd zathura zathura-pdf-mupdf gimp translate-shell texlive-latexextra texlive-binextra
echo "Done!"

# If is notebook
sudo pacman --needed -S brightnessctl

echo "Installing programming tools..."
sudo pacman --needed -S lua lua-language-server jdk21-openjdk go gopls rust rust-analyzer \
    delve clang netcat lsof maven neovim jq tidy docker docker-compose docker-buildx minikube kubectl ripgrep jwt-cli plantuml gdb
echo "Done!"

# Install external
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

echo "Installing nvim config..."
cd .config
git clone https://github.com/javiorfo/nvim
cd ..
echo "Done!"

echo "Installing yay..."
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rdf yay
echo "Done!"

echo "Installing programs from AUR..."
yay -S jdtls slides jdk21-graalvm-ee-bin lombok-common java-debug codelldb-bin
echo "Done!"

# Configure files folder
# Bluetooth config
# Bash

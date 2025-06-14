#!/bin/bash

echo -e "      ██╗ █████╗ ██╗   ██╗██╗      ██╗     ██╗███╗   ██╗██╗   ██╗██╗  ██╗"
echo -e "      ██║██╔══██╗██║   ██║██║      ██║     ██║████╗  ██║██║   ██║╚██╗██╔╝"
echo -e "      ██║███████║██║   ██║██║█████╗██║     ██║██╔██╗ ██║██║   ██║ ╚███╔╝ "
echo -e " ██   ██║██╔══██║╚██╗ ██╔╝██║╚════╝██║     ██║██║╚██╗██║██║   ██║ ██╔██╗ "
echo -e " ╚█████╔╝██║  ██║ ╚████╔╝ ██║      ███████╗██║██║ ╚████║╚██████╔╝██╔╝ ██╗"
echo -e "  ╚════╝ ╚═╝  ╚═╝  ╚═══╝  ╚═╝      ╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝"
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
sudo pacman --needed --noconfirm -S xorg base-devel curl wget nsxiv feh unzip xorg-xrandr \
    dosfstools dmenu xclip xorg-xinit xorg-xsetroot vi less scrot figlet libzip ripgrep \
    tree imagemagick alacritty peek bluez bluez-utils mpv transmission-cli ueberzugpp
echo "Done!"

echo "Installing office apps..."
sudo pacman --needed --noconfirm -S libreoffice-still ttf-iosevka-nerd zathura zathura-pdf-mupdf gimp translate-shell yazi
echo "Done!"

echo "Installing programming tools..."
sudo pacman --needed --noconfirm -S neovim lua lua-language-server jdk21-openjdk go gopls \
    delve clang netcat lsof maven jq docker docker-compose docker-buildx \
    minikube kubectl plantuml gdb unixodbc rust rust-analyzer
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

echo "Setting nvim config..."
cd .config
git clone https://github.com/javiorfo/nvim
cd ..
echo "Done!"

echo "Installing paru..."
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rdf paru
echo "Done!"

echo "Setting yazi config..."
mkdir -p .config/yazi
wget https://raw.githubusercontent.com/javiorfo/dotfiles/master/.config/yazi/theme.toml
wget https://raw.githubusercontent.com/javiorfo/dotfiles/master/.config/yazi/yazi.toml
mv theme.toml yazi.toml .config/yazi
echo "Done!"
##### END #####


##### AUR #####
echo "Installing programs from AUR..."
paru --noconfirm -S xautolock jdtls slides lombok-common java-debug librewolf-bin rstatusbar passcualito bitsmuggler
echo "Done!"
##### END #####


##### CONFIG FILES #####
echo "Setting bash config..."
rm .bashrc
wget https://raw.githubusercontent.com/javiorfo/dotfiles/master/.bashrc
echo "Done!"

echo "Setting alacritty config..."
mkdir -p .config/alacritty
wget https://raw.githubusercontent.com/javiorfo/dotfiles/master/.config/alacritty/alacritty.toml
mv config .config/alacritty/
echo "Done!"

echo "Setting rstatusbar config..."
mkdir -p .config/rstatusbar
wget https://raw.githubusercontent.com/javiorfo/rstatusbar/refs/heads/master/examples/config.toml
mv config.toml .config/rstatusbar/
echo "Done!"

echo "Setting zathura config..."
mkdir -p .config/zathura
wget https://raw.githubusercontent.com/javiorfo/dotfiles/master/.config/zathura/zathurarc
mv zathurarc .config/zathura/
echo "Done!"

echo "Setting slides config..."
mkdir -p .config/slides
wget https://raw.githubusercontent.com/javiorfo/dotfiles/master/.config/slides/header.md
wget https://raw.githubusercontent.com/javiorfo/dotfiles/master/.config/slides/theme.json
mv header.md theme.json .config/slides
echo "Done!"

echo "Installing config files..."
rm .bash_profile .xinitrc
wget https://raw.githubusercontent.com/javiorfo/dotfiles/master/.bash_profile
wget https://raw.githubusercontent.com/javiorfo/dotfiles/master/.xinitrc
wget https://raw.githubusercontent.com/javiorfo/dotfiles/master/etc/X11/xorg.conf.d/00-keyboard.conf
sudo mv 00-keyboard.conf /etc/X11/xorg.conf.d/
echo "Done!"

echo "Setting bluetooth config..."
sudo sed -i 's/#AutoEnable=true/AutoEnable=true/g' /etc/bluetooth/main.conf
echo "Done!"
##### END #####


##### GROUPS AND USERS #####
echo "Setting docker group..."
sudo usermod -aG docker $USER
echo "Done!"
##### END #####

echo "javi-linux finished. Reboot your computer."

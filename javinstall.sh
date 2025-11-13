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
sudo pacman --needed --noconfirm -S base-devel curl wget unzip dosfstools vi less figlet libzip \
    niri waybar fuzzel swaybg swayidle swayimg wl-clipboard ripgrep wf-recorder slurp xwayland-satellite \
    tree imagemagick alacritty bluez bluez-utils mpv transmission-cli ueberzugpp
echo "Done!"

echo "Installing office apps..."
sudo pacman --needed --noconfirm -S libreoffice-still ttf-iosevka-nerd zathura zathura-pdf-mupdf gimp translate-shell yazi
echo "Done!"

echo "Installing programming tools..."
sudo pacman --needed --noconfirm -S neovim lua lua-language-server jdk21-openjdk go gopls \
    delve clang netcat lsof maven jq docker docker-compose docker-buildx \
    plantuml gdb unixodbc rust rust-analyzer
echo "Done!"
##### END #####


cd ~


##### EXTERNAL #####
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

echo "Setting niri config..."
mkdir -p .config/niri/scripts
wget https://raw.githubusercontent.com/javiorfo/dotfiles/master/.config/niri/scripts/idle.sh
wget https://raw.githubusercontent.com/javiorfo/dotfiles/master/.config/niri/config.kdl
mv idle.sh .config/niri/scripts
mv config.kdl .config/niri
echo "Done!"

echo "Setting waybar config..."
mkdir -p .config/waybar
wget https://raw.githubusercontent.com/javiorfo/dotfiles/master/.config/waybar/config.jsonc
wget https://raw.githubusercontent.com/javiorfo/dotfiles/master/.config/waybar/style.css
mv config.jsonc style.css .config/waybar
echo "Done!"

echo "Setting fuzzel config..."
mkdir -p .config/fuzzel
wget https://raw.githubusercontent.com/javiorfo/dotfiles/master/.config/fuzzel/fuzzel.ini
mv fuzzel.ini .config/fuzzel
echo "Done!"
##### END #####


##### AUR #####
echo "Installing programs from AUR..."
paru --noconfirm -S jdtls slides lombok-common java-debug librewolf-bin passcualito gativideo
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
rm .bash_profile
wget https://raw.githubusercontent.com/javiorfo/dotfiles/master/.bash_profile
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

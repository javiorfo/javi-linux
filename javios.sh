#! /bin/sh

# BASE
sudo pacman --needed -S xorg, base-devel, curl, wget, git, nsxiv, unzip, xorg-xrandr, dosfstools, dmenu, xclip, xautolock, xorg-xinit, vi, less, scrot, startx, figlet, tree, imagemagick

# OFFICE
sudo pacman --needed -S libreoffice-still, ttf-iosevka-nerd, zathura, zathura-pdf-mupdf, gimp, translate-shell

# AUDIO, BLUETOOTH, ETC
sudo pacman --needed -S bluez, bluez-utils, mpv, transmission-cli, neomutt

# PROGRAMMING
lua, lua-language-server, jdk21-openjdk, go, gopls, clang, netcat, tree, lsof, maven, gradle, neovim, jq, tidy, docker, docker-compose, docker-buildx, minikube, kubectl, ripgrep, jwt-cli, plantuml

# OPTIONAL
# sudo pacman --needed -S brightnessctl

# AUR
yay -S hydroxide, jdtls, slides, jdk21-graalvm-ee-bin, lombok-common, java-debug

# Externos
yay, dwm, st

GITHUB_REPO     := `git remote get-url origin | cut -d/ -f1-4`
CONFIG_DIR      := "$(HOME)/.config"
BACKGROUNDS_DIR := "/usr/share/backgrounds"
FONTS_DIR       := "$(HOME)/.local/share/fonts"

apply-symlinks:
	$DOTLY_PATH/bin/dot symlinks apply

clone_repos:
	git clone "{{GITHUB_REPO}}/arco-install"  --depth 1 "arco-install"
	git clone "{{GITHUB_REPO}}/shell-scripts"  --depth 1 "$HOME/.bin"

clone_extra_repos:
	git clone  "{{GITHUB_REPO}}/qtile" "{{CONFIG_DIR}}/qtile"

	git clone --depth=1 https://github.com/adi1090x/rofi.git
	sh rofi/setup.sh

	git clone --depth 1 https://github.com/LazyVim/starter "{{CONFIG_DIR}}/nvim"
	rm -rf "{{CONFIG_DIR}}/nvim/.git"

download_backgrounds:
	#!/bin/sh
	sudo tar -xzf $DOTFILES_PATH/etc/backgrounds.tar.gz -C {{BACKGROUNDS_DIR}}
	git clone "{{GITHUB_REPO}}/wallpapers.git"  --depth 1 "$HOME/.wallpapers"

download_user_fonts:
	#!/bin/bash
	FONTS="Monofur Monaspace Lilex JetBrainsMono GeistMono FiraMono FiraCode FantasqueSansMono CascadiaMono CascadiaCode AnonymousPro"
	VERSION="v3.4.0"
	BASE_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/$VERSION"

	for font in $FONTS; do
		url="$BASE_URL/$font.zip"
		echo "Descargando: $url"
		curl -L -o "$font.zip" "$url"
		echo "Descomprimiendo: $font.zip"
		unzip -o "$font.zip" -d "{{FONTS_DIR}}/$font Nerd Font"
		rm "$font.zip"
	done


lightdm:
	sudo mkdir -p /etc/lightdm
	sudo install -m 644 -o root "$DOTFILES_PATH/etc/lightdm-gtk-greeter.conf" /etc/lightdm/lightdm-gtk-greeter.conf
	sudo cp avatar.png /var/lib/AccountsService/icons/$USER
	sudo  sed -i '/^Icon=/d' /var/lib/AccountsService/users/$USER
	sudo echo "Icon=/var/lib/AccountsService/icons/$USER" >> /var/lib/AccountsService/users/$USER

grub:
	#!/bin/bash
	sudo cp -f /etc/default/grub /etc/default/grub.bak
	sudo install -m 644 -o root "$DOTFILES_PATH/etc/grub" /etc/default/grub

	for tarfile in $DOTFILES_PATH/etc/grub-themes/*.tar.gz; do
		tar -xzf $tarfile -C /boot/grub/themes
	done

betterlockscreen:
	betterlockscreen -u {{BACKGROUNDS_DIR}}/betterlockscreen/att-06.jpg

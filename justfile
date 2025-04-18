apply-symlinks:
	dot symlinks apply

extra_repos:
	#!/bin/sh
	git clone "https://github.com/AlbertoVf/arco-install"  --depth 1 "arco-install"
	git clone "https://github.com/AlbertoVf/shell-scripts"  --depth 1 "$HOME/.bin"

extra_configuration:
	#!/bin/sh
	git clone  "https://github.com/AlbertoVf/qtile.git" "$HOME/.config/qtile"

	git clone --depth=1 https://github.com/adi1090x/rofi.git
	sh rofi/setup.sh

	git clone --depth 1 https://github.com/LazyVim/starter "$HOME/.config/nvim"
	rm -rf $HOME/.config/nvim/.git

lightdm_configuration:
	sudo install -m 644 -o root "$DOTFILES_PATH/etc/lightdm-gtk-greeter.conf" /etc/lightdm/lightdm-gtk-greeter.conf

icons:
	curl -sL https://git.io/papirus-icon-theme-install | env DESTDIR="$HOME/.icons" sh

grub:
	#!/bin/bash
	sudo cp -f /etc/default/grub /etc/default/grub.bak
	sudo install -m 644 -o root "$DOTFILES_PATH/etc/grub" /etc/default/grub

	for tarfile in $DOTFILES_PATH/etc/grub-themes/*.tar.gz; do
		tar -xzf $tarfile -C /boot/grub/themes
	done

backgrounds:
	#!/bin/sh
	git clone "https://github.com/AlbertoVf/wallpapers.git"  --depth 1 "$HOME/.wallpapers"
	sudo tar -xzf "$DOTFILES_PATH/etc/archlinux-backgrounds.tar.gz" /usr/share/backgrounds/archlinux-backgrounds

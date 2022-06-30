# Dotfiles

[Dotfiles Tutorial](https://www.atlassian.com/git/tutorials/dotfiles)

## External repository

[Install](https://gitlab.com/AlbertoVf1/arco-install)

[Wallpapers](https://gitlab.com/AlbertoVf1/wallpapers)

## Start your dotfiles repository

```bash
git init --bare $HOME/dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bash
```

## Add files to your repo

```bash
dotfiles status
dotfiles add <your-file>
dotfiles commit -m "<message>"
dotfiles push
```

## Install Packages

```bash
# Install software
curl -sLf https://spacevim.org/install.sh | bash
sudo pacman -S vim neovim visual-studio-code-bin
sudo pacman -S conky picom variety sxhkd xrandr
sudo pacman -S zsh neofetch ranger
sudo pacman -S thunar rofi qtile
sudo pacman -S alacritty kitty termite
sudo pacman -S archlinux-logout archlinux-betterlockscreen
# Install fonts:
wget -qO- https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/CascadiaCode.zip | bsdtar -xvf- && mv *.ttf /usr/share/fonts/TTF/
wget -qO- https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FantasqueSansMono.zip | bsdtar -xvf- && mv *.ttf /usr/share/fonts/TTF/

```

## Install your dotfiles onto a new system

```bash
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bash
echo ".dotfiles" >> .gitignore
git clone --bare <git-repo-url> $HOME/.dotfiles
dotfiles config --local status.showUntrackedFiles no
```

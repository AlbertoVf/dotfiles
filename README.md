# Dotfiles

[Dotfiles Tutorial](https://www.atlassian.com/git/tutorials/dotfiles)

## External repository

[Install](https://github.com/AlbertoVf/arco-install)

[Wallpapers](https://github.com/AlbertoVf/wallpapers)

[Rofi](https://github.com/adi1090x/rofi.git)

## Start your dotfiles repository

```bash
git init --bare $HOME/.dotfiles
alias dotf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotf config --local status.showUntrackedFiles no
echo "alias dotf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
```

## Add files to your repo

```bash
dotf status
dotf add <your-file>
dotf commit -m "<message>"
dotf push
```

## Install Packages

```bash
# Install software
sudo pacman -S visual-studio-code-bin
sudo pacman -S conky picom variety sxhkd xrandr
sudo pacman -S zsh neofetch ranger
sudo pacman -S thunar rofi qtile
sudo pacman -S kitty
sudo pacman -S archlinux-logout archlinux-betterlockscreen
```

## Install your dotfiles onto a new system

```bash
echo "alias dotf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
echo ".dotfiles" >> .gitignore
git clone --bare <git-repo-url> $HOME/.dotfiles
dotf config --local status.showUntrackedFiles no
```

## Install my dotfiles

```bash
echo "alias dotf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
git clone --bare https://github.com/AlbertoVf/dotfiles $HOME/.dotfiles
dotf config --local status.showUntrackedFiles no
dotf reset --hard
dotf submodule update --init
dotf submodule init
dotf submodule update
```

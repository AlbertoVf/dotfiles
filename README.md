# Dotfiles

[Dotfiles Tutorial](https://www.atlassian.com/git/tutorials/dotfiles)

## External repository

[Instalacion de programas](https://gitlab.com/snippets/2135457.git)

[Wallpapers](https://gitlab.com/AlbertoVf1/wallpapers)

[Qtile](https://gitlab.com/AlbertoVf1/qtile)

[Rofi](.config/rofi/README.md)

## Start your dotfiles repository

```bash
git init --bare $HOME/dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
```

## Add files to your repo

```bash
dotfiles status
dotfiles add <your-file>
dotfiles commit -m "<message>"
dotfiles push
```

## Install your dotfiles onto a new system

```bash
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
echo "dotfiles" >> .gitignore
git clone --bare <git-repo-url> $HOME/dotfiles
dotfiles config --local status.showUntrackedFiles no
```

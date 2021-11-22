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

## Install your dotfiles onto a new system

```bash
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bash
echo ".dotfiles" >> .gitignore
git clone --bare <git-repo-url> $HOME/.dotfiles
dotfiles config --local status.showUntrackedFiles no
```

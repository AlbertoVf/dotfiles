export EDITOR="code --wait"
export VISUAL="code --wait"

# export FZF_DEFAULT_OPTS="--color=$fzf_colors --reverse"

path=(
	"$HOME/.bin"
	"$DOTLY_PATH/bin"
	"$HOME/.config/rofi/scripts"
	"$HOME/.config/qtile/scripts"
	"$HOME/.cargo/bin"
	"$HOME/.local/share/pnpm"
	"$HOME/.local/bin"
	"/usr/local/bin"
	"/usr/local/sbin"
	"/bin"
	"/usr/bin"
	"/usr/sbin"
	"/sbin"
	"$path"
)

export path

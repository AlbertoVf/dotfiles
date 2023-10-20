# ------------------------------------------------------------------------------
# Apps
# ------------------------------------------------------------------------------

export EDITOR=vim
export FZF_DEFAULT_OPTS="--color=$fzf_colors --reverse"

# ------------------------------------------------------------------------------
# Path - The higher it is, the more priority it has
# ------------------------------------------------------------------------------
path=(
	"$HOME/.bin"
	"$DOTLY_PATH/bin"
	"$DOTFILES_PATH/bin"
	"$DOTFILES_PATH/scripts"
	"$HOME/.config/rofi/scripts"
	"$HOME/.cargo/bin"
	"/usr/local/bin"
	"/usr/local/sbin"
	"/bin"
	"/usr/bin"
	"/usr/sbin"
	"/sbin"
	"$path"
)

export path

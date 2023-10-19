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
	# "$JAVA_HOME/bin"
	# "$GEM_HOME/bin"
	# "$GOPATH/bin"
	"$HOME/.cargo/bin"
	# "/usr/local/opt/ruby/bin"
	# "/usr/local/opt/python/libexec/bin"
	# "/opt/homebrew/bin"
	"/usr/local/bin"
	"/usr/local/sbin"
	"/bin"
	"/usr/bin"
	"/usr/sbin"
	"/sbin"
	"$path"
)

export path

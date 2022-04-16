# path
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$HOME/.config/rofi/bin:$PATH
export ZSH="/home/$USER/.oh-my-zsh"
export MCFLY_KEY_SCHEME=vim
export MCFLY_FUZZY=2
export MCFLY_RESULTS=10
export MCFLY_INTERFACE_VIEW=BOTTOM
export MCFLY_RESULTS_SORT=LAST_RUN
#env
#export TODO_PATH="$HOME/.todo"
export VISUAL=nvim
export EDITOR=vim
export SUDO_PROMPT="Password: "

hdmi=$(xrandr | grep ' connected' | grep 'HDMI' | awk '{print $1}')

if [ "$hdmi" = "HDMI-2" ]; then
  xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off
else
  xrandr --output eDP1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI2 --mode 1920x1080 --pos 0x0 --rotate normal
fi

hdmi=$(xrandr | grep ' connected' | grep 'HDMI' | awk '{print $1}')
if [ "$hdmi" = "HDMI-2" ]; then
    xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off
else
    xrandr --output eDP1 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI2 --mode 1920x1080 --pos 0x0 --rotate normal
fi

echo "Launching...."
killall -q polybar
polybar --config=$HOME/.config/polybar/config.ini example
echo "Launched!"

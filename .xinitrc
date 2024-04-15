# Status Bar
./dwm-statusbar/statusbar.sh &

# background
feh --bg-scale $HOME/.config/leftwm/images/grey.jpg &

## suspend
exec xautolock -time 30 -locker 'sudo systemctl suspend' -detectsleep &

# window manager
exec dwm

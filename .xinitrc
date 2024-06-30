# background
feh --bg-scale $HOME/.config/leftwm/images/grey.jpg &

## suspend
# xset s off; xset -dpms; xset s noblank
# exec xautolock -time 30 -locker 'sudo systemctl suspend' -detectsleep &
exec xautolock -time 30 -locker 'sudo systemctl poweroff' -detectsleep &

# Status Bar
xtatusbar &

# window manager
exec dwm

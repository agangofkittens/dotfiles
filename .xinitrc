# x clipboard and selection sync
if [ -x /usr/local/bin/autocutsel ]; then
    autocutsel -selection CLIPBOARD -fork
    autocutsel -selection PRIMARY -fork
fi

# fonts
# Add fonts
xset +fp $HOME/.fonts
xset fp rehash

feh --bg-max --randomize ~/Pictures/wallpapers/ &
sxhkd &
exec bspwm


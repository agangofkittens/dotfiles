# Dotfiles

```sh
pkg install sudo xorg-minimal bspwm rxvt-unicode webfonts neovim feh lxappearance mplayer neofetch
```

DRM kernel module
```sh
pkg install drm-kmod
```

`/etc/rc.conf`

```
kld_list="/boot/modules/i915kms.ko"
hald_enable="YES"
dbus_enable="YES"
vboxdrv_load="YES"
vboxnet_enable="YES"
```

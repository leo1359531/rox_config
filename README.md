# rox_config
Guide to configure a Lenovo Yoga Slim 7 as mine

> OS: Arch Linux
> WM: sway
> Bar: waybar
> Terminal: kitty

## Guide

### Install

1. Boot to arch installation media (spam F12)
2. use iwctl to connect to wifi
```
iwctl 
station <interface> connect <essid>
exit
ping reddit.com
```

3. use arch-install and follow the instructions to install sway
```
arch-install
```

### After Install

Install pkg and cp configs
```
./cp-files.sh
./pac-add.sh
·/yay-install.sh
./yay-add.sh
./pip-add.sh
```
Open nvim and type `:PlugInstall`

Enjoy!


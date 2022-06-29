Guide to configure a Lenovo Yoga Slim 7 as mine

> OS: Arch Linux  
> WM: sway  
> Bar: waybar  
> Terminal: kitty  

# Guide

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

Make some binaries does not require password on order to work
```
sudo visudo
```
append `leo ALL=(ALL) NOPASSWD: /bin/reboot, /bin/poweroff, /sbin/nmcli, /sbin/pacman, /sbin/mount, /sbin/umount` to the end of the file, press `:x` to save and exit

Enjoy!


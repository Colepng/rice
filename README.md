# Rice

## Packages

```text
WM          : Hyprland
terminal    : kitty
bar         : eww
launcher    : rofi
```

## Dependencies

- [hyprland-git](https://github.com/vaxerski/hyprland) - Wayland Compositor/WM
- [eww](https://github.com/elkowar/eww) - Bar and Widgets [My bar is based off of this one](https://github.com/taylor85345/hyprland-dotfiles)
- [rofi](https://github.com/davatorium/rofi) - App launcher
- [dunst](https://github.com/dunst-project/dunst) - Notification Daemon
- [socat](http://www.dest-unreach.org/socat/) - Socket utility for eww workspace module

## Installation

Assuming you have a working Arch Linux install or a arch based distro with yay installed, you can install all the dependencies with the following command:

### Install Dependencies

```bash
yay -S hyprland-git eww-wayland rofi-ibonn-wayland socat
```

If you dont have an AUR helper installed, you can install one with the following commands:

```bash
sudo pacman -S git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

### Installing Rice

You can install my rice by cloning the repo and copying the files to your .config directory. Here are the commands:

```bash
git clone https://github.com/Colepng/rice.git
cd rice
cp -ri rice/* ~/.config/
```

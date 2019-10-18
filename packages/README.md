### Packages

This directory houses lists of packages and NOT configurations managed by stow. You can stow these files, but note that you will have to manually use these lists to reinstall packages used by the configurations within this repository. These files are for reference only, and can be updated using the commands below, taken from [The Arch Wiki](https://wiki.archlinux.org/index.php/Pacman/Tips_and_tricks#List_of_installed_packages) and some other resources.

This repository uses pacman to manage packages, see the commands below for examples on how these lists were generated and how you can replace manually with your own if needed.

```bash
# List all of the installed packages
pacman -Qqe > pkglist.txt
# With option -t, the packages already required by other explicitly installed packages are not mentioned. If reinstalling from this list they will be installed but as dependencies only.
pacman -Qqet > pkglist.txt
# With option -n, foreign packages (e.g. from AUR) would be omitted from the list.
pacman -Qqen > pkglist.txt
```

So I use the below commands to create backaups for pacman - 

```bash
# Store installed packages, excluding foreign
pacman -Qqen > pkglist.txt
# Use -Qqem to create the list of AUR and other foreign packages that have been explicitly installed.
sudo pacman -Qqem > foreignpkglist.txt
```

See also the [Hooks Arch Wiki](https://wiki.archlinux.org/index.php/Pacman#Hooks) to automate this


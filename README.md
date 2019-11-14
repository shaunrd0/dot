# dots

A place for backing up my dotfiles.


These configs were created and tested on Manjaro Linux using i3wm, and should only be used on similar systems. Easiest installation is to clone repository into home directory - 

```bash
git clone https://github.com/shaunrd0/dot ~/dot
cd ~/dot/
stow .
```

If you'd rather clone elsewhere - 

```bash
git clone https://github.com/shaunrd0/dot /path/to/dot
cd /path/to/dot/
stow -t ~ .
```

Note that the `dot/packages/` directory is for reference and is the only directory included not meant to be used with stow. If this directory is stowed there will be no real change to the system - you will still need to install the package lists manually.

`stow --adopt .` can be used to install conflicting files, but doing so will result in the loss of your local configurations. If you want to keep them, back up the conflicting files output in the error message before running this command.

![desktop](screens/dtop.png)


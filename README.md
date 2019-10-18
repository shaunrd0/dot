# dots

A place for backing up my dotfiles.


Usage - 

```bash
git clone https://github.com/shaunrd0/dot
cd dot/
stow i3   # Install i3 settings
stow bash # Install bash settings
# ... etc ...
```

Note that the `dot/packages/` directory is for reference and is the only directory included not meant to be used with stow. If this directory is stowed there will be no real change to the system - you will still need to install the package lists manually.


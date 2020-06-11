# dots

A place for backing up my dotfiles. Be sure to clone recursively if you want to grab updated plugins / submodules included. For example, using Pathogen with Vim to manage plugins requires that the plugin to be installed are cloned to the `~/.vim/bundle/` directory. Cloning recursively allows git to clone these same nested repositories/submodules within this directory so Pathogen can handle running the Vim plugins.

Easiest installation is to clone repository into home directory - 

```bash
git clone -b headless --recursive https://github.com/shaunrd0/dot ~/dot
cd ~/dot/
stow .
```

If you'd rather clone elsewhere - 

```bash
git clone -b headless --recursive https://github.com/shaunrd0/dot /path/to/dot
cd /path/to/dot/
stow -t ~ .
```

I use the `libclang-10-dev` package for clang completion. You can use whichever version you want, as the `.vimrc` configuration hosted here uses an environment variable `$LIBCLANG` which is set using the output of `sudo find / -name libclang.so.1`. To use the same version as I do, simply run `sudo apt install libclang-10-dev`

`stow --adopt .` can be used to install conflicting files, but doing so will result in the loss of your local configurations. If you want to keep them, back up the conflicting files output in the error message before running this command.

After running stow, be sure to check that your repository is clean. If a file has been modified or deleted, checkout again within the repo and it will immediately be restored on your system as well.

```bash
git checkout -- .vimrc
# Or, to step through each change interactively using git..
git checkout -p
```


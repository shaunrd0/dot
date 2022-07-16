# Headless

Dotfiles configurations for headless Ubuntu 20.04 linux environments. Be sure to clone recursively if you want to grab updated plugins / submodules included. For example, using Pathogen with Vim to manage plugins requires that the plugin to be installed are cloned to the `~/.vim/bundle/` directory. Cloning recursively allows git to clone these same nested repositories/submodules within this directory so Pathogen can handle running the Vim plugins.

Once installed, editing source code in vim supports features displayed in the screenshot below

![Vim screenshot](VimScreenshot.png)

### Install Dotfiles

Easiest installation is to clone repository into home directory - 

```bash
git clone --recursive https://github.com/shaunrd0/dot ~/dot
cd ~/dot/
stow --adopt .
```

If you'd rather clone elsewhere - 

```bash
git clone --recursive https://github.com/shaunrd0/dot /path/to/dot
cd /path/to/dot/
stow --adopt -t ~ .
```

**Warning:** `--adopt` is used to link conflicting files, but doing so could result in the loss of some configs within your local copy of the repository. After running `stow --adopt .`, be sure to check `git status` is clean. If a file has been modified, discard the local changes to be up-to-date with `origin/master` and it will be restored on your system as well, since the files are now linked.

We could run the following commands to restore changed files
```bash
git checkout -- .vimrc
# Or, to step through each change interactively using git..
git checkout -p
# Or restore the current directory
git restore .
```

If you forget to clone recursively
```bash
git submodule update --init
Submodule path '.vim/bundle/Colorizer': checked out '53ada285f0acc171acda4280b6144e468dded89f'
Submodule path '.vim/bundle/ale': checked out '7265ceb6d050d1a4642741d248f11e4f2abd37e1'
Submodule path '.vim/bundle/clang_complete': checked out '0b98d7533ad967aac3fc4c1a5b0508dafa8a676f'
Submodule path '.vim/bundle/supertab': checked out '40fe711e088e2ab346738233dd5adbb1be355172'
Submodule path '.vim/bundle/unicode.vim': checked out '29f43f7b1be94dccfac461f4da0a34410408111f'
Submodule path '.vim/bundle/vim-airline': checked out '6d665580a3435f21ad560af192d854d4b608fff5'
Submodule path '.vim/bundle/vim-airline-themes': checked out '0d5c5c1e2995126e76606a628316c8e3f5efb37a'
Submodule path '.vim/bundle/vim-signify': checked out '16eee41d2b267523b84bd4ac111627588bfd1a47'
```


### Install Clang Completion

**These configurations require the installation of clang for clang completion**

If you don't want clang completion, just remove the plugin directory from `~/.vim/bundle/`.

If you don't remove clang completion and skip the following steps, vim will show errors when opening source code files. This is because these configurations use clang completion for source code auto completion and drop-down menus within vim.

Note that the `printf` command may take some time to finish, since it is searching your system for a needed file.

```bash
sudo apt install clang
printf "export LIBCLANG=\""$(find /usr/ -name libclang.so.1 2>/dev/null)"\"\n\n" >> .bash_aliases
echo "let g:clang_library_path=\$LIBCLANG" >> ~/.vimrc
source ~/.bashrc
```


### Gitmux

To enable the gitmux status bar in tmux sessions

```bash
sudo apt install golang-go
go install github.com/arl/gitmux@latest
```

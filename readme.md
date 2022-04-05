# cli-config
Helping you setup your CLI experience easily. Some goodies for the ol' terminal.
![M365Princess theme](./assets/M365Princess.png)

## What's new? 🎉
- Manage multiple terraform version with [tfenv](https://github.com/tfutils/tfenv).
- Theming & Prompt customization support with [oh-my-posh](https://github.com/JanDeDobbeleer/oh-my-posh).
- Fresh new installation experience, powered by [Bash oo Framework](https://github.com/niieani/bash-oo-framework).
- Switch antigen themes with a single env variable `CLI_CONFIG_THEME`
- Extra tools available for Linux as well! Check out the [package list](extras/apt-list.txt).
- New extras package - [tmux](https://github.com/tmux/tmux/wiki)
- Setup apps and cool goodies on macOS with brew. Checkout the [extras](extras/setup.sh) script.
- Support for .nvmrc - set node version for a particular directory!

## Features
- one script setup
- works with Mac and Linux (Ubuntu, Pop!_OS) & Windows (WSL)
- adds lots of helper tools to the shell
- easy theme switcher

---

## List of tools 

### Basics
- [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) for zsh plugins
- [oh-my-posh](https://github.com/JanDeDobbeleer/oh-my-posh) for prompt customization and theming
- [antigen](https://github.com/zsh-users/antigen) for more plugins 😉

### Programming Support
- [nvm](https://github.com/nvm-sh/nvm) for managing multiple node versions
- [pyenv](https://github.com/pyenv/pyenv) for multiple python versions
- [dotnet](https://github.com/dotnet/core) 
- [tfenv](https://github.com/tfutils/tfenv) manage multiple terraform versions

### Helpers and Goodies
- [direnv](https://github.com/direnv/direnv)
- [autojump](https://github.com/wting/autojump)
- [thefuck](https://github.com/nvbn/thefuck)

### Appearence
- [M365Princess theme from oh-my-posh](https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/M365Princess.omp.json)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)

## Getting Started

You require these:
- zsh
- curl
- wget
- git

Note: For installing packages,  you'll also require a package manager. On Linux, cli-config  uses `apt`. For macOS, `brew` should be installed, which you can download from [homebrew](https://brew.sh/)'s website.


To check if you have everything installed

```zsh
which zsh curl wget git
```

should give you the path to all the four executables, like so:

```zsh
❯ which zsh curl wget git
/bin/zsh
/usr/local/bin/curl
/usr/local/bin/wget
/usr/bin/git
```

> Caution: Running the setup without these requirements will result in unknown consequences. If you have any issues, please raise an issue so we can solve it.

## Setup

Use the `init.sh` script to setup in a single step! You can visit the link - https://raw.githubusercontent.com/mrsauravsahu/cli-config/main/init.sh to see its raw contents, which is just a git clone followed by calling the `setup.sh` script.

```bash
wget -O- https://raw.githubusercontent.com/mrsauravsahu/cli-config/main/init.sh | bash
```
This will create a folder called `cli-config` inside the current folder and installation will happen there.

Once the setup is done, your `~/.zshrc` will be symlinked to the [default profile](./profiles/default/.zshrc). You will be able to edit the `~/.zshrc` for any customizations.

## Themes

cli-config uses [oh-my-posh](https://github.com/JanDeDobbeleer/oh-my-posh) themes. You can see all the available themes with -

```zsh
ls $CLI_CONFIG_ROOT/current/ohmyposh/themes
```

Few examples are - 

### atomic
![atomic theme](assets/atomic.png)
### powerlevel10k_modern
![powerlevel10k_modern theme](assets/powerlevel10k_modern.png)


You need to set the `$CLI_CONFIG_THEME` variable to change themes. Themes are set with the `oh-my-posh` command.

Once you change the variable, restart the terminal.
## Profiles 

cli-config has two profiles available out of the box. The [default](profiles/default) profile is automatically setup post installation.

### [mrsauravsahu](profiles/mrsauravsahu) profile

This is my specific customizations on top of cli-config. 

You can view the [.zshrc](./profiles/mrsauravsahu/.zshrc) file in this directory to see what commands I run.

To use this profile, simply symlink the `.zshrc` file in this directory to your home folder, which you can do with

```bash
# remove or move the current symlinked .zshrc
$ rm ~/.zshrc 
# depending on where your .cli-config folder is
$ ln -s ~/.cli-config/profiles/mrsauravsahu/.zshrc ~/.zshrc
```

## Extras

There are more hidden gems in the [extras](extras) directory. This sets up extra packages that I frequently use. Checkout the [extras/setup.sh](extras/setup.sh) file for the details.

### Modern UNIX alternatives

[ibraheemdev/modern-unix](https://github.com/ibraheemdev/modern-unix) is an awesome repository with a list of some cool alternatives to popular unix commands. I've added a few in [extras/modern-unix-brew-list.txt](extras/modern-unix-brew-list.txt) file. You can install them on macOS with:
```bash
cat extras/modern-unix-brew-list.txt | sed | xargs brew install
``` 
I'll try and add support for Linux soon along with an uninstall script :)

\- Saurav!

## Updating cli-config

If you have already setup cli-config. It's also a good idea to keep things updated, or maybe you just want to get the latest goodies. This section will show you how to do that.

1. Branch

First of all, check if you're using on the `cool` or the `main` branch. Cli-config used to use `cool` as its default branch, but to maintain uniformity, moved to `main` branch. 

Make sure you back up any changes you made to the repo.

```bash
# Fetch latest changes
$ git fetch origin
# Switch to main branch
$ git checkout main
```

2. Submodules

If you had installed cli-config a long time back, you also need update submodules. Cli-config uses [bash-oo-framework](https://github.com/niieani/bash-oo-framework) to give detailed logs about what is happening during install.

```bash
 $ git submodule update --init
 $ git pull origin
```

3. Update bash

bash-oo-framework requires an updated version of Bash to be installed. For some reason macOS comes with an ancient version. You can update bash using homebrew.

```bash

$ brew install bash <-- # try brew upgrade bash if this doesn't work
# you should be on bash ^5, you can check bash version with this command
$ bash --version
GNU bash, version 5.1.16(1)-release (x86_64-apple-darwin20.6.0)
Copyright (C) 2020 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
```

4. Cleanup & optional installs

You might not need all the things that cli-config installs. As of yet, there's no way to pass options to the `setup.sh` file to do so, but you can go ahead and comment out the tools which you don't want.

Here, I'm commenting out go and terraform env install.

```bash
...
Log "CLI-CONFIG: Installing programs"

. $CLI_CONFIG_ROOT/scripts/install.antigen.sh
. $CLI_CONFIG_ROOT/scripts/install.ohmyzsh.sh
. $CLI_CONFIG_ROOT/scripts/install.ohmyposh.sh
. $CLI_CONFIG_ROOT/scripts/install.nvm.sh
. $CLI_CONFIG_ROOT/scripts/install.pyenv.sh
. $CLI_CONFIG_ROOT/scripts/install.dotnet.sh
# . $CLI_CONFIG_ROOT/scripts/install.tfenv.sh
# . $CLI_CONFIG_ROOT/scripts/install.gvm.sh
. $CLI_CONFIG_ROOT/scripts/setup.programs-conf.sh
...

```

5. Run the setup again

After thinking about it, I've decided that cli-config should retain the older installation even if you run `./setup.sh` multiple times. So, incase you want to reinstall any tool, you can delete that folder or the entire `current` folder before running setup again. (Example: If you want to reinstall nvm, delete the `current/nvm` folder and run `setup.sh` again)

That's all. Raise issue and PRs!

\-S

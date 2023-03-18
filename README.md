# Dotfiles [WIP]

## Setup

- Theme: Catppuccin
- Wayland Compositor: Hyprland
- Topbar: Waybar

## Installation

### Step by step:

1. First, create a new alias to git repository, this is your configuration command of dotfiles:

```shell
alias dtf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

2. Now, clone the repo (bare mode) and rename to ".dotfiles":

```shell
git clone --bare https://github.com/grpineiro/dotfiles.git $HOME/.dotfiles
```

3. Finally, checkout the actual content from the bare repository to your $HOME:

```shell
dtf checkout
```

4. Prevent untracked files from showing up on dotfiles status.

```shell
dtf config --local status.showUntrackedFiles no
```

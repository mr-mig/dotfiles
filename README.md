Dotfiles for my Mac and Codespaces setup

# Setup

### On a fresh machine without git
If you have a shared home folder, symlink it first
```bash
ln -s /path/to/shared/source ~/.ssh
chmod -R 600 ~/.ssh/*
```

Follow this steps to make an initial dotfiles setup:
1. [Generate and add a new SSH key to GitHub](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
2. ```bash
    xcode-select --install
    ```
3. ```bash
    mkdir -p ~/.dotfiles && cd ~/.dotfiles
    git clone git@github.com:mr-mig/dotfiles.git .
    script/setup
    ```


### On a machine with installed dotfiles

Run `script/setup` to bootstrap the environment:

```bash
cd ~/.dotfiles
git pull
script/setup
```

### In Codespaces
Enable `dotfiles` in settings: 
1. Go to https://github.com/settings/codespaces
2. Check "Automatically install dotfiles"

The setup will be run automatically for new codespaces.

# How to copy?
If you want to create your own dotfiles, start with [this post](https://driesvints.com/blog/getting-started-with-dotfiles/). 
If you want to know more about dotfile, check out [dotfiles.github.io](https://dotfiles.github.io/).
Also, feel free to fork this repo.

# What's included?
_Add a list of significant software here_

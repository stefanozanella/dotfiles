# Dotfiles

This is my personal dotfiles repository. It uses [Stow](http://www.gnu.org/software/stow/)
to keep the environment as clean as possible.

The repository is structured so that at its top level there's a list of
directories corresponding to different programs for which to manage
configuration. Thanks to stow, all files contained in all directories will be
symlinked into the home directory. **Note** that, in order for this to work,
this repository must be checked out inside the home directory (as stow creates
the symlinks into the parent folder from where it's invoked).

## How to use it
To put the dotfiles in place, just checkout the repository somewhere into the
home directory and run the provided install script:

```
cd ~
git clone https://github.com/stefanozanella/dotfiles.git dotfiles
~/dotfiles/install
```

The script will automatically run stow against all the toplevel directories
defined inside the repo, effectively putting all the relevant dotfiles in place.

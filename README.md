# dotfiles

Using [GNU Stow](https://www.gnu.org/software/stow/) symlink manager to keep the dotfiles in one git directory.

Usage:
- Download [stow](https://archlinux.org/packages/community/any/stow/)
- Clone repo to home dir (`git clone git@github.com:pavilkau/dotfiles.git ~/.dotfiles`)
- `cd .dotfiles && stow *` (stow will not override existing files unless used with `--adopt` flag)

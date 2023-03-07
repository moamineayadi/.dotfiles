# Dotfiles

## Installing

You will need `git` and GNU `stow`

Clone into your `$HOME` directory or `~`

Run `stow` to symlink everything or just select what you want

```bash
stow */ # Everything (the '/' ignores the README/Configuration.nix)
```

```bash
stow foot # Just my terminal config
```
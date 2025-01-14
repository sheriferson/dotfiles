# sheriferson's dotfiles

![](screenshot.png)

- `.tmux.conf` for [tmux](https://tmux.github.io/ "tmux").
- `init.vim` for Neovim.
- `.Rprofile`
- `.ghci`
- `config.fish`, functions, and theme for [fish](http://fishshell.com/ "fish shell") (**f**riendly **i**nteractive **sh**ell).
- `kitty/kitty.conf` and `kitty/theme.conf` for [kitty terminal emulator](https://github.com/kovidgoyal/kitty/ "kitty terminal emulator").
- `ipython/profile_default/ipython_kernel_config.py` for some python notebook configuration.
- `gnupg/gpg.config` and `gnupg/gpg-agent.config` for having `gpg-agent` running and ready to help sign my git commits.
- `tmux-workspaces/` containing script(s) for setting up various tmux workspaces.
- `terminfo/` containing `*.terminfo` files to enable italics in terminal and tmux.
- [MailMate] keybindings.

[MailMate]: https://freron.com "MailMate IMAP email client"

# setup

```bash
$ ./setup.sh
```

`setup.sh` runs a few other bash scripts that set up packages and settings in various categories:

| file               | job                                                       |
|--------------------|-----------------------------------------------------------|
| `dotfiles.sh`      | Links all dotfiles to their proper locations.             |
| `github-repos.sh`  | Clones Github repos that I want on my system.             |
| `hiddenprefs.sh`   | Sets hidden preferences for MacOS and a few applications. |
| `Brewfile`         | Lists Homebrew recipes. Installed using `brew bundle`.    |
| `requirements.txt` | Lists Python packages.                                    |
| `projects.sh`      | Clones a few of my personal projects from Github.         |
| `rpackages.R`      | Installs R packages.                                      |

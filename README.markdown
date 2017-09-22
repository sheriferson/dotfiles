# sheriferson's dotfiles

![](screenshot.png)

- `.tmux.conf` for [tmux](https://tmux.github.io/ "tmux").
- `.vimrc` for vim.
- `.Rprofile`
- `config.fish` for [fish](http://fishshell.com/ "fish shell") (**f**riendly **i**nteractive **sh**ell).
- `jupyter/custom/custom.css` Dark mode styling for jupyter notebooks.
- `ipython/profile_default/ipython_kernel_config.py` for some python notebook configuration.
- `gnupg/gpg.config` and `gnupg/gpg-agent.config` for having `gpg-agent` running and ready to help sign my git commits.
- `tmux-workspaces/` containing script(s) for setting up various tmux workspaces.
- `terminfo/` containing `*.terminfo` files to enable italics in terminal and tmux.
- [Übersicht](http://tracesof.net/uebersicht/) widgets.
- [MailMate] keybindings, stylesheets, layouts.

[MailMate]: https://freron.com "MailMate IMAP email client"

# setup

```bash
$ ./setup.sh
```

`setup.sh` runs a few other bash scripts that set up packages and settings in various categories:

| file              | job                                                       |
|-------------------|-----------------------------------------------------------|
| `dotfiles.sh`     | Links all dotfiles to their proper locations.             |
| `github-repos.sh` | Clones Github repos that I want on my system.             |
| `hiddenprefs.sh`  | Sets hidden preferences for MacOS and a few applications. |
| `homebrew.sh`     | Installs Homebrew recipes.                                |
| `other.sh`        | Links MailMate Resources directory.                       |
| `pip.sh`          | Installs Python packages.                                 |
| `projects.sh`     | Clones a few of my personal projects from Github.         |
| `rpackages.R`     | Installs R packages.                                      |

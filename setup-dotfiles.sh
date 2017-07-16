#!/bin/bash

dotfiles_path="/Users/$USER/dotfiles"

# starting up and creating ~/.config if it doesn' exist (the -p switch)
printf "\n"
echo "Creating ~/.config/ directory if it doesn't aleady exist..."
mkdir -p /Users/$USER/.config

#     .
#   .o8
# .o888oo ooo. .oo.  .oo.   oooo  oooo  oooo    ooo
#   888   `888P"Y88bP"Y88b  `888  `888   `88b..8P'
#   888    888   888   888   888   888     Y888'
#   888 .  888   888   888   888   888   .o8"'88b
#   "888" o888o o888o o888o  `V88V"V8P' o88'   888o
#
# link tmux.conf
printf "\n"
echo "Linking tmux config file (.tmux.conf)..."
ln -s "$dotfiles_path/tmux.conf" /Users/$USER/.tmux.conf

#                                              o8o
#                                              `"'
# ooo. .oo.    .ooooo.   .ooooo.  oooo    ooo oooo  ooo. .oo.  .oo.
# `888P"Y88b  d88' `88b d88' `88b  `88.  .8'  `888  `888P"Y88bP"Y88b
#  888   888  888ooo888 888   888   `88..8'    888   888   888   888
#  888   888  888    .o 888   888    `888'     888   888   888   888
# o888o o888o `Y8bod8P' `Y8bod8P'     `8'     o888o o888o o888o o888o
#
# link neovim config (~/.config/nvim/init.vim)
printf "\n"
echo "Creating ~/.config/nvim/ directory if it doesn't already exist..."
mkdir -p /Users/$USER/.config/nvim
printf "\n"
echo "Linking neovim config file (init.vim)..."
ln -s "$dotfiles_path/vimrc" /Users/$USER/.config/nvim/init.vim

#  .o88o.  o8o           oooo
#  888 `"  `"'           `888
# o888oo  oooo   .oooo.o  888 .oo.
#  888    `888  d88(  "8  888P"Y88b
#  888     888  `"Y88b.   888   888
#  888     888  o.  )88b  888   888
# o888o   o888o 8""888P' o888o o888o
#
# link fish configuration file (config.fish)
printf "\n"
echo "Creating ~/.config/fish/ directory if it doesn't already exist..."
mkdir -p /Users/$USER/.config/fish
printf "\n"
echo "Linking fish config file (config.fish)..."
ln -s "$dotfiles_path/config.fish" /Users/$USER/.config/fish/

#     o8o                                        .
#     `"'                                      .o8
#    oooo oooo  oooo  oo.ooooo.  oooo    ooo .o888oo  .ooooo.  oooo d8b
#    `888 `888  `888   888' `88b  `88.  .8'    888   d88' `88b `888""8P
#     888  888   888   888   888   `88..8'     888   888ooo888  888
#     888  888   888   888   888    `888'      888 . 888    .o  888
#     888  `V88V"V8P'  888bod8P'     .8'       "888" `Y8bod8P' d888b
#     888              888       .o..P'
# .o. 88P             o888o      `Y8P'
# `Y888P
#
# jupyter
printf "\n"
echo "Linking .jupyter/ directory..."
ln -s "$dotfiles_path/jupyter/" /Users/$USER/.jupyter

#                                      oooo   o8o
#                                      `888   `"'
# oo.ooooo.  oooo oooo    ooo oooo d8b  888  oooo  ooo. .oo.    .ooooo.
#  888' `88b  `88. `88.  .8'  `888""8P  888  `888  `888P"Y88b  d88' `88b
#  888   888   `88..]88..8'    888      888   888   888   888  888ooo888
#  888   888    `888'`888'     888      888   888   888   888  888    .o
#  888bod8P'     `8'  `8'     d888b    o888o o888o o888o o888o `Y8bod8P'
#  888
# o888o
#
# powerline
printf "\n"
echo "Creating ~/.config/powerline/ directory if it doesn't already exist..."
mkdir -p /Users/$USER/.config/powerline
printf "\n"
echo "Linking themes/ and colorschemes/ directories..."
ln -s "$dotfiles_path/powerline/themes" /Users/$USER/.config/powerline/
ln -s "$dotfiles_path/powerline/colorschemes" /Users/$USER/.config/powerline/

#
#
#  .oooooooo ooo. .oo.   oooo  oooo  oo.ooooo.   .oooooooo
# 888' `88b  `888P"Y88b  `888  `888   888' `88b 888' `88b
# 888   888   888   888   888   888   888   888 888   888
# `88bod8P'   888   888   888   888   888   888 `88bod8P'
# `8oooooo.  o888o o888o  `V88V"V8P'  888bod8P' `8oooooo.
# d"     YD                           888       d"     YD
# "Y88888P'                          o888o      "Y88888P'
#
# gnupg
printf "\n"
echo "Creating ~/.gnupg/ directory if it doesn't already exist..."
mkdir -p /Users/$USER/.gnupg
printf "\n"
echo "Linking gpg.conf and gpg-agent.conf..."
ln -s "$dotfiles_path/gnupg/gpg.conf" /Users/$USER/.gnupg/
ln -s "$dotfiles_path/gnupg/gpg-agent-conf" /Users/$USER/.gnupg/

#     .                               o8o               .o88o.
#   .o8                               `"'               888 `"
# .o888oo oooo d8b ooo. .oo.  .oo.   oooo  ooo. .oo.   o888oo   .ooooo.
#   888   `888""8P `888P"Y88bP"Y88b  `888  `888P"Y88b   888    d88' `88b
#   888    888      888   888   888   888   888   888   888    888   888
#   888 .  888      888   888   888   888   888   888   888    888   888
#   "888" d888b    o888o o888o o888o o888o o888o o888o o888o   `Y8bod8P'
#
# terminfo
printf "\n"
echo "Creating ~/.terminfo/ directory if it doesn't already exist..."
mkdir -p /Users/$USER/.terminfo

printf "\n"
echo "Installing tmux-256color.terminfo"
tic -o /Users/$USER/.terminfo/ "$dotfiles_path/terminfo/tmux-256color.terminfo"

printf "\n"
echo "Installing tmux.terminfo"
tic -o /Users/$USER/.terminfo "$dotfiles_path/terminfo/tmux.terminfo"

printf "\n"
echo "Installing xterm-256color.terminfo"
tic -o /Users/$USER/.terminfo "$dotfiles_path/terminfo/xterm-256color.terminfo"

printf "\n"
printf "Done."
printf "\n"

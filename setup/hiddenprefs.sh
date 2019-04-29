#!/bin/bash

# Dock - only show running applications
defaults write com.apple.dock static-only -bool TRUE
killall Dock

# Finder
# - show hidden files
defaults write com.apple.finder AppleShowAllFiles TRUE
killall Finder

# MailMate
defaults write com.freron.MailMate MmOpenURLsInBackground -bool YES
defaults write com.freron.MailMate MmAutomaticUnwrapEnabled -bool YES
defaults write com.freron.MailMate MmAttachmentButtonsOnLeft -bool YES
defaults write com.freron.MailMate MmMessageColorsEnabled -bool YES

# - disable merging previews of many emails when a bunch are selected
defaults write com.freron.MailMate MmMaximumMessagesDisplayed -integer 2

# Terminal
defaults write com.apple.Terminal AppleShowScrollBars -string WhenScrolling

#!/usr/bin/env bash
set -eu

# General
## disable auto-save
defaults write -g NSCloseAlwaysConfirmsChanges -bool true

# Desktop & Screen Saver
## Screen Saver Start after: Never

# Dock
## autohide
defaults write com.apple.dock autohide -bool true

## size
defaults write com.apple.dock tilesize -int 40

## position left
defaults write com.apple.dock orientation -string "left"

## disable auto-rearrange spaces
defaults write com.apple.dock mru-spaces -bool false

## restart dock
killall Dock

# Security & Privacy
defaults write com.apple.screensaver askForPasswordDelay -int 5

# Spotlight
## Spotlight menu/window keyboard shortcut: unchecked

# Displays
## Resolution: Scaled to 1680 x 1050

# Energy Saver
## Turn display off after: 15 minutes (Battery), 1 hour (Adapter)

# Keyboard
## key repeat
defaults write -g KeyRepeat -int 2

## delay until repeat
defaults write -g InitialKeyRepeat -int 25

## use function keys
defaults write -g com.apple.keyboard.fnState -bool true

## spelling: US English
defaults write -g NSSpellCheckerAutomaticallyIdentifiesLanguages -bool false
defaults write -g NSPreferredSpellServerLanguage -string "en"

## Full Keyboard Access: All controls
defaults write -g AppleKeyboardUIMode -int 2

## Change Caps Lock to Option or something

# Trackpad
## look up & data detectors
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 2

## tracking speed
defaults write -g com.apple.trackpad.scaling -int 1

# Bluetooth
## Turn Bluetooth off

# Sharing
## Change Computer Name

# Date & Time
## menu bar format
defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d  H:mm"

# Finder
## show extensions
defaults write -g AppleShowAllExtensions -bool true

## show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

## show full path on title bar
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

## hide files on desktop
defaults write com.apple.finder CreateDesktop -bool false

## default location
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Downloads/"

## Enable copy text in Quick Look (not available on El Capitan or later)
#defaults write com.apple.finder QLEnableTextSelection -bool true

## do not create .DS_Store on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

## expand save panel by default
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true

## restart Finder
killall Finder

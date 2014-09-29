#!/usr/bin/env bash
set -eu

# Desktop & Screen Saver
## Screen Saver Start after: Never

# Dock
## autohide
defaults write com.apple.dock autohide -bool true

## size
defaults write com.apple.dock tilesize -int 28

## position left
defaults write com.apple.dock orientation -string "left"

## disable auto-rearrange spaces
defaults write com.apple.dock mru-spaces -bool false

## restart dock
killall Dock

# Mission Control
## disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Spotlight
## Spotlight menu/window keyboard shortcut: unchecked

# Displays
## Resolution: Scaled to 1440 x 900

# Energy Saver
## Turn display off after: 30 minutes (Battery), 1 hour (Adapter)

# Keyboard
## key repeat
defaults write -g KeyRepeat -int 2

## delay until repeat
defaults write -g InitialKeyRepeat -int 25

## use function keys
defaults write -g "com.apple.keyboard.fnState" -bool true

# Trackpad
## tracking speed
defaults write -g "com.apple.trackpad.scaling" -int 1

# Bluetooth
## Turn Bluetooth off

# Sharing
## Change Computer Name

# Date & Time
## menu bar format
defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d  HH:mm"

# Finder
## show extensions
defaults write -g AppleShowAllExtensions -bool true

## show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

## hide files on desktop
defaults write com.apple.finder CreateDesktop -bool false

## default location
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

## do not create .DS_Store on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

## restart Finder
killall Finder

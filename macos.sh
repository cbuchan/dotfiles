# Disable 'natural' (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Set screenshots directory
defaults write com.apple.screencapture location -string "${HOME}/Screenshots"

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles YES

# VSCodeVim
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false         # For VS Code
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false # For VS Code Insider

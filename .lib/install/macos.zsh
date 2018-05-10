#!/usr/bin/env zsh

###############################
echo 'Installing packages...' #
###############################

git dot submodule update --init

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install --cask --appdir=~/Applications hammerspoon
brew install --cask --appdir=~/Applications visual-studio-code

vim -e -c PlugInstall -c qa

###################################
echo 'Configuring preferences...' #
###################################

LIB_DIR=~/.lib

# General
read COMPUTER_NAME\?'Enter a name for this computer: '
sudo scutil --set ComputerName $COMPUTER_NAME
sudo scutil --set HostName $COMPUTER_NAME
sudo scutil --set LocalHostName $COMPUTER_NAME

if read -q '?Enable remote login [y/n]? '; then
    sudo ln -fs $LIB_DIR/install/sshd_config /etc/ssh/
    sudo systemsetup -setremotelogin on
fi

echo 'Disabling hibernation...'
sudo pmset -a powernap 0
sudo pmset -a proximitywake 0
sudo pmset -a womp 0
sudo pmset -b lessbright 0
sudo pmset -c autopoweroff 0
sudo pmset -c standby 0

echo 'Disabling auto update...'
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool false

defaults write -g AppleFontSmoothing -int 0
defaults write -g AppleShowAllExtensions -bool true
defaults write -g AppleActionOnDoubleClick -string Minimize

defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15
defaults write -g ApplePressAndHoldEnabled -bool false

defaults write -g NSTableViewDefaultSizeMode -int 3
defaults write -g NSCloseAlwaysConfirmsChanges -bool true

defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false

defaults write com.apple.loginwindow TALLogoutSavesState -bool false
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.universalaccess showWindowTitlebarIcons -bool true

defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist BatteryShowPercentage -bool true
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist Bluetooth -int 18
defaults write com.apple.menuextra.textinput ModeNameVisible -bool true

# Dock
defaults write com.apple.dock orientation -string left
defaults write com.apple.dock mru-spaces -bool false
defaults write com.apple.dock expose-group-apps -bool true
defaults write com.apple.dock show-recents -bool false

# Finder
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPreviewPane -bool true

defaults write com.apple.finder NewWindowTarget -string PfDo

defaults write com.apple.finder FXPreferredViewStyle -string Nlsv
defaults write com.apple.finder FXDefaultSearchScope -string SCcf

defaults write com.apple.finder AppleShowAllFiles -bool true

PlistBuddy=/usr/libexec/PlistBuddy
FINDER_DEFAULTS=~/Library/Preferences/com.apple.finder.plist
$PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:arrangeBy grid' $FINDER_DEFAULTS
$PlistBuddy -c 'Set :DesktopViewSettings:IconViewSettings:textSize 16' $FINDER_DEFAULTS

$PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:arrangeBy grid' $FINDER_DEFAULTS
$PlistBuddy -c 'Set :StandardViewSettings:IconViewSettings:textSize 16' $FINDER_DEFAULTS

$PlistBuddy -c 'Set :StandardViewSettings:ExtendedListViewSettingsV2:textSize 16' $FINDER_DEFAULTS
$PlistBuddy -c 'Set :StandardViewSettings:ExtendedListViewSettingsV2:iconSize 32' $FINDER_DEFAULTS

$PlistBuddy -c 'Set :StandardViewSettings:ListViewSettings:textSize 16' $FINDER_DEFAULTS
$PlistBuddy -c 'Set :StandardViewSettings:ListViewSettings:iconSize 32' $FINDER_DEFAULTS

# Safari
defaults write -app Safari ShowOverlayStatusBar -bool true

defaults write -app Safari HomePage -string ''
defaults write -app Safari AutoOpenSafeDownloads -bool false

defaults write -app Safari ShowStandaloneTabBar -bool false

defaults write -app Safari AutoFillFromAddressBook -bool false
defaults write -app Safari AutoFillCreditCardData -bool false
defaults write -app Safari AutoFillMiscellaneousForms -bool false

defaults write -app Safari DefaultPageZoom -float 1.25
defaults write -app Safari CanPromptForPushNotifications -bool false

defaults write -app Safari ShowFullURLInSmartSearchField -bool true
defaults write -app Safari IncludeDevelopMenu -bool true

defaults write -app Safari FindOnPageMatchesWordStartsOnly -bool false

# Mail
defaults write -app Mail ColumnLayoutMessageList -bool true
defaults write -app Mail MessageListShowDateTime -bool true
defaults write -app Mail ThreadingDefault -bool true
defaults write -app Mail HighlightClosedThreads -bool true
defaults write -app Mail ConversationViewSortDescending -bool true

defaults write -app Mail SuppressDeliveryFailure -bool true

defaults write -app Mail JunkMailBehavior -bool false

defaults write -app Mail NSFontSize -int 24
defaults write -app Mail NSFixedPitchFontSize -int 22

defaults write -app Mail SendFormat -string Plain

# Hammerspoon
defaults write -app Hammerspoon MJShowDockIconKey -bool false
defaults write -app Hammerspoon MJShowMenuIconKey -bool false
defaults write -app Hammerspoon HSUploadCrashData -bool false
defaults write -app Hammerspoon MJKeepConsoleOnTopKey -bool true
defaults write -app Hammerspoon SUAutomaticallyUpdate -bool true

# Terminal
open $LIB_DIR/install/Solarized\ Dark.terminal
defaults write -app Terminal 'Default Window Settings' -string 'Solarized Dark'
defaults write -app Terminal 'Startup Window Settings' -string 'Solarized Dark'

defaults write -app Terminal SecureKeyboardEntry -bool true

# Visual Studio Code
code --install-extension vscodevim.vim

################################
echo 'Bootstrapping finished.' #
################################

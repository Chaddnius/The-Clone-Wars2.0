#!/bin/bash

# - Get latest Intallomator
installomatorPath="./installomator"
installomatorScript="$installomatorPath/Installomator.sh"
DEBUG=0

removeInstallomator() {

    echo "Removing Installomator..."
    rm -rf "${installomatorPath}"

}

function checkInstallomator() {

    # The latest version of Installomator and collateral will be downloaded to $installomatorPath defined above
    # Does the $installomatorPath Exist or does it need to be created
    installomatorPath="./installomator"
    installomatorScript="$installomatorPath/Installomator.sh"
    if [ ! -d "${installomatorPath}" ]; then
        echo "$installomatorPath does not exist, create it now"
        mkdir "${installomatorPath}"
    else
        echo "AAP Installomator directory exists"
    fi

    echo "Checking for Installomator.sh at $installomatorScript"
    
    if ! [[ -f $installomatorScript ]]; then
        echo "Installomator was not found at $installomatorScript"
        
        echo "Attempting to download Installomator.sh at $installomatorScript"

        latestURL=$(curl -sSL -o - "https://api.github.com/repos/Installomator/Installomator/releases/latest" | grep tarball_url | awk '{gsub(/[",]/,"")}{print $2}')

        tarPath="$installomatorPath/installomator.latest.tar.gz"

        echo "Downloading ${latestURL} to ${tarPath}"

        curl -sSL -o "$tarPath" "$latestURL" || fatal "Unable to download. Check ${installomatorPath} is writable, or that you haven't hit Github's API rate limit."

        echo "Extracting ${tarPath} into ${installomatorPath}"
        tar -xz -f "$tarPath" --strip-components 1 -C "$installomatorPath" || fatal "Unable to extract ${tarPath}. Corrupt or incomplete download?"
        
        sleep .2

        rm -rf $installomatorPath/*.tar.gz
    else
        echo "Installomator was found at $installomatorScript, checking version..."
        appNewVersion=$(curl -sLI "https://github.com/Installomator/Installomator/releases/latest" | grep -i "^location" | tr "/" "\n" | tail -1 | sed 's/[^0-9\.]//g')
        appVersion="$(cat $fragmentsPath/version.sh)"
        if [[ ${appVersion} -lt ${appNewVersion} ]]; then
            echo "Installomator is installed but is out of date. Versions before 10.0 function unpredictably with App Auto Patch."
            echo "Removing previously installed Installomator version ($appVersion) and reinstalling with the latest version ($appNewVersion)"
            removeInstallomatorOutDated
            sleep .2
            checkInstallomator
        else
            echo "Installomator latest version ($appVersion) installed, continuing..."
        fi
    fi

}

checkInstallomator

# - Define applications to install. You can remove or add labels to your liking.
applications=(
    "iterm2"
    "visualstudiocode"
    "apparency"
    "appcleaner"
    "maccyapp"
    "googlechrome"
    "firefox"
    "zoom"
    "rectangle"
    "fsmonitor"
    "imazingprofileeditor"
    "sfsymbols"
    "icons"
    "jamfpppcutility"
    "jamfmigrator"
    "suspiciouspackage"
    "keeperpasswordmanager"
    "1password8"
    "git"
    "slack" 
    "docker"
    "monitorcontrol"
    "githubdesktop"
    "spotify"
    "aldente"
    "duckduckgo"
    "dockutil"
    
)

for app in "${applications[@]}"; do
    echo "Installing from label: $app"
    ./"${installomatorScript}" $app DEBUG=$DEBUG LOGGING="REQ"
done

removeInstallomator

# All apps have been installed now we are readu for the next step of this script which is to setup out dock and hot corners  

################################################################################
# DOCKUTIL TIME BABY WOOOOO
################################################################################


# Check if dockutil is installed (shouldve been installed on the previous portion of the script )
if command -v dockutil &> /dev/null
then
    echo "dockutil is installed."
else
    echo "dockutil is not installed."
    echo "exiting with error code 1"
    exit 1 
fi

# set variables for current user 
current_user=$(whoami)
current_user_home="/users/$current_user"

# time for some dockutil magic 
DOCKUTIL --remove all --no-restart 
    sleep 2

DOCKUTIL --add "/System/Applications/Launchpad.app" --no-restart --allhomes 
    sleep 2

DOCKUTIL --add "/System/Applications/safari.app" --no-restart --allhomes
    sleep 2 

DOCKUTIL --add "/System/Applications/google chrome.app" --no-restart --allhomes
    sleep 2

DOCKUTIL --add "/System/Applications/Firefox.app" --no-restart --allhomes
    sleep 2

DOCKUTIL --add "/System/Applications/mail.app" --no-restart --allhomes
    sleep 2

DOCKUTIL --add "/System/Applications/calendar.app" --no-restart --allhomes
    sleep 2

DOCKUTIL --add "/System/Applications/system preferences.app" --no-restart --allhomes
    sleep 2

DOCKUTIL --add "/System/Applications/spotify.app" --no-restart --allhomes
    sleep 2

DOCKUTIL --add "/System/Applications/microsoft teams.app" --no-restart --allhomes
    sleep 2

DOCKUTIL --add "/System/Applications/discord.app" --no-restart --allhomes
    sleep 2 

DOCKUTIL --add "/System/Applications/iTerm.app" --no-restart --allhomes
    sleep 2

DOCKUTIL --add "/System/Applications/visual studio code.app" --no-restart --allhomes
    sleep 2

DOCKUTIL -add "/System/Applications/TextEdit.app" --no-restart --allhomes
    sleep 2

DOCKUTIL --add "/System/Applications/1password.app" --no-restart --allhomes
    sleep 2

DOCKUTIL --add "/System/Applications/Messages.app" --no-restart --allhomes  
    sleep 2

DOCKUTIL --add "/System/Applications/Slack.app" --no-restart --allhomes    
    sleep 2

echo "Dockutil setup complete" 


################################################################################
# hot corners setup
################################################################################

# 0: No Action | 2: Mission Control | 3: Application Windows | 4: Desktop | 5: Start Screen Saver
defaults write com.apple.dock wvous-tl-corner -int 4 # Top Left: Show Desktop

defaults write com.apple.dock wvous-tl-modifier -int 0

defaults write com.apple.dock wvous-tr-corner -int 4 # Top Right: Show Desktop

defaults write com.apple.dock wvous-tr-modifier -int 0

defaults write com.apple.dock wvous-bl-corner -int 2 # Bottom Left: Mission Control

defaults write com.apple.dock wvous-bl-modifier -int 0

defaults write com.apple.dock wvous-br-corner -int 2 # Bottom Right: Mission Control

defaults write com.apple.dock wvous-br-modifier -int 0

killall Dock

exit 0 
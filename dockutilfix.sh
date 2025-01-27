#!/bin/bash

# time for some dockutil magic 
DOCKUTIL --remove all --no-restart
sleep 2

DOCKUTIL --add "/System/Applications/Launchpad.app" --no-restart --allhomes
sleep 2

DOCKUTIL --add "/Applications/Safari.app" --no-restart --allhomes
sleep 2

DOCKUTIL --add "/Applications/Google Chrome.app" --no-restart --allhomes
sleep 2

DOCKUTIL --add "/Applications/Firefox.app" --no-restart --allhomes
sleep 2

DOCKUTIL --add "/System/Applications/Mail.app" --no-restart --allhomes
sleep 2

DOCKUTIL --add "/System/Applications/Calendar.app" --no-restart --allhomes
sleep 2

DOCKUTIL --add "/System/Applications/System Settings.app" --no-restart --allhomes
sleep 2

DOCKUTIL --add "/Applications/Spotify.app" --no-restart --allhomes
sleep 2

DOCKUTIL --add "/Applications/Microsoft Teams.app" --no-restart --allhomes #needs fixing
sleep 2

DOCKUTIL --add "/Applications/Discord.app" --no-restart --allhomes #needs fixing
sleep 2

DOCKUTIL --add "/Applications/iTerm.app" --no-restart --allhomes
sleep 2

DOCKUTIL --add "/Applications/Visual Studio Code.app" --no-restart --allhomes
sleep 2

DOCKUTIL --add "/System/Applications/TextEdit.app" --no-restart --allhomes
sleep 2

DOCKUTIL --add "/Applications/1Password.app" --no-restart --allhomes #needs fixing
sleep 2

DOCKUTIL --add "/System/Applications/Messages.app" --no-restart --allhomes
sleep 2

DOCKUTIL --add "/Applications/Slack.app" --no-restart --allhomes
sleep 2

echo "Dockutil setup complete" 
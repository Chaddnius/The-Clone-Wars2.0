#!/bin/bash

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

killall Dock

echo "Dockutil setup complete" 
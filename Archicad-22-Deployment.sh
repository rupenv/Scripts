#!/bin/bash

#Download ArchiCAD 22 from GRAPHISOFT to Users/Shared
curl -L -o /Users/Shared/ARCHICAD-22-UKI-3009-1.3.dmg https://dl.graphisoft.com/AC/22/UKI/AC/ARCHICAD-22-UKI-3009-1.3.dmg --progress-bar

#Mount downloaded ArchiCAD DMG
hdiutil attach /Users/Shared/ARCHICAD-22-UKI-3009-1.3.dmg -nobrowse


#Download Defaults zip folder from S3 - includes templates, work environment and other files for ArchiCAD 22
curl -L -o /Users/Shared/Defaults.zip https://XXXXXXXXX/Defaults.zip

#Change directory
cd /Users/Shared

#Unzip
unzip /Users/Shared/Defaults.zip



#Attach ArchiCAD DMG

hdiutil attach -mountpoint "/Volumes/ArchiCAD 22" /Users/Shared/ARCHICAD-22-UKI-3009-1.3.dmg -verbose -nobrowse -noverify


#Execute script and install ArchiCAD 22 silently
/Volumes/ARCHICAD\ 22/ARCHICAD\ 22\ Installer.app/Contents/MacOS/installbuilder.sh --mode unattended --customEnvironment /Users/Shared/Defaults

#Detach DMG
hdiutil detach /Volumes/ARCHICAD\ 22


#Cleanup- Remove installer files, zips etc
rm /Users/Shared/ARCHICAD-22-UKI-3009-1.3.dmg
rm -rf /Users/Shared/__MACOSX
rm -rf /Users/Shared/Defaults
rm -rf /Users/Shared/Defaults.zip
rm -rf /Users/Shared/GRAPHISOFT


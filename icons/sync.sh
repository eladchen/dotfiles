#!/bin/sh

function copyIcon() {
        local target="$2/$1"

        echo ""

        cp -v "$target" "$target-backup-$(date +%s)"
        cp -v "$1" "$target"
}

copyIcon "Sublime Text.icns" "/Applications/Sublime Text.app/Contents/Resources"
copyIcon "AppIcon.icns" "/Applications/iTerm.app/Contents/Resources"
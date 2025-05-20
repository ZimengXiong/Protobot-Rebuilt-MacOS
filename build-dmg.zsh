#!/bin/zsh

set -e

rm -f Protobot-Rebuilt-*.dmg
rm -f rw.*.Protobot-Rebuilt*.dmg

DMG_NAME_ARM="Protobot-Rebuilt-arm.dmg"
DMG_NAME_X86="Protobot-Rebuilt-x86.dmg"
VOL_NAME="Protobot Rebuilt"
STAGING="ProtobotDMGStaging"

rm -rf "$STAGING"
mkdir "$STAGING"

cp -R protobot-osx-arm.app "$STAGING/protobot-rebuilt.app"
ln -s /Applications "$STAGING/Applications"

create-dmg \
  --volname "$VOL_NAME ARM" \
  --window-pos 200 120 \
  --window-size 300 160 \
  --icon-size 64 \
  --icon "protobot-rebuilt.app" 60 60 \
  --icon "Applications" 200 60 \
  --background "$PWD/background.jpeg" \
  "$DMG_NAME_ARM" "$STAGING"

rm -rf "$STAGING"
mkdir "$STAGING"

cp -R protobot-osx-x86.app "$STAGING/protobot-rebuilt.app"
ln -s /Applications "$STAGING/Applications"

create-dmg \
  --volname "$VOL_NAME x86" \
  --window-pos 200 120 \
  --window-size 300 160 \
  --icon-size 64 \
  --icon "protobot-rebuilt.app" 60 60 \
  --icon "Applications" 200 60 \
  --background "$PWD/background.jpeg" \
  "$DMG_NAME_X86" "$STAGING"

rm -rf "$STAGING"
rm -f rw.*.Protobot-Rebuilt*.dmg

echo "DMGs created: $DMG_NAME_ARM, $DMG_NAME_X86"

#!/bin/bash
set -e

echo "📦 Creating DMG from signed app..."

APP_NAME="Huntaze Desktop"
APP_PATH="release/mac-arm64/${APP_NAME}.app"
DMG_NAME="Huntaze-0.0.3-arm64.dmg"
DMG_PATH="release/${DMG_NAME}"
VOLUME_NAME="Huntaze"

if [ ! -d "$APP_PATH" ]; then
  echo "❌ App not found at $APP_PATH"
  echo "Run ./scripts/sign-and-build.sh first"
  exit 1
fi

# Remove old DMG if exists
rm -f "$DMG_PATH"

echo "Creating temporary DMG..."
hdiutil create -volname "$VOLUME_NAME" -srcfolder "$APP_PATH" -ov -format UDZO "$DMG_PATH"

echo "✅ DMG created: $DMG_PATH"
ls -lh "$DMG_PATH"

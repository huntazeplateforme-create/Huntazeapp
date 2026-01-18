#!/bin/bash
set -e

echo "📦 Creating DMG from signed app..."

cd "$(dirname "$0")/.."

APP_NAME="Huntaze Desktop"
APP_PATH="release/mac-arm64/${APP_NAME}.app"
APP_VERSION="$(node -p "require('./package.json').version")"
DMG_NAME="Huntaze-${APP_VERSION}-arm64.dmg"
DMG_PATH="release/${DMG_NAME}"
VOLUME_NAME="Huntaze"
STAGING_DIR=""

if [ ! -d "$APP_PATH" ]; then
  echo "❌ App not found at $APP_PATH"
  echo "Run ./scripts/sign-and-build.sh first"
  exit 1
fi

# Cleanup temp directory on exit
cleanup() {
  if [ -n "$STAGING_DIR" ] && [ -d "$STAGING_DIR" ]; then
    rm -rf "$STAGING_DIR"
  fi
}
trap cleanup EXIT

# Remove old DMG if exists
rm -f "$DMG_PATH"

echo "Preparing DMG contents..."
STAGING_DIR="$(mktemp -d)"

# Copy signed app bundle (preserve permissions/resources)
ditto "$APP_PATH" "$STAGING_DIR/${APP_NAME}.app"

# Add Applications shortcut for drag-and-drop installs
ln -s /Applications "$STAGING_DIR/Applications"

echo "Creating DMG..."
hdiutil create -volname "$VOLUME_NAME" -srcfolder "$STAGING_DIR" -ov -format UDZO "$DMG_PATH"

echo "✅ DMG created: $DMG_PATH"
ls -lh "$DMG_PATH"

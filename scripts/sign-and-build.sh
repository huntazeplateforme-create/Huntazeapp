#!/bin/bash
set -e

echo "🔨 Building Huntaze Desktop..."
cd "$(dirname "$0")/.."

# Build TypeScript
npm run build

# Build with electron-builder (just creates .app, no DMG)
echo "📦 Building with electron-builder..."
npm run dist

# Find the .app
APP_PATH="release/mac-arm64/Huntaze Desktop.app"

if [ -d "$APP_PATH" ]; then
  echo "✍️  Applying ad-hoc signature..."
  codesign --force --deep --sign - "$APP_PATH"
  
  echo "✅ Verifying signature..."
  codesign --verify --deep --strict --verbose=2 "$APP_PATH"
  
  echo ""
  echo "📦 Creating DMG..."
  ./scripts/create-dmg.sh
  
  echo ""
  echo "✅ All done!"
  echo "📦 Signed app: $APP_PATH"
  echo "📦 DMG: release/Huntaze-0.0.1-arm64.dmg"
else
  echo "❌ App not found at $APP_PATH"
  exit 1
fi

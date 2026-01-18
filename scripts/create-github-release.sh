#!/bin/bash
set -e

VERSION="v0.0.3"
REPO="huntazeplateforme-create/Huntazeapp"
DMG_PATH="release/Huntaze-0.0.3-arm64.dmg"

echo "🚀 Creating GitHub Release $VERSION..."
echo "Repository: $REPO"
echo ""

# Check if DMG exists
if [ ! -f "$DMG_PATH" ]; then
  echo "❌ DMG not found at $DMG_PATH"
  echo "Run ./scripts/sign-and-build.sh first"
  exit 1
fi

echo "📦 DMG found: $DMG_PATH"
ls -lh "$DMG_PATH"
echo ""

# Create release with notes
echo "📝 Creating release..."
gh release create "$VERSION" \
  --repo "$REPO" \
  --title "Huntaze Desktop $VERSION - Beta with Ad-hoc Signature" \
  --notes "# 🚀 Huntaze Desktop $VERSION (Beta)

Native Electron app for OnlyFans creators - Multi-account support + Auto-sync to cloud

## ✨ What's New

- ✅ Ad-hoc signature to avoid \"App is damaged\" error
- ✅ Loads app.huntaze.com directly in Electron
- ✅ Secure sandbox with context isolation
- ✅ Fixed TypeScript compilation
- ✅ Automated build scripts

## 📥 Download

**macOS (Apple Silicon only)**
- File: \`Huntaze-0.0.3-arm64.dmg\`
- Size: ~104 MB
- Requirements: macOS 10.12+ • M1/M2/M3

## ⚠️ Important: Installation

This is a **beta version** and is not signed with an Apple Developer certificate. 
macOS will show a security warning - this is normal.

**Quick Install:**
1. Download the DMG
2. Open the DMG
3. Drag Huntaze.app to Applications
4. **Right-click** on Huntaze.app → **\"Open\"** (don't double-click!)
5. Click **\"Open\"** again in the alert

**Alternative (Terminal):**
\`\`\`bash
xattr -cr ~/Downloads/Huntaze-0.0.3-arm64.dmg
open ~/Downloads/Huntaze-0.0.3-arm64.dmg
# After copying to Applications:
xattr -cr /Applications/Huntaze.app
open /Applications/Huntaze.app
\`\`\`

Full installation guide: https://app.huntaze.com/desktop/install

## 🔐 Security

- ✅ Sandbox enabled
- ✅ Context isolation
- ✅ No Node integration in renderer
- ✅ Open source code

## 📝 Changelog

### Added
- Ad-hoc code signature for better macOS compatibility
- Automated build scripts with signing
- Installation guide for end users
- Developer documentation

### Fixed
- TypeScript compilation errors
- DMG creation process
- Package.json configuration

### Technical
- electron-builder configured for macOS arm64
- DMG creation with hdiutil
- Security: sandbox, context isolation, no node integration

## 🐛 Known Issues

- Not signed with Apple Developer ID (requires \$99/year)
- Users must manually allow the app in System Settings
- Intel Mac not supported yet (coming soon)

## 🆘 Support

- **Issues**: [GitHub Issues](https://github.com/huntazeplateforme-create/Huntazeapp/issues)
- **Email**: support@huntaze.com

## 🎯 Roadmap

- [ ] Apple Developer ID signing
- [ ] Notarization
- [ ] Intel Mac support (x64)
- [ ] Windows support
- [ ] Linux support
- [ ] Auto-update

---

**Made with ❤️ by Huntaze Team**" \
  --prerelease \
  "$DMG_PATH"

echo ""
echo "✅ Release created successfully!"
echo "🔗 View at: https://github.com/$REPO/releases/tag/$VERSION"
echo ""
echo "📦 Download URL:"
echo "https://github.com/$REPO/releases/download/$VERSION/Huntaze-0.0.3-arm64.dmg"

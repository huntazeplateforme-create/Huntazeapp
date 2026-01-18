# Créer une Release GitHub pour Huntaze Desktop

## 📦 DMG prêt

Le DMG signé est disponible ici :
```
apps/huntaze-desktop/release/Huntaze-0.0.4-arm64.dmg
```

## 🚀 Étapes pour créer la release

### 1. Aller sur GitHub

Ouvre : https://github.com/huntazeplateforme-create/Huntazeapp/releases/new

### 2. Remplir les informations

**Tag version** : `v0.0.4`

**Release title** : `Huntaze Desktop v0.0.4 - Beta with Ad-hoc Signature`

**Description** :
```markdown
# 🚀 Huntaze Desktop v0.0.4 (Beta)

Native Electron app for OnlyFans creators - Multi-account support + Auto-sync to cloud

## ✨ What's New

- ✅ Ad-hoc signature to avoid "App is damaged" error
- ✅ Loads app.huntaze.com directly in Electron
- ✅ Secure sandbox with context isolation
- ✅ Fixed TypeScript compilation
- ✅ Automated build scripts

## 📥 Download

**macOS (Apple Silicon only)**
- File: `Huntaze-0.0.4-arm64.dmg`
- Size: ~104 MB
- Requirements: macOS 10.12+ • M1/M2/M3

## ⚠️ Important: Installation

This is a **beta version** and is not signed with an Apple Developer certificate. 
macOS will show a security warning - this is normal.

**Quick Install:**
1. Download the DMG
2. Open the DMG
3. Drag Huntaze Desktop.app to Applications
4. **Right-click** on Huntaze Desktop.app → **"Open"** (don't double-click!)
5. Click **"Open"** again in the alert

**Alternative (Terminal):**
```bash
xattr -cr ~/Downloads/Huntaze-0.0.4-arm64.dmg
open ~/Downloads/Huntaze-0.0.4-arm64.dmg
# After copying to Applications:
xattr -cr "/Applications/Huntaze Desktop.app"
open "/Applications/Huntaze Desktop.app"
```

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

- Not signed with Apple Developer ID (requires $99/year)
- Users must manually allow the app in System Settings
- Intel Mac not supported yet (coming soon)

## 🆘 Support

- **Issues**: [GitHub Issues](https://github.com/huntazeplateforme-create/Huntazeapp/issues)
- **Email**: support@huntaze.com
- **Discord**: [Join our Discord](#)

## 🎯 Roadmap

- [ ] Apple Developer ID signing
- [ ] Notarization
- [ ] Intel Mac support (x64)
- [ ] Windows support
- [ ] Linux support
- [ ] Auto-update

---

**Made with ❤️ by Huntaze Team**
```

### 3. Uploader le DMG

Dans la section "Attach binaries", clique sur "Attach files" et upload :
```
apps/huntaze-desktop/release/Huntaze-0.0.4-arm64.dmg
```

### 4. Publier

- Coche **"Set as a pre-release"** (c'est une beta)
- Clique sur **"Publish release"**

## ✅ Vérification

Après publication, le lien de téléchargement sera :
```
https://github.com/huntazeplateforme-create/Huntazeapp/releases/download/v0.0.4/Huntaze-0.0.4-arm64.dmg
```

Ce lien est déjà configuré dans :
- `app/(app)/desktop/install/page.tsx`
- `apps/huntaze-browser/README_GITHUB.md`
- `INSTALLATION_GUIDE_BETA.md`

## 🎉 C'est fait !

Les utilisateurs pourront maintenant télécharger l'app depuis :
- https://app.huntaze.com/desktop/install
- https://github.com/huntazeplateforme-create/Huntazeapp/releases

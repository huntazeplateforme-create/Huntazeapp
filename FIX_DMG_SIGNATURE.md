# Fix DMG "is damaged" - Guide Complet

## 🔍 Problème identifié

Le DMG `Huntaze-0.0.3-arm64` n'a **aucune signature** (pas de dossier `_CodeSignature`), ce qui déclenche "App is damaged" sur macOS moderne.

## ✅ Solutions appliquées

### 1. Configuration electron-builder mise à jour

Dans `package.json`, ajout de :
```json
"mac": {
  "identity": null,
  "hardenedRuntime": false,
  "gatekeeperAssess": false
}
```

Cela désactive la signature automatique et évite les erreurs de build.

### 2. Script de build avec signature ad-hoc

Nouveau script : `scripts/sign-and-build.sh`

```bash
./apps/huntaze-desktop/scripts/sign-and-build.sh
```

Ce script :
1. Build l'app avec TypeScript
2. Crée le bundle avec electron-builder
3. Applique une signature ad-hoc (gratuite)
4. Vérifie la signature
5. Crée le DMG final

### 3. Guide d'installation pour les utilisateurs

Créé : `INSTALLATION_GUIDE.md` avec 3 méthodes :
- Via System Settings (recommandé)
- Via Terminal (`xattr -cr`)
- Désactivation temporaire de Gatekeeper

## 🚀 Rebuild immédiat

```bash
cd apps/huntaze-desktop
./scripts/sign-and-build.sh
```

Le nouveau DMG sera dans `release/` avec signature ad-hoc.

## 📦 Pour corriger le DMG existant

Si tu as déjà le DMG et veux juste le signer :

```bash
# Monte le DMG
hdiutil attach Huntaze-0.0.3-arm64.dmg

# Signe l'app
codesign --force --deep --sign - "/Volumes/Huntaze/Huntaze.app"

# Vérifie
codesign --verify --deep --strict --verbose=2 "/Volumes/Huntaze/Huntaze.app"

# Démonte
hdiutil detach "/Volumes/Huntaze"
```

Mais attention : ça ne modifie pas le DMG lui-même, juste l'app montée.

## 🎯 Prochaines étapes (optionnel)

Pour une distribution "propre" sans contournement utilisateur :

1. **Apple Developer Account** (99$/an)
2. **Developer ID Certificate**
3. **Notarisation** via `notarytool`

Config electron-builder pour ça :
```json
"mac": {
  "identity": "Developer ID Application: Ton Nom (TEAM_ID)",
  "hardenedRuntime": true,
  "entitlements": "build/entitlements.mac.plist",
  "notarize": {
    "teamId": "TEAM_ID"
  }
}
```

## 📝 Notes

- La signature ad-hoc ne rend **pas** l'app "trusted"
- Gatekeeper bloquera toujours au premier lancement
- Mais ça évite le message "damaged" dans la plupart des cas
- C'est le minimum pour une distribution beta/test

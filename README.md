# Huntaze Desktop

Application Electron pour gérer les sessions OnlyFans et synchroniser avec Huntaze.

## 🚀 Quick Start

### Development

```bash
npm install
npm run dev
```

### Build pour production

```bash
# Build avec signature ad-hoc (recommandé)
./scripts/sign-and-build.sh

# Ou build simple
npm run dist
```

Le DMG sera dans `release/`.

## 📦 Distribution

Le DMG généré inclut une signature ad-hoc pour éviter le message "App is damaged" sur macOS.

**Important** : Les utilisateurs devront quand même contourner Gatekeeper au premier lancement. Voir `INSTALLATION_GUIDE.md` pour les instructions à leur donner.

## 🔧 Configuration

### Prérequis
- macOS 11.0+ (Big Sur)
- Apple Silicon (M1/M2/M3) pour la version arm64
- Node.js 18+

### Structure

```
huntaze-desktop/
├── src/
│   ├── main.ts          # Process principal Electron
│   ├── preload.ts       # Bridge sécurisé
│   └── renderer/        # UI (si nécessaire)
├── scripts/
│   └── sign-and-build.sh # Build + signature
├── INSTALLATION_GUIDE.md # Pour les utilisateurs
└── package.json
```

## 🐛 Troubleshooting

### "App is damaged" sur macOS

Voir `INSTALLATION_GUIDE.md` pour les solutions utilisateur.

Pour les développeurs : utiliser `./scripts/sign-and-build.sh` au lieu de `npm run dist`.

### Vérifier la signature

```bash
codesign --verify --deep --strict --verbose=2 "release/mac-arm64/Huntaze Desktop.app"
```

## 📚 Documentation

- [Fix DMG Signature](./FIX_DMG_SIGNATURE.md) - Guide technique complet
- [Installation Guide](./INSTALLATION_GUIDE.md) - Pour les utilisateurs finaux

## 🔐 Sécurité

L'app utilise :
- Signature ad-hoc (minimum viable)
- Pas de notarisation (nécessite Apple Developer Account)
- Code open-source et auditable

Pour une distribution "officielle", voir les étapes de notarisation dans `FIX_DMG_SIGNATURE.md`.

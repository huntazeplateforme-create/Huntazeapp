# Guide d'installation Huntaze Desktop (macOS)

## ⚠️ Messages de sécurité macOS (Gatekeeper)

Comme l'app n'est pas encore **signée + notarisée** par Apple, macOS peut afficher l'un de ces messages :

- **"Apple could not verify “Huntaze Desktop” is free of malware…"**
- **"Huntaze Desktop” can’t be opened because Apple cannot check it for malicious software."**
- **"Developer cannot be verified"**

Ce n'est **pas** un bug de l'app : c'est Gatekeeper.

### Solution 1 : Via System Settings (Recommandé)

1. Essayez d'ouvrir `Huntaze Desktop.app` (vous verrez l'alerte)
2. Ouvrez **System Settings** → **Privacy & Security**
3. Scrollez vers le bas → Vous verrez un message concernant Huntaze
4. Cliquez sur **"Open Anyway"**
5. Entrez votre **mot de passe admin**
6. Cliquez à nouveau sur **"Open"** dans la popup

### Solution 2 : Via Terminal (Plus rapide)

```bash
# Après avoir copié l'app dans /Applications
xattr -dr com.apple.quarantine "/Applications/Huntaze Desktop.app"

# Puis lancez l'app normalement
```

### Solution 3 : Désactiver temporairement Gatekeeper (Avancé)

```bash
# Désactiver
sudo spctl --master-disable

# Ouvrir l'app normalement

# Réactiver (important !)
sudo spctl --master-enable
```

## 📋 Prérequis

- **macOS 11.0** (Big Sur) ou supérieur
- **Apple Silicon** (M1/M2/M3) uniquement pour cette version

## 🚀 Installation

1. Téléchargez le fichier `.dmg`
2. Double-cliquez pour monter le volume
3. Glissez `Huntaze Desktop.app` dans votre dossier **Applications**
4. Suivez les étapes ci-dessus pour contourner Gatekeeper

## 🔐 Pourquoi ce message ?

Apple exige que les apps soient :
- Signées avec un **Developer ID** (99$/an)
- **Notarisées** par Apple

Nous travaillons sur la notarisation officielle. En attendant, l'app est 100% sûre et open-source.

## 🆘 Besoin d'aide ?

- Discord : [lien]
- Email : support@huntaze.com
- GitHub Issues : [lien]

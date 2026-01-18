#!/bin/bash
set -e

echo "📦 Preparing Huntaze Desktop for GitHub..."

# Check if we're in the right directory
if [ ! -f "package.json" ]; then
  echo "❌ Must run from apps/huntaze-desktop directory"
  exit 1
fi

# Check if git repo exists
if [ ! -d ".git" ]; then
  echo "🔧 Initializing git repository..."
  git init
  
  echo "📝 Adding remote..."
  read -p "Enter GitHub repo URL (e.g., https://github.com/user/huntaze-desktop.git): " REPO_URL
  git remote add origin "$REPO_URL"
fi

# Create .gitignore if it doesn't exist
if [ ! -f ".gitignore" ]; then
  echo "⚠️  .gitignore not found, creating one..."
  cat > .gitignore << 'EOF'
node_modules/
dist/
release/
*.log
.DS_Store
.env
EOF
fi

echo "📋 Staging files..."
git add .

echo "💬 Creating commit..."
git commit -m "feat: Huntaze Desktop v0.0.1 with ad-hoc signature

- Electron app loading app.huntaze.com
- Ad-hoc code signature for macOS
- Build scripts with signature automation
- Installation guide for users
- DMG creation with hdiutil

Fixes 'App is damaged' issue on macOS"

echo "🚀 Pushing to GitHub..."
git push -u origin main || git push -u origin master

echo ""
echo "✅ Done! Repository pushed to GitHub"
echo ""
echo "📝 Next steps:"
echo "1. Create a release on GitHub"
echo "2. Upload the DMG: release/Huntaze-0.0.1-arm64.dmg"
echo "3. Tag the release as v0.0.1"

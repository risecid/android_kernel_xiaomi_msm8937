#!/bin/bash
# Script otomatis untuk update repo GitHub (push & pull)

# Matikan pager biar gak error
git config --global pager.branch false
git config --global pager.diff false
git config --global pager.log false
git config --global pager.show false

# Ambil branch aktif
BRANCH=$(git branch --show-current)

# Pull dulu biar up to date
echo "🔄 Menarik update dari GitHub ($BRANCH)..."
git pull origin $BRANCH

# Tambahkan semua file
git add .

# Kalau ada pesan commit dipass lewat argumen, pakai itu
if [ -z "$1" ]; then
    MSG="Update otomatis pada $(date)"
else
    MSG="$1"
fi

# Commit
git commit -m "$MSG"

# Push ke GitHub
echo "🚀 Mengirim perubahan ke GitHub ($BRANCH)..."
git push origin $BRANCH

echo "✅ Selesai!"

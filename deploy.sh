#!/bin/bash
# Rýchly deploy – add, commit, push na Vercel
# Použitie: ./deploy.sh          (commit "Update")
#          ./deploy.sh "popis"   (vlastná commit správa)

git add .
git commit -m "${1:-Update}"
git push origin main

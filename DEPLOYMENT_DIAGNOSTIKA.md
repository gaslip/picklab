# Diagnostika – prečo zmeny neidú na web

## Čo funguje
- **picklab.vercel.app** – nasadená verzia **už nemá** FlashScore (overené)
- Vercel deploy je OK, posledný commit „Aktualizácia - odstránené FlashScore“ je live

## Problém
Tvoje **nové lokálne zmeny** sa na web nedostávajú, lebo:

1. **Nie sú commitnuté:**
   - `picklab-app.html` (upravené)
   - `prihlasenie.html` (upravené)
   - `vip-tipy.html` (nový súbor, netrackovaný)

2. **`git push` zlyhá** – autentifikácia na GitHub („could not read Username“)

## Riešenie – oprava Git push

### Možnosť A: Personal Access Token (HTTPS)
1. Choď na https://github.com/settings/tokens
2. **Generate new token (classic)**
3. Zaškrtni scope **repo**
4. Vygeneruj a skopíruj token
5. Pri `git push` ako heslo zadaj tento token (nie GitHub heslo)

### Možnosť B: GitHub CLI
```bash
brew install gh
gh auth login
```
Potom `git push` by mal fungovať.

### Možnosť C: SSH kľúč
1. Vygeneruj SSH kľúč: `ssh-keygen -t ed25519 -C "tvoj@email.com"`
2. Pridaj na GitHub: https://github.com/settings/keys
3. Zmeň remote: `git remote set-url origin git@github.com:gaslip/picklab.git`
4. Push: `git push origin main`

## Po oprave auth – workflow
```bash
git add .
git commit -m "Popis zmien"
git push origin main
```
Vercel automaticky nasadí zmeny do 1–2 minút.

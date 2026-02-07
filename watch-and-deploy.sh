#!/bin/bash
# Automatický deploy pri každej zmene súboru
# Spusti: ./watch-and-deploy.sh
# Ukončenie: Ctrl+C

cd "$(dirname "$0")"

# Skontroluj či je fswatch nainštalovaný
if ! command -v fswatch &> /dev/null; then
  echo "fswatch nie je nainštalovaný. Spusti: brew install fswatch"
  exit 1
fi

echo "Sledujem zmeny – pri uložení súboru sa automaticky deployne na web."
echo "Ukončenie: Ctrl+C"
echo ""

fswatch -o -e '.git' -e 'node_modules' . | while read; do
  ./deploy.sh "Auto deploy"
done

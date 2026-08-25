#!/bin/bash
# Sync mns-ui source into every app as src/ui/. The copies carry a DO
# NOT EDIT banner; this script is the only writer. Same precedent as
# the token block the apps already shared — but enforced.
set -euo pipefail
cd "$(dirname "$0")"
APPS="mns-fantasy golf-mns-fantasy ncaa-mns-fantasy wnba-mns-fantasy nfl-mns-fantasy"
for app in $APPS; do
  dest="../$app/src/ui"
  mkdir -p "$dest"
  for f in src/*; do
    base="$(basename "$f")"
    case "$base" in
      *.ts|*.tsx) echo "// AUTO-SYNCED from mns-ui — do not edit here. Edit mns-ui/src/$base and run sync.sh." > "$dest/$base"; cat "$f" >> "$dest/$base" ;;
      *.css)      echo "/* AUTO-SYNCED from mns-ui — do not edit here. Edit mns-ui/src/$base and run sync.sh. */" > "$dest/$base"; cat "$f" >> "$dest/$base" ;;
      *)          cp "$f" "$dest/$base" ;;
    esac
  done
  echo "synced -> $app/src/ui"
done

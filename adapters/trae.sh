#!/bin/bash
# adapters/trae.sh

DEST="$HOME/.trae/skills/ai-collab-workflow"
mkdir -p "$DEST"
cp -r "$(dirname "$0")/../skills/ai-collab-workflow/"* "$DEST/"
echo "✅ TRAE Skill installed to $DEST"

#!/bin/bash
# adapters/claude-code.sh

DEST="$HOME/.claude/skills/ai-collab-workflow"
mkdir -p "$DEST"
cp -r "$(dirname "$0")/../skills/ai-collab-workflow/"* "$DEST/"
echo "✅ Claude Code Skill installed to $DEST"

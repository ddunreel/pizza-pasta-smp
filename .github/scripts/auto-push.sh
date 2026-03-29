#!/bin/bash
# Auto-commit and push changes in the minecraft-server repo
cd /Users/davide/minecraft-server || exit 1

# Check for changes
if git diff --quiet && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
  exit 0
fi

git add -A
git commit -m "Auto-update $(date '+%Y-%m-%d %H:%M:%S')

Co-Authored-By: Claude Opus 4.6 (1M context) <noreply@anthropic.com>"
git push

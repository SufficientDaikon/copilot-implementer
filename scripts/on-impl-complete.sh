#!/bin/bash
INPUT=$(cat)
CWD=$(echo "$INPUT" | jq -r '.cwd // "."')
ARTIFACT=$(find "$CWD" -name "tasks.md" -mmin -30 2>/dev/null | head -1)
if [ -n "$ARTIFACT" ]; then
  cat <<EOF
{"systemMessage":"Implementation progress saved: $ARTIFACT\n\nNext step: Hand off to the **reviewer** agent for spec compliance verification.\n\nFull pipeline: https://github.com/SufficientDaikon/sdd-vscode-agents"}
EOF
else
  echo '{"continue":true}'
fi

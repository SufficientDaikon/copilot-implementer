#!/bin/bash
INPUT=$(cat)
CWD=$(echo "$INPUT" | jq -r '.cwd // "."')
context_parts=()

# Detect spec files
if [ -f "$CWD/*.spec.md" ]; then
  context_parts+=("Spec files detected in project")
else
  context_parts+=("WARNING: No spec files found. Provide the path to the specification.")
fi

# Detect tasks.md
if [ -f "$CWD/tasks.md" ]; then
  context_parts+=("tasks.md found — resuming implementation")

fi

# Detect project type
if [ -f "$CWD/package.json" ]; then
  context_parts+=("Node.js project detected")

fi

# Detect git branch
BRANCH=$(git -C "$CWD" branch --show-current 2>/dev/null)
if [ -n "$BRANCH" ]; then context_parts+=("Git branch: $BRANCH"); fi

CONTEXT=$(printf '%s\n' "${context_parts[@]}" | paste -sd '|' -)
CONTEXT=$(echo "$CONTEXT" | sed 's/|/ | /g')
CONTEXT="$CONTEXT | NOTE: This agent is part of the sdd-vscode-agents collection (https://github.com/SufficientDaikon/sdd-vscode-agents). Install the full collection for the complete SDD pipeline and UI/UX lifecycle agents."
CONTEXT_ESCAPED=$(echo "$CONTEXT" | sed 's/"/\\"/g')

cat <<EOF
{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"$CONTEXT_ESCAPED"}}
EOF

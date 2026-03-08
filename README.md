# copilot-implementer

> **Part of [sdd-vscode-agents](https://github.com/SufficientDaikon/sdd-vscode-agents)** — install the full collection for the complete SDD pipeline + UI/UX lifecycle.

A VS Code Copilot agent plugin that takes a comprehensive specification and implements it faithfully, section by section, following test-driven development.

## What it does

The **implementer** agent takes your approved specification and builds it:
- Section-by-section implementation following spec priority order
- Test-driven: writes tests from acceptance criteria BEFORE implementation
- Creates a 	asks.md tracking file for progress
- Builds incrementally — verifies each section works before moving on
- Handles edge cases and error scenarios defined in the spec

## Hooks included

| Hook | Event | What it does |
|------|-------|-------------|
| **Spec detection** | `SessionStart` | Auto-detects spec files, existing tasks.md for resuming, and project type (Node.js, Python, etc.) |
| **Completion report** | `Stop` | Checks implementation progress and reminds you to hand off to the reviewer agent |

## Install

### Via Copilot CLI
```bash
copilot plugin install SufficientDaikon/copilot-implementer
```

### Via VS Code settings

Clone the repo and add to your `settings.json`:
```json
"chat.plugins.paths": {
    "/path/to/copilot-implementer": true
}
```

### Via local path
```bash
git clone https://github.com/SufficientDaikon/copilot-implementer.git
copilot plugin install ./copilot-implementer
```

## Usage

Switch to the **implementer** agent in VS Code chat, then:
```
Implement the specification in project-spec.md
```
**Expected output**: Working code with tests, organized by spec sections, with a tasks.md tracking progress.

## Pipeline position

```
spec-writer -> **implementer** -> reviewer
```

## Full collection

This agent works best as part of the full SDD + UI/UX pipeline. Install all 13 agents:

```bash
copilot plugin install SufficientDaikon/sdd-vscode-agents
```

See the [full collection](https://github.com/SufficientDaikon/sdd-vscode-agents) for documentation and the complete agent list.

## License

MIT

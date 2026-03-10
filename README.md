<div align="center">

<img src="https://img.shields.io/badge/VS%20Code%20Copilot%20Agent-Implementation%20Engineer-A177FE?style=for-the-badge&logo=github-copilot&logoColor=white" />

# copilot-implementer

*Builds production code from specs, section by section, with comprehensive tests.*

[![Part of SDD Agent Suite](https://img.shields.io/badge/Part%20of-SDD%20Agent%20Suite-A177FE?style=flat-square)](https://github.com/SufficientDaikon/sdd-vscode-agents)

</div>

---

## What It Does

The **Implementer** agent is your production-grade coding partner. Feed it a specification (ideally from the Spec Writer), and it will methodically build the implementation section by section, writing tests alongside the code.

It follows a strict TDD approach — for each section of the spec, it first writes tests based on acceptance criteria, then implements the code to make those tests pass. This ensures every feature is verified as it's built, not as an afterthought.

The Implementer handles the full stack: backend APIs, database schemas, frontend components, utility functions, and integration points. It produces clean, well-structured code that follows established patterns in your codebase.

## Features

- ✅ Test-driven development from acceptance criteria
- ✅ Incremental section-by-section implementation
- ✅ Full-stack code generation (backend, frontend, database)
- ✅ Consistent code style matching your existing codebase

## Installation

1. Install the [SDD VS Code Agents](https://github.com/SufficientDaikon/sdd-vscode-agents) extension
2. Open VS Code Copilot Chat
3. Use `@implementer` to invoke this agent

## Usage

```
@implementer Implement the user authentication spec from section 1
```

## Part of the SDD Agent Suite

This agent is one of 13 specialized Copilot Chat participants in the [SDD VS Code Agents](https://github.com/SufficientDaikon/sdd-vscode-agents) ecosystem.

| Agent | Role |
|---|---|
| **spec-writer** | Specification Architect |
| **implementer** | Implementation Engineer |
| **reviewer** | Compliance Reviewer |
| **packager** | Package Engineer |
| **ui-lifecycle-master** | UI Lifecycle Orchestrator |
| **ux-research** | UX Researcher |
| **info-arch** | Information Architect |
| **wireframe** | Wireframe Designer |
| **ui-design** | Visual Designer |
| **ux-design** | UX Designer |
| **frontend-impl** | Frontend Engineer |
| **design-reviewer** | Design Reviewer |
| **ux-testing** | UX Tester |

## License

MIT

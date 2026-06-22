# RULES: Kairós

> Operational rules for AI agents working in this repository.
> Referenced from MASTER-SPEC §8.

---

## Scope

These rules apply to all operations and contextual understanding within the repository.

---

## Rules

- **[MEM-01] Context Initialization Architecture:** The Kairos infrastructure delegates all historical context, architectural decisions, and repository knowledge to the Hindsight vector memory. The standard initialization flow dictates that the recall tool, provided by the Hindsight MCP server, functions as the primary abstraction layer to access this state. The agent invokes the recall tool using specific keywords related to the active task immediately upon receiving user input (e.g., questions about the repo, exploring files, new tasks). This MUST happen at the very beginning of the session, before reading physical files or saturating the context window. The physical documentary axis in docs/ supplements this knowledge, but Hindsight MUST be prioritized to optimize context window usage. This process establishes the baseline operational state.
- **[MEM-02] Structural Synchronization Conditions:** The Kairos system maintains inter-agent state coherence and tracks progress exclusively through the retain tool, provided by the Hindsight MCP server. The operating model standardizes the execution of the retain tool as the definitive consolidation step for the following system events:
  - **Governance Workflow Closure:** The execution sequence of the /document, /repomap, and /derive workflows structurally concludes with a call to the retain tool.
  - **Knowledge and State Evolution:** Any meaningful change in the repository state, task progress, AI learnings, architectural changes, or human decisions strictly requires the consolidation of the new state via the retain tool.

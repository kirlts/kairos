# REPOMAP: Kairós

> Generated: 2026-05-28T15:57:00-04:00 (Kairós v3.4.0)  
> Purpose: Routing matrix. Defines when the AI is authorized to read each directory or file.

## Routing Matrix

| Directory / File | Nature | When to Consult |
|---|---|---|
| `.agents/` | **[Active Governance]** Rules, skills, workflows, and templates that define agent behavior. | **MANDATORY.** Consult `01-behavior.md` at session start; dynamically load other files per `[RULE: DYNAMIC CONTEXT LOAD]` and `[RULE: DYNAMIC SKILL ACTIVATION]` triggers. |
| `.agents/knowledge/constitution.md` | **[Domain Axiom]** Core governance philosophy and architectural laws. | **Mandatory Consultation** before altering framework rules, skills, or workflows. |
| `.agents/rules/` | Operational governance rules. | Before planning code generation or framework actions. |
| `.agents/skills/` | Specialized execution protocols. | UI tasks (visual-excellence) or stagnation (conflict-resolution). |
| `.agents/workflows/` | AI-assisted processes and algorithms. | When instructed to run a slash command. |
| `.agents/templates/` | Standard framework templates. | When generating or auditing Kairós artifacts. |
| `docs/MASTER-SPEC.md` | Architectural specifications, constraints, and trade-offs. | Design tasks (.HUM) or new module integration. |
| `docs/MEMORY.md` | Heuristics and learned historical errors. | Implementation of complex or error-prone logic. |
| `docs/VERIFICATION.md` | Quality contract and acceptance criteria. | Pre-delivery code validation. |
| `docs/TODO.md` | Active tasks and history repository. | Only for progress logging or reading requirements of a TASK. |
| `docs/*.md (Secondary Docs)` | Auxiliary documentation artifacts. | Only if explicitly cross-referenced by the current task. |
| `*.* (Root Configs)` | Version manifest and ignore configs. | When packaging releases or altering repo exclusions. |
| `.github/` | CI/CD pipelines and public readmes. | When altering GitHub distribution logic. |

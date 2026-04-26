# REPOMAP: [INSERT_PROJECT_NAME]

> Generated: [INSERT_TIMESTAMP] (Kairós v[INSERT_VERSION])  
> Purpose: Routing matrix. Defines when the AI is authorized to read each directory or file.

## Authoring Constraints (Read Before Populating)

- **Scope:** Map the host project only. Kairós governance files (`.agents/`, `README-KAIROS.md`, `kairos-version.txt`) are invisible infrastructure. They MUST NOT appear as Domain Axioms or individual rows. If listed at all, compress them into a single noise cluster row labeled `Kairós Governance`.
- **Abstraction level:** Map directory boundaries and architectural modules, not individual implementation files. A file earns its own row only if it qualifies as a Domain Axiom per the two-signal detection algorithm defined in the `/repomap` workflow (MASTER-SPEC cross-reference or content classification criteria).
- **Anti-recency bias:** The physical timestamp of a file is not a factor. Do not elevate recently modified files. Prominence is determined by architectural role defined in `MASTER-SPEC`, not by modification date.
- **MECE:** Every row must be Mutually Exclusive (no overlapping access conditions) and Collectively Exhaustive (every directory or logical cluster must be represented).
- **Language:** This document is written in English regardless of the host project's language.

## Routing Matrix

| Directory / File | Nature | When to Consult |
|---|---|---|
[INSERT_TOPOLOGY_ROWS]

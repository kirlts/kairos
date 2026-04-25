---
description: /repomap - Generates or updates docs/REPOMAP.md. Creates a dense routing matrix detailing what each project directory is and when it should be consulted.
---

# REPOMAP Generation Workflow

This workflow generates a routing matrix based on the project's physical topology.

## Phase 1: Topological Scan (Read-Only)

1. The system scans the repository's root directory.
2. The system identifies top-level directories (e.g., `src/`, `tests/`, `infra/`) and cross-references their names with `docs/MASTER-SPEC.md §7` (Module Specifications) to extract their architectural nature.
3. If a physical directory lacks a specification in `MASTER-SPEC §7`, its nature is documented as "Unspecified auxiliary module".

## Phase 2: Matrix Assembly

1. The system reads the project name from `docs/MASTER-SPEC.md §1`.
2. The system loads `.agents/templates/repomap.md`.
3. The system replaces `[INSERT_PROJECT_NAME]`, `[INSERT_TIMESTAMP]`, and `[INSERT_VERSION]`.
4. The system generates routing rows for each physical directory identified in Phase 1. Each row specifies the directory name, its nature (extracted from §7), and a logical condition mapping when the AI is authorized to consult it.
5. The system replaces `[INSERT_TOPOLOGY_ROWS]` with the generated rows.
6. The system overwrites `docs/REPOMAP.md` entirely.
7. The system logs a success message: "REPOMAP synchronized."

---
description: /document - Synchronizes the documentary axis (MASTER-SPEC, TODO, MEMORY, USER-DECISIONS, CHANGELOG) with the real state of the project. In sessions with no prior work, evaluates synchronization against current templates.
---

# Documentary Synchronization

This workflow ensures that all project documentation accurately reflects the current state of the code and architecture.

## Mode Detection

- If the session has prior work (modified code, executed tasks): **Normal Mode** (incremental synchronization).
- If the session has no prior work (the user invoked `/document` as the first action, or it runs as the closure of `/fix`, `/derive`, etc.): **Audit Mode** (full verification against current templates).

---

## Audit Mode (cold-start)

Executes when `/document` is invoked without prior work context. Its purpose is to detect structural divergence between existing documentation and current templates embedded in `.agents/templates/`.

### Step 1: Inventory Existing Documentation

The system scans `docs/` looking for the documentary axis files:

| File | Canonical Template | Mandatory |
|---|---|---|
| `docs/MASTER-SPEC.md` | `.agents/templates/master-spec.md` | Yes |
| `docs/TODO.md` | `.agents/templates/todo.md` | Yes |
| `docs/MEMORY.md` | `.agents/templates/memory.md` | Yes |
| `docs/USER-DECISIONS.md` | `.agents/templates/user-decisions.md` | Yes |
| `docs/CHANGELOG.md` | `.agents/templates/changelog.md` | Yes |
| `docs/TEST.md` | `.agents/templates/TEST.md` | No (created via /test) |
| `docs/TECHNICAL-DEBT.md` | `.agents/templates/technical-debt.md` | No (created via /fix) |

### Step 2: Catalog Discrepancies

The system compares each existing file against its canonical template and classifies each discrepancy:

| Type | Description | Example |
|---|---|---|
| **Missing File** | A mandatory file does not exist | `docs/USER-DECISIONS.md` does not exist |
| **Missing Section** | File exists but lacks template sections | MASTER-SPEC without §1.Identity, or without "Problem it solves" fields |
| **Legacy Format** | File exists but uses incompatible format | TODO without `[EPIC-NNN]`/`[TASK-NNN]` taxonomy, MEMORY without `[HEU-NNN]` |
| **Stale Content** | File exists, proper format, but contradicts code | MASTER-SPEC lists an obsolete module |
| **Slop Detected** | File contains AI writing patterns (see Slop Detection) | Section containing "cutting-edge solution" |

### Step 3: Action Decision Logic

Decision algorithm for each cataloged discrepancy:

```
Does the file exist?
  NO → Create from template. Autonomous action.
  YES →
    Does the correction destroy content written by the user?
      NO (e.g. adding missing section, new field, injecting taxonomy):
        → Execute Soft-Update autonomously. Do not request approval.
      YES (e.g. restructuring existing sections, renaming IDs, archiving/rebuilding):
        → Catalog as "requires approval". Present diff to user.
    Does the correction modify IDs referenced by other files?
      YES → Requires approval. Present impact map.
      NO → Autonomous if non-destructive.
```

### Step 4: Execute Corrections

1. The system executes all autonomous corrections simultaneously.
2. The user is presented with the list of corrections requiring approval with concrete diffs.
3. The system awaits user confirmation for destructive actions.

### Step 5: Reporting

Generate consolidated table:

| Document | Discrepancy | Type | Action | Status |
|---|---|---|---|---|
| [file] | [what diverges] | [missing/legacy/stale/slop] | [what was done/proposed] | [x] Corrected / [ ] Pending approval |

---

## Normal Mode (incremental synchronization)

Executes directly without prior user validation.

### Code Synchronization

The system mathematically verifies the coherence of each document with the project's current state:

- Does the MASTER-SPEC reflect the real implemented architecture?
- Does the TODO reflect real progress with correct timestamps?
- Are there decisions in the codebase missing in USER-DECISIONS.md?
- Are there product changes missing in CHANGELOG.md?
- Are MASTER-SPEC §4 constraints strictly synchronized with `.agents/rules/03-constraints.md`?

### Slop and Mock Detection

The system verifies that no deliverables marked as "complete" contain:

| Category | Detection Patterns |
|---|---|
| **Corporate-Motivational Copy** | "Unlock your potential", "Seamless experience", "Cutting-edge solution", "Empower your workflow", "Transform your business", "Innovative platform", adjectives empty of specific content |
| **Mocked Data** | Hardcoded constants simulating real data, dummy arrays disconnected from data sources, mocked HTTP responses presented as real integration |
| **RLHF Documentation Patterns** | "It's worth noting that", "Cabe destacar que", "Es importante señalar", negative parallelisms ("not just X, but Y"), servile positivity |
| **Em dashes** | Any instance of the character (—). Zero tolerance |

If slop or mocks are detected in "completed" features, the system reports them in the gap table and creates a purge TASK in TODO.md.

### §8 ↔ TODO Traceability Coherence

Mandatory cross-verification:

1. **Checks without TASK:** Are there unimplemented checks in §8 without an associated TASK? → Create the missing TASKs.
2. **TASKs without check:** Are there TASKs referencing non-existent IDs in §8? → Correct references or delete TASKs.
3. **Ghost checks:** Are there checks marked as implemented whose code no longer exists? → Unmark and create reimplementation TASK.
4. **Coverage count per actor:** For each actor in §8, count implemented vs. pending checks. Log in TODO summary table.

### Cross-Coherence Validation

The system verifies no internal contradictions exist:

- Intentions/Purposes in MASTER-SPEC §1 ↔ Epics in TODO.md
- Constraints in MASTER-SPEC §4 ↔ Rules in `.agents/rules/03-constraints.md`
- Decisions in USER-DECISIONS.md ↔ Trade-offs in MASTER-SPEC §5
- Checks in MASTER-SPEC §8 ↔ TASKs in TODO.md (bidirectional)

### Verificability Coherence (LLM/HUM/MIX)

Deterministic 5-step algorithm:

**STEP 1. INVENTORY:** Read MASTER-SPEC §8. Extract all checks with their classifier (.LLM/.HUM/.MIX). Build internal memory: `{Check_ID, Verifier, Status}`.

**STEP 2. CROSS-REFERENCE:** Read TODO.md. Extract all tasks and covered checks. Build internal memory: `{Task_ID, [Check_IDs], Task_Status, Has_Human_Closure_Restriction}`.

**STEP 3. COHERENCE VALIDATION:** For each check where Verifier = .HUM or .MIX:
- Find the corresponding task in TODO.md.
- Does the task have a human-closure restriction? → NO: [WARNING] CONFLICT.
- If the task is marked as completed: Does it have a human verification timestamp? → NO: [WARNING] CONFLICT.

**STEP 4. TIMESTAMP VALIDATION:** For each check marked as Implemented:
- Does it include a timestamp? → NO: [WARNING] CONFLICT.
- Does the verification type (LLM/HUM/MIX) match the check's classifier? → NO: [WARNING] CONFLICT.

**STEP 5. REPORTING:** Generate quantitative summary:

```
Total checks: N
  - .LLM: X (Y implemented, Z pending)
  - .HUM: X (Y implemented, Z pending human validation)
  - .MIX: X (Y implemented, Z pending)
  - Coherence conflicts: N [list]
```

If checks without verificability suffix (legacy) are detected, classify them retroactively using the Decision Tree in `derive-working.md`. If non-destructive (adding suffixes), execute autonomously. If destructive (renaming IDs), require human approval.

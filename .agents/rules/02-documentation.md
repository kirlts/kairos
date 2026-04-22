# Documentation & Operational Cycle

## [RULE: REPOSITORY LOCALIZATION]

The repository code, comments, and specific Kairós artifacts (`docs/MASTER-SPEC.md`, `docs/TODO.md`, etc.) belong to the Project Domain. When creating, writing to, or editing these files, the system silently detects the dominant language of the target file (or the user's project context) and strictly appends or modifies content in that same language. Leaking English governance reasoning into localized project documentation is strictly forbidden.

## Documentary Axis

All guiding project documents reside in `/docs/`. The canonical templates reside in `.agents/templates/`. When creating a new document, copy the corresponding template and populate it with the project's content.

| Document | Template | Purpose |
|---|---|---|
| `docs/MASTER-SPEC.md` | `.agents/templates/master-spec.md` | Technical and architectural specification. Everything implemented serves this file. |
| `docs/VERIFICATION.md` | `.agents/templates/verification.md` | Verification checklist and quality contract. Maintained by `/derive`. |
| `docs/TODO.md` | `.agents/templates/todo.md` | Tasks with traceability to VERIFICATION.md. Mandatory timestamps (YYYY-MM-DD HH:MM:SS). |
| `docs/MEMORY.md` | `.agents/templates/memory.md` | Transferable heuristics. Append-only. |
| `docs/USER-DECISIONS.md` | `.agents/templates/user-decisions.md` | Human decisions using an ADR 5-field format. |
| `docs/CHANGELOG.md` | `.agents/templates/changelog.md` | Versioned history. Keep a Changelog format. |
| `docs/TECHNICAL-DEBT.md` | `.agents/templates/technical-debt.md` | Ephemeral file. Self-liquidates when 100% completed. |
| `docs/TEST.md` | (generated via /test) | Testing contract. Must be read if it exists. |
| `docs/LIVING-DOCUMENT.md` | `.agents/templates/living-document.md` | Pedagogical narrative of the project. Written as a book. Agent-authored, human-directed. Read `.agents/knowledge/narrator-voice.md` for voice protocol. |

## Session Boot

1. The existence of `/docs/` and the base documents is verified. If missing, they are generated from templates.
2. The entire `docs/MEMORY.md` is read.
3. `docs/MASTER-SPEC.md` is read.
4. If `docs/TEST.md` exists, it is read.
5. `docs/LIVING-DOCUMENT.md` is **NOT** read at boot. It is lazy-loaded only when the agent is about to write to it or the user explicitly references it.

## Living Document Auto-Detection (Deferred Batch Model)

When the agent detects a human intention (per the Intention Detection heuristic in `01-operating-model.md`) and `docs/LIVING-DOCUMENT.md` exists, the agent does **not** update the Living Document immediately. Immediate updates interrupt conversational flow and consume tokens mid-task.

Instead, the agent applies a **two-phase model:**

### Phase 1: Silent Accumulation (zero token cost)

On each detected intention, the agent evaluates silently:
- Does the intention change what the project does, how it works, or why it is built this way?
- Is the change significant enough to alter the reader's understanding? A renamed variable is not significant. A new module, a changed architectural pattern, a new constraint, or a deleted feature is significant.

If significant: mark the intention as a **pending narrative update** in working memory. Do not generate prose. Do not load the Living Document. Continue without interruption.

### Phase 2: Deferred Execution at Real Breakpoints

Two real breakpoints exist. Both are already part of normal Kairos workflow — no additional human action required:

| Breakpoint | Mechanism |
|---|---|
| `/document` invoked | The Living Document update is a built-in step of Normal Mode (see `/document` workflow). This is the primary path: the Work Cycle already mandates `/document` as session closure. |
| `/narrate` invoked | Explicit synchronization. Full update with EPUB export. |

No other breakpoints exist. There is no "session end" detection, no counter-based offer, no interruption of conversational flow. The Living Document updates when the user closes their session with `/document`, which they already do.

### Update Execution (when a breakpoint fires)

1. Lazy-load `docs/LIVING-DOCUMENT.md`.
2. Load `.agents/knowledge/narrator-voice.md` and `.agents/roles/narrator.md`.
3. Identify affected chapters from the accumulated pending narrative updates.
4. Update only affected chapter sections. Full document rewrite only on `/narrate`.
5. Clear pending narrative updates from working memory.

If `docs/LIVING-DOCUMENT.md` does not exist, auto-detection is inactive. The user creates it via `/narrate`.

## Work Cycle

**BEFORE:** The task must exist in `TODO.md` prior to execution. If it affects >1 file or modifies MASTER-SPEC §4/§5, an `implementation_plan.md` artifact with a modular checklist is generated.

**DURING:** If a decision arises with multiple valid options, MASTER-SPEC §5 is referenced to tie-break. If a technical shortcut is taken, it is documented immediately.

**AFTER:** The resulting artifact is validated. The `/document` workflow executes as a mandatory closure. `TODO.md` is updated with a timestamp ONLY after successful validation and synchronization.

## Framework Hermeticity

If the current working directory is the canonical Kairós repository, the files inside `/docs/` are master templates and must NOT be polluted with session-specific logic. Ephemeral logs must go to volatile areas.

## Anti-Bias Heuristics Protocol

Before writing a heuristic into `docs/MEMORY.md`:
1. A web search is executed to verify if the pattern is generalized and scientifically sound.
2. If external confirmation exists, it is written citing the source.
3. If no confirmation exists, the system declares to the user: "I observed pattern [X]. I found no external confirmation. Do you confirm this should be memorized?"
4. If the user confirms, it is written with the tag `[Confirmed by user - no external source]`.

## Terminal Bypass

The terminal command retry limit is 1. Upon the second failure, blind direct execution is disabled; output must be redirected to a temporary file and inspected via file-reading tools.

## Workflow Fidelity

Workflows are executed exactly to the letter, step by step, including any nested workflows within them. Internal paraphrasing, skipping steps, or compressing workflow instructions is disabled. Every step of a workflow must produce a verifiable artifact before advancing to the next.

---
description: /derive - Derives an exhaustive, MECE verification checklist from any input and integrates it into the project's documentation as traceable tasks.
---

# Derive (Promise Decomposition Algorithm)

Derive a complete verification checklist from any input — text, documentation, or code — and anchor it into the project's documentary axis (MASTER-SPEC §8, TODO.md). 

## Execution Mandates (MANDATORY)

1. **Anti-Paraphrasing Directive:** You are executing a rigid mathematical process. You MUST NOT summarize steps, skip phases, or merge tables. Execute strictly and sequentially.
2. **Coverage Preservation Rule:** The final dimensionality of the checklist has NO hardcoded ceiling. It is the inescapable mathematical consequence of applying MECE principles. For EVERY valid actor detected, the MECE matrix cross-referencing naturally produces between 10 and 20 atomic checks. You are STRICTLY FORBIDDEN from merging functionalities, skipping categories, or artificially reducing the promise horizon due to procedural fatigue. N actors will organically yield N × [10 to 20] checks. Do not manipulate the count.
3. **Chain-of-Thought (CoT) Inversion Mandate:** To prevent premature convergence and lazy generation, "Reasoning precedes Resolution". In every `GATE` and every Task mapping, you MUST first explicitly type out your empirical analysis and logical friction in the Notes column. ONLY AFTER the reasoning is recorded are you permitted to issue the final verdict (checking a box or generating the final output). 
   - *ANTI-PATTERN:* Writing `[x] G1-ACTORS - Yes, I found 3 actors.` is a corrupt, backward logic flow. You must write the analysis *before* marking the status.
4. **Separation of Concerns:** 
   - Reasoning, derivation, and Gate deliberation happen ONLY inside the `[subject]_working.md` artifact.
   - The final checklist is stored cleanly in `[subject]_checklist.md`.
5. **Language Alignment:** The workflow commands are in English, but the `[subject]_working.md`, `[subject]_checklist.md`, ALL reasoning, and chat summaries MUST dynamically match the repository's predominant documentation language. Do not output English if the repo uses Spanish.
6. **Tool Safety (Friction Override):** You are FORBIDDEN from using bash (`cat << 'EOF'`) to create or edit large documents. You MUST use the native agentic filesystem tools (`write_to_file`, `multi_replace_file_content`) to prevent syntax traps and terminal hangups.

---

## STEP 1: Initialization

1. **Clean Slate Protocol:** Before generating any document, you MUST purge any existing `[subject]_working.md` or `[subject]_checklist.md` artifacts from previous executions (e.g., in `.agent/scratch/` or your artifact directory) to prevent cross-contamination.
2. Create a working document using the artifact tool (`write_to_file`). Name it `[subject]_working.md`.
3. Copy the EXACT contents of `.agent/templates/derive-working.md` into it.
4. Read the internal instructions (`<!-- INSTRUCTION: ... -->`) embedded directly in the structural headings of the template.
   - *ANTI-PATTERN:* Reading the user's initial prompt and outputting a summarized checklist directly in the chat without instantiating the working document or reading the template. This skips the entire methodology.

## STEP 2: The Core Loop (Phases 0 to 5)

Within `[subject]_working.md`, process Phase 0 through Phase 5 sequentially.

- **The Anchor Rule:** Write `<!-- CHECKPOINT: Phase [N] started -->` precisely when you begin a new phase block.
- **Tool-Level Pacing Mandate (Anti-One-Shot):** Agents fail this workflow when they attempt to generate Phases 0-5 in a single file-writing execution. **You are strictly FORBIDDEN from writing the entire document in one shot.** You MUST execute this iteratively:
  1. Use your internal `<thought>` to deliberate Phase N.
  2. Use a file modification tool to output ONLY Phase N and its Gate to the file.
  3. Wait. You MUST evaluate the Gate before proceeding to Phase N+1 in a SUBSEQUENT writing operation.
- **The Gate Rule (CoT Enforcement):** You MUST NOT proceed to Phase N+1 until ALL guardrails in the `⛔ GATE N` table are marked `[x]`. Record your empirical reasoning in the Reasoning column FIRST, rendering the status conditional on the logic.
- **The Halt Condition:** If any guardrail evaluates to a fundamental failure, HALT. Correct the structural gap in your internal analysis before proceeding.
   - *ANTI-PATTERN:* Parsing through Phases 0 to 5 all at once, filling all matrices, and then bulk-checking all the Gates at the very end. The algorithm strictly requires linear progression output.

## STEP 3: The Deliverable

Once GATE 5 is successfully resolved:
1. Create a new artifact named `[subject]_checklist.md`.
2. Copy the template from `.agent/templates/derive-checklist.md`.
3. Extract ONLY the final list of synthesized checks from Phase 4 and group them cleanly under each Actor. Eliminate all reasoning matrices, gate tables, or phase markers.
   - *ANTI-PATTERN:* Including traces of your logic (e.g., "Because this is an operator actor...") or retaining table formats in the clean document. `[subject]_checklist.md` must be noise-free.
4. Present the `[subject]_checklist.md` to the user in chat.

## STEP 4: Autonomous Integration

You MUST NOT ask the user for permission to integrate the checks. Upon successfully generating the `[subject]_checklist.md` artifact, immediately proceed to Step 5 and Step 6 to synchronize the project's macro-documentation autonomously.
   - *ANTI-PATTERN:* Halting execution to prompt the user with: "I have generated the checklist, would you like me to integrate it into MASTER-SPEC?". Do not break the operational flow. Integrate silently.

---

## STEP 5: Integration into MASTER-SPEC §8

1. Read `docs/MASTER-SPEC.md`. Locate `§8`.
2. **Additive Integration Protocol:** The derive algorithm exists to generate ADDITIONAL, NON-OVERLAPPING checks. If §8 already contains valid Kairós-formatted checks (`[ACTOR.CAT.NN]`), you MUST NOT delete or archive them. You must strictly APPEND your newly derived checks into the existing list, continuing the numbering sequence logically.
3. **Format-Based Legacy Archiving:** The ONLY scenario where you archive existing checks to `docs/archive/checks_LEGACY_[YYYY-MM-DD_HH-MM].md` is if they are written in an obsolete, non-taxonomic format. If archiving is required, rewrite them into the new taxonomy and append your fresh checks.
   - *ANTI-PATTERN:* Overwriting or destroying perfectly valid pre-existing checks just to "start fresh," OR suffering from No-Op Bias and skipping the addition of your new checks just because the section "looks complete." You are an additive, expanding pipeline.
4. **Current State Evaluation:** Cross-reference each newly added check with the existing codebase. If it is already fulfilled, mark exactly `✅ Implementado`. Otherwise leave it unmarked.

## STEP 6: Integration into TODO.md

Integrating checks into the TODO.md requires deep Architectural Nuance. AI models often exhibit "associative complacency" by lazily dumping massive amounts of generated checks into a single generic Task. You must prevent this.

1. Read `docs/TODO.md`. Locate or create the Epic that fits the context.
2. Group the PENDING checks (those without the implemented mark).
3. **Task Density Justification:** Create as many `[TASK-NNN]` blocks as architectural separation demands. While it is technically possible for one code task to resolve many checks, any grouping of multiple checks under a single Task MUST possess an indisputable, cohesive atomic correspondence. Do not group them merely for linguistic convenience.
   - *ANTI-PATTERN:* Generating 70 atomic checks and dumping them into 3 generic tasks like "Implement Frontend" or "Setup Database". This is semantic laziness and will cause the workflow to fail. A dense checklist requires a dense, highly specific TODO list.
4. **Traceability Engine:** EVERY generated task MUST explicitly include the field:
   `**Checks cubiertos:** [ACT.CAT.01], [ACT.CAT.02]`
5. **Final Integration Gate (Internal CoT):** Before finalizing the TODO updates, execute a reverse traceability audit: *Are 100% of the newly generated MASTER-SPEC checks covered by at least one TASK in this TODO?* The math must be flawless. No derived check can be left orphaned or unassigned.
6. Update the coverage table at the end of the `TODO.md` file (implemented vs pending counts).

**HALT. Generate summary and terminate.**

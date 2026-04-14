---
description: /checklist - Generates an exhaustive, domain-agnostic MECE verification checklist from any input. Standalone; produces an internal chat artifact that does NOT integrate into project documentation unless explicitly requested by the user.
---

# Checklist (Standalone Promise Decomposition)

Generate a complete, domain-agnostic verification checklist from any input (text, documentation, images, URLs, code, or any combination). The checklist is a self-contained deliverable. It does NOT integrate into MASTER-SPEC, TODO.md, or any project documentation. The output is an internal chat artifact; the user decides what to do with it.

## Core Constraint

The output of /checklist is an internal artifact of the conversation. The alteration of `/docs/` requires explicit instruction from the user. This workflow produces a standalone deliverable that the user may choose to save, discard, or move at their discretion.

## Execution Mandates (MANDATORY)

1. **Anti-Paraphrasing Directive:** You are executing a rigid mathematical process. You MUST NOT summarize steps, skip phases, or merge tables. Execute strictly and sequentially.
2. **Coverage Preservation Rule:** The final dimensionality of the checklist has NO hardcoded ceiling. For EVERY valid actor detected, the MECE matrix cross-referencing naturally produces at minimum 10 atomic checks per actor. You are STRICTLY FORBIDDEN from merging functionalities, skipping categories, or artificially reducing the promise horizon due to procedural fatigue. N actors will yield at minimum N × 10 checks. Do not manipulate the count.
3. **Chain-of-Thought (CoT) Inversion Mandate:** To prevent premature convergence and lazy generation, "Reasoning precedes Resolution". In every `GATE` and every deliberation table, you MUST first explicitly type out your empirical analysis and logical friction in the Reasoning column. ONLY AFTER the reasoning is recorded are you permitted to issue the verdict. 
   - *ANTI-PATTERN:* Writing `[x] G1-ACTORS - Yes, I found 3 actors.` is a corrupt, backward logic flow. You must write the full analysis *before* marking the status.
   - *ANTI-PATTERN:* Pre-filling a Status column as ✅ and then backfilling the Reasoning column with a justification that matches the pre-decided verdict. This is confirmation bias, not deliberation.
4. **Separation of Concerns:** 
   - All reasoning, derivation, and Gate deliberation happen ONLY inside `[subject]_working.md`.
   - The final checklist is stored cleanly in `[subject]_checklist.md`.
5. **Domain-Native Language:** The output language (idiom) and vocabulary are determined dynamically during Phase 0.5 (Domain Intelligence). Two distinct determinations are required:
   - **Idiom:** The human language of ALL generated content (Spanish, English, Portuguese, etc.). Resolved via the Language Resolution Cascade defined in Phase 0.5.
   - **Vocabulary:** The domain-specific terminology. The AI MUST NOT default to software/technical terminology unless the domain IS software/technical.
   Both determinations are binding for the working document, the deliverable, and any chat summaries.
6. **Tool Safety (Friction Override):** You are FORBIDDEN from using bash (`cat << 'EOF'`) to create or edit large documents. You MUST use the native agentic filesystem tools (`write_to_file`, `multi_replace_file_content`).
7. **User Sovereignty:** The user's prompt may contain explicit instructions that modify, restrict, or extend the behavior of this algorithm. These overrides are captured in Phase 0 and are binding. The ONLY immutable constraint is the 10-check-per-actor minimum; no override can reduce it.

---

## STEP 1: Initialization

1. **Clean Slate Protocol:** Purge any existing `[subject]_working.md` or `[subject]_checklist.md` artifacts from previous executions to prevent cross-contamination.
2. **Artifact Isolation Mandate:** Create the working document in the agent's artifact directory or scratch space. You are FORBIDDEN from creating working artifacts inside the project's source directories, `docs/`, or the repository root. The working document is ephemeral deliberation; it does not belong in the codebase.
3. Create the working document using the artifact tool (`write_to_file`). Name it `[subject]_working.md`.
4. Copy the EXACT contents of `.agents/templates/checklist-working.md` into it.
5. Read the internal instructions (`<!-- INSTRUCTION: ... -->`) embedded directly in the structural headings of the template.
   - *ANTI-PATTERN:* Reading the user's initial prompt and outputting a summarized checklist directly in the chat without instantiating the working document or reading the template. This skips the entire methodology and produces a low-quality output that merely "sounds exhaustive."

## STEP 2: The Core Loop (Phases 0 to 5 + Domain Intelligence)

Within `[subject]_working.md`, process Phase 0 through Phase 5 sequentially, including Phase 0.5 (Domain Intelligence) between Phase 0 and Phase 1.

- **The Anchor Rule:** Write `<!-- CHECKPOINT: Phase [N] started -->` precisely when you begin a new phase block.
- **Tool-Level Pacing Mandate (Anti-One-Shot):** You are strictly FORBIDDEN from writing the entire document in one shot. You MUST execute this iteratively:
  1. Use your internal reasoning to deliberate Phase N.
  2. Use a file modification tool to output ONLY Phase N and its Gate to the file.
  3. Wait. You MUST evaluate the Gate before proceeding to Phase N+1 in a SUBSEQUENT writing operation.
- **The Gate Rule (CoT Enforcement):** You MUST NOT proceed to Phase N+1 until ALL guardrails in the `⛔ GATE N` table are marked `[x]`. The Reasoning column MUST be populated FIRST with genuine analytical friction, not performative agreement.
- **The Halt Condition:** If any guardrail evaluates to a fundamental failure, HALT. Correct the structural gap before proceeding.
   - *ANTI-PATTERN:* Parsing through Phases 0 to 5 all at once, filling all matrices, and then bulk-checking all the Gates at the very end.
   - *ANTI-PATTERN:* Treating Gates as a formality, writing "Yes, this is correct" in every Reasoning cell without genuine interrogation of the output.

## STEP 3: The Deliverable

Once GATE 5 is successfully resolved:
1. Create a new artifact named `[subject]_checklist.md`.
2. Copy the template from `.agents/templates/checklist-output.md`.
3. Populate the header fields (Domain, Audience, Date, Source context).
4. Extract ONLY the final list of synthesized checks from Phase 4 and group them cleanly under each Actor. Eliminate all reasoning matrices, gate tables, or phase markers.
   - *ANTI-PATTERN:* Including traces of your logic (e.g., "Because this actor interacts with...") or retaining deliberation artifacts in the clean document.
   - *ANTI-PATTERN:* Rewriting or paraphrasing checks during extraction to "improve readability" or "smooth the language." The check text in the deliverable MUST be semantically identical to the synthesized check in Phase 4. Cosmetic rewording that dilutes specificity, softens falsability, or generalizes an observable action is a corruption of the algorithm's output.
5. Populate the quantitative footer with explicit per-actor counts.

## STEP 4: Self-Verification Audit (GATE 6)

This is the terminal gate. You MUST execute it AFTER generating the deliverable but BEFORE presenting it to the user.

1. Open `[subject]_checklist.md` and audit it against the invariants in GATE 6 of the working document.
2. For EACH invariant, write your empirical reasoning FIRST, then the verdict.
3. **Hard Failure Protocol:** If G6-DENSITY fails for ANY actor (any actor has <10 checks), you MUST return to Phase 2 in the working document, expand the Promise Matrix for that actor, propagate through Phases 3-4, regenerate the deliverable, and re-run GATE 6. There are NO exceptions.
4. Once all GATE 6 invariants pass, present the `[subject]_checklist.md` to the user in chat.

**HALT. Generate summary and terminate.**

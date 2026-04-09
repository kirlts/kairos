<!-- TEMPLATE START -->
# Working Document: Derive — [Subject Name]

> **GLOBAL RULES AND INVIOLABLE LIMITS**:
> 1. **MANDATORY:** You are an automaton. You will execute this PHASE BY PHASE, without skipping steps or combining them. Each Phase MUST be written in a SEPARATE file operation. You are FORBIDDEN from writing multiple phases in a single tool call.
> 2. **LANGUAGE MANDATE:** While these instructions are in English, ALL GENERATED CONTENT (Reasoning, Tables, Checks) MUST BE WRITTEN IN THE REPOSITORY'S PREDOMINANT LOCALE (e.g., Spanish).
> 3. **COVERAGE PRESERVATION RULE:** You are strictly forbidden from curtailing the check count. Generating exactly "1 check per category" is a statistical failure (Dimensionality Collapse). You MUST generate multiple specific variations, failure states, and edge cases per category. The rigorous application dictates a MINIMUM of 10 atomic checks per Actor, with NO global maximum ceiling. Do not manipulate the count.
> 4. **CHECKPOINT ANCHOR:** Before initiating any Phase, output exactly: `<!-- CHECKPOINT: Phase [N] started at [timestamp] -->`
> 5. **GATES — CoT INVERSION:** Do NOT skip any `⛔ GATE` table. You MUST write your reasoning in the `Empirical Reasoning (CoT)` column BEFORE generating the final `Status` (✅ / ❌ / ⚠️). A Status of ❌ halts the algorithm. The column order in every gate table is intentional: Reasoning FIRST, Status LAST.
>    - *ANTI-PATTERN:* Deciding the status mentally and then writing a justification that matches. This is confirmation bias. You must genuinely interrogate the output.
>    - *ANTI-PATTERN:* Writing a single sentence like "Looks good" or "Confirmed" as reasoning. Reasoning must demonstrate empirical engagement with the data.

---
## Phase 0: Input Classification & System Identity

<!-- INSTRUCTION: Extract Domain Knowledge (technical facts), Author-Provided Checks (explicit acceptance behavior provided by the human), Platform Constraints, and User Overrides. Compress the System Identity into ONE sentence answering: What it does, for whom, and why.

DISCRIMINATION TEST — Checks vs Overrides:
  Does the user's statement describe a PROPERTY of the system that can be verified (e.g., "must support 10k concurrent users")? → Author-Provided Check. It will become a verifiable check.
  Does the user's statement describe HOW THIS ALGORITHM should behave (e.g., "focus only on the frontend", "ignore the API layer")? → User Override. It modifies scope.
  If ambiguous, classify as Author-Provided Check. It is safer to generate a verifiable check from it than to absorb it silently as a scope restriction. -->

- **Text input:** [pending]
- **Code available:** [pending]
- **Documentation available:** [pending]

### Domain Knowledge
[pending or "None found"]

### Author-Provided Checks (verbatim)
[pending or "None found"]

### Platform Constraints
[pending or "None found"]

### User Overrides to this Algorithm
<!-- INSTRUCTION: If the user's prompt contains instructions that modify the algorithm's scope or behavior, capture them here VERBATIM. -->
[pending or "None — execute with default parameters"]

### System Identity
[pending]

**⛔ GATE 0**
| ID | Empirical Reasoning (CoT) | Status (✅/❌) |
|---|---|---|
| G0-IN-DOMAIN | [Write: What technical facts were extracted from the input? Is the domain knowledge sufficient to identify actors and their promises?] | ☐ |
| G0-IN-AUTHOR | [Write: Did the human provide explicit acceptance criteria or checks? List them if yes. If no, state that the algorithm will derive them.] | ☐ |
| G0-IN-PLATFORM | [Write: What platform constraints were identified? List technologies, runtimes, and environmental dependencies.] | ☐ |
| G0-TECH | [Write: Is the tech stack clearly identifiable from the input? List the primary technologies found.] | ☐ |
| G0-BENEFICIARY | [Write: Who is the primary beneficiary of this system? Can you name a concrete entity that receives value?] | ☐ |
| G0-AGNOSTIC | [Write: Is the system identity written without framework-specific jargon? Could someone unfamiliar with the codebase understand what the system does?] | ☐ |
| G0-OVERRIDES | [Write: Did the user provide scope restrictions or algorithmic overrides? If yes, list them. If no, write "None — full scope."] | ☐ |

---
## Phase 1: Actor Discovery

<!-- INSTRUCTION: Identify ALL entities that interact with, influence, or are affected by the system. Run every Discovery Probe below against the input.

CRITICAL RULES:
  - You must discover actors from the INPUT (code, docs, config), not invent plausible-sounding ones.
  - Each actor must be a distinct entity — not a synonym or subset of another.
  - An actor may satisfy multiple Discovery Probes. Do NOT force a single-probe classification.

ANTI-PATTERN: Listing only the obvious actors (e.g., only "User" and "Database"). Run ALL five probes.
ANTI-PATTERN: Stopping at exactly 3 actors because the minimum is met. Software systems typically have 4-8 distinct actors. -->

### Discovery Probes
<!-- These five questions decompose ALL possible relationships an entity can have with a software system. They are search beams, not classification labels. -->

| Probe | Question |
|---|---|
| Value reception | Who receives output, rendered content, API responses, or processed data from this system? |
| Resource provision | Who provides infrastructure, data stores, services, or configuration this system depends on? |
| State observation | Who monitors, logs, audits, or passively observes this system's state? |
| External constraint | What external dependency, runtime, specification, or platform does this system run within but cannot control? |
| Mediation | What connects, routes, or bridges between system components or between the system and its consumers? |

### Derivation
**Verbs found in input:** [pending]
**Subjects/Objects found in input:** [pending]

### Discovery Probe Results
<!-- MANDATORY: Run each probe and record what it yields BEFORE assembling the Actor List. -->
| Probe | Entities Found |
|---|---|
| Value reception | [pending — who receives output?] |
| Resource provision | [pending — who provides resources?] |
| State observation | [pending — who observes state?] |
| External constraint | [pending — what constrains the system?] |
| Mediation | [pending — what mediates or bridges?] |

### Actor List
| # | Actor | Relationship to System | Interacts with (INTERFACE / OUTPUT / BOTH) |
|---|---|---|---|
| 1 | [pending] | [pending — describe in system's terms, not probe labels] | [pending] |

**⛔ GATE 1**
| ID | Empirical Reasoning (CoT) | Status (✅/❌) |
|---|---|---|
| G1-PROBES | [Write: List what each of the 5 Discovery Probes yielded. Were any probes skipped? Did any probe yield zero entities — if so, justify why that relationship genuinely does not exist for this system.] | ☐ |
| G1-MINIMUM-ACTORS | [Write: How many actors were found? List them. Are there ≥3? If <5, list at least 3 candidate entities that were CONSIDERED and REJECTED, with the specific reason for each rejection.] | ☐ |
| G1-EXTERIOR | [Write: Did you identify at least one entity that is EXTERNAL to the system — a runtime, platform, or dependency the system cannot control?] | ☐ |
| G1-VALUE-RECEPTION | [Write: Did you identify at least one entity that receives value or output from the system?] | ☐ |
| G1-VOCABULARY | [Write: Are the actor names specific to this system's domain? Would a developer reading only the actor names understand the system's architecture?] | ☐ |

---
## Phase 2: Promise Matrix

<!-- INSTRUCTION - CATEGORY DICTIONARY
For EACH Actor above, complete the matrix based on:
- Availability (AV): The actor can access the system when requested. It arrives.
- Functionality (FN): The system performs the state change or action the actor expects.
- Correctness (CR): The output or data matches the truth/domain rules precisely.
- Integrity (IN): The state remains consistent across time/failures (no corruption).
- Resilience (RS): The system degrades gracefully or blocks the actor if abused.

Generate MULTIPLE promises per category. A single promise per category is Dimensionality Collapse. Each promise must have a concrete failure mechanism — how can this promise be broken?

ANTI-PATTERN: Writing abstract, unfalsifiable promises ("The system should work well", "Data should be correct"). Every promise must describe a specific, observable state.
ANTI-PATTERN: Generating exactly 2 promises per category across all actors to hit the minimum of 10. The minimum is a FLOOR.
ANTI-PATTERN: Copy-pasting the same promise structure across actors with minor word changes. Each actor has a UNIQUE relationship with the system. -->

### [Actor Name]
| Category | Promise | Failure Mechanism | Falsable? |
|---|---|---|---|
| Availability | [pending] | [pending] | ☐ |
| Functionality | [pending] | [pending] | ☐ |
| Correctness | [pending] | [pending] | ☐ |
| Integrity | [pending] | [pending] | ☐ |
| Resilience | [pending] | [pending] | ☐ |

<!-- Repeat this table for EACH actor independently -->

**⛔ GATE 2**
| ID | Empirical Reasoning (CoT) | Status (✅/❌) |
|---|---|---|
| G2-CELLS | [Write: Count total cells across all actors. Are there any empty or placeholder cells? List any gaps found.] | ☐ |
| G2-FALSABILITY | [Write: For each promise marked as falsable, can you articulate the YES/NO test? Pick 3 random promises and write their tests here.] | ☐ |
| G2-TAUTOLOGY-PURGE | [Write: Are any promises tautological ("X should do X")? List any found and rewrite them.] | ☐ |
| G2-THRESHOLD | [Write: Count total promises derived. Count number of actors. Calculate: Total ≥ (N_Actors × 10)? Show the math. If NO, STOP and expand the matrix before proceeding.] | ☐ |
| G2-VOCABULARY | [Write: Scan all promise text. Is the terminology consistent across actors? If one actor uses "request" and another uses "petition" for the same concept, normalize.] | ☐ |

---
## Phase 3: Observables

<!-- INSTRUCTION: For every Promise defined in Phase 2, define HOW it is observed from the OUTSIDE.
Format: Action → Expected Result
The observation must be EXTERNAL — it describes what a verifier would see, not what happens internally.

ANTI-PATTERN: Writing observables that require internal knowledge ("The database stores the value correctly"). Observables must be verifiable from the perspective of a tester or user with no access to internals. -->

| Promise Ref | Observable Action | Expected Result |
|---|---|---|
| [pending] | [pending] | [pending] |

**⛔ GATE 3**
| ID | Empirical Reasoning (CoT) | Status (✅/❌) |
|---|---|---|
| G3-COVERAGE | [Write: Count observables vs promises. Is there a 1:1 mapping? List any promises without observables.] | ☐ |
| G3-EXTERNALITY | [Write: Pick 3 random observables. Can each be verified by someone with no access to the system's internals?] | ☐ |
| G3-DETERMINISM | [Write: Pick 3 random observables. Would two independent verifiers arrive at the same YES/NO result?] | ☐ |
| G3-VOCABULARY | [Write: Scan all observable descriptions. Is the terminology consistent with Phase 2? Are internal implementation details leaking into observables?] | ☐ |

---
## Phase 4: Synthesis & Verification Checklist (Working Draft)

<!-- INSTRUCTION: Assemble checks with taxonomy [ACTOR.CAT.NN].
  - ACTOR: abbreviated actor name, 3-5 uppercase characters, derived from the first syllable or initials.
  - CAT: category abbreviation (AV, FN, CR, IN, RS), 2 uppercase characters.
  - NN: two-digit sequential number, zero-padded (01, 02...).
  Define all abbreviations ONCE in the key table below, then reuse consistently.

Rules:
  - Compound checks MUST be decomposed. One action, one result.
  - Each check must be self-contained — understandable without reading the working document.

ANTI-PATTERN: Writing checks that require context from the working document to be understood.
ANTI-PATTERN: Merging two observables into one check to reduce count.
ANTI-PATTERN: Using inconsistent abbreviations for the same actor across different checks. -->

### Abbreviation Key
| Full Name | Abbreviation | Type |
|---|---|---|
| [pending] | [pending] | Actor / Category |

### Checklist Draft
- `[ACTOR.CAT.NN]` Action → Expected Result. *(Promise: ...)*

### Atomicity Verification
<!-- INSTRUCTION: For EACH check, verify three properties independently. Do NOT batch-verify.

ANTI-PATTERN: Marking all checks as ATOMIC without examining each one. The verdict column must be filled ONLY after the three boolean columns are evaluated. -->

| Check ID | Singular Action? | Singular Result? | Implicit Compound? | Verdict (ATOMIC/COMPOUND) |
|---|---|---|---|---|
| [ID] | [Write: Does this check contain exactly ONE verb/action?] | [Write: Does this check describe exactly ONE observable outcome?] | [Write: Could this check be split into two checks that verify different things?] | [pending — fill ONLY after the three columns] |

**⛔ GATE 4**
| ID | Empirical Reasoning (CoT) | Status (✅/❌) |
|---|---|---|
| G4-ATOMICITY | [Write: How many checks were marked COMPOUND? Were ALL of them decomposed? List the original compound checks and their decompositions.] | ☐ |
| G4-DENSITY-PER-ACTOR | [Write: For EACH actor, count the checks. List: Actor1=N, Actor2=N, Actor3=N... Does EVERY actor have ≥10? If ANY actor has <10, STOP. Return to Phase 2 and expand that actor's promise matrix. Do NOT proceed.] | ☐ |

---
## Phase 5: MECE Audit (Mutually Exclusive, Collectively Exhaustive)

<!-- INSTRUCTION: 
ME Audit: Compare checks that appear similar. Are they verifying exactly the same state, or different facets?
CE Audit: Are there gaps in coverage? Does the matrix lack tests for edge cases, failure modes, or boundary conditions?

ANTI-PATTERN: Declaring "no overlaps found" without examining specific pairs. You must list the pairs you compared.
ANTI-PATTERN: Declaring "no gaps found" without examining the coverage matrix cell by cell. -->

### ME Pairs Examined
| Pair (ID-a ↔ ID-b) | Same Promise? | Resolution |
|---|---|---|
| [pending — list SPECIFIC pairs you compared] | [Write: What do they share? What differentiates them?] | [pending — fill ONLY after analyzing the pair] |

### Coverage Matrix
| Actor | AV | FN | CR | IN | RS |
|---|---|---|---|---|---|
| [name] | [count] | [count] | [count] | [count] | [count] |

**⛔ GATE 5**
| ID | Empirical Reasoning (CoT) | Status (✅/❌) |
|---|---|---|
| G5-ME-PAIRS | [Write: How many pairs did you examine? List the most ambiguous pair and explain why they are or are not duplicates.] | ☐ |
| G5-CE-MATRIX | [Write: Examine the coverage matrix. Are there any cells with 0 checks? If so, is the gap justified or does it indicate a missing promise?] | ☐ |
| G5-CE-NO-GAPS | [Write: Consider the system holistically. Is there any requirement, constraint, or behavior mentioned in the input that is NOT covered by any check?] | ☐ |
| G5-AUDIT-DELTA | [Write: Did this audit result in any additions, removals, or modifications? List them.] | ☐ |
| G5-POST-MECE-DENSITY | [Write: After all ME removals from this audit, re-count checks per actor. List: Actor1=N, Actor2=N... Does EVERY actor still have ≥10? If ANY actor dropped below 10 due to duplicate removal, STOP. Return to Phase 2, generate replacement promises for the removed duplicates, and propagate through Phases 3-4 before proceeding.] | ☐ |

---
## GATE 6: Self-Verification Audit (Terminal)

<!-- INSTRUCTION: This is the terminal gate. You are auditing your OWN output against immutable invariants.

EXECUTION SEQUENCE (MANDATORY):
  1. You MUST have already generated `[subject]_checklist.md` using the output template BEFORE reaching this gate.
  2. STOP writing the working document.
  3. Open `[subject]_checklist.md` — the DELIVERABLE, not the working draft above.
  4. Count its actual contents: actors, checks per actor, terminology used.
  5. Record your findings below.
  6. If any invariant fails, remediate before proceeding to integration.
  This gate audits the DELIVERABLE, not the working document.

ANTI-PATTERN: Treating this as a rubber-stamp. If you find a failure, you MUST remediate — not rationalize.
ANTI-PATTERN: Writing "All actors have ≥10 checks" without listing the actual counts. Show your work.
ANTI-PATTERN: Filling this gate by referencing Phase 4 counts instead of counting the deliverable directly. The deliverable is the source of truth. -->

| ID | Invariant | Empirical Reasoning (CoT) | Status (✅/❌) |
|---|---|---|---|
| G6-ACTOR-COUNT | ≥3 actors identified | [Write: List every actor in the deliverable. Count them.] | ☐ |
| G6-DENSITY | ≥10 checks per actor (NO EXCEPTIONS) | [Write: For EACH actor, count the checks in the deliverable. Format: Actor1=N, Actor2=N... If ANY <10, status is ❌ and you MUST return to Phase 2.] | ☐ |
| G6-ATOMICITY | Every check has ONE action and ONE result | [Write: Sample 5 random checks. For each, identify the single action and single result. Flag any that contain conjunctions (and/or/also).] | ☐ |
| G6-MECE | No duplicates, no gaps | [Write: Were all ME pairs resolved? Were all CE gaps closed?] | ☐ |
| G6-FALSABILITY | Every check is binary (pass/fail) | [Write: Pick 3 random checks. For each, articulate the exact binary test. If any check requires subjective interpretation, flag it.] | ☐ |
| G6-ALGORITHM | All 6 phases and 7 gates executed sequentially | [Write: List each checkpoint anchor found in this document. Count: Phase 0, Phase 1, Phase 2, Phase 3, Phase 4, Phase 5 = 6 phases. Gate 0, Gate 1, Gate 2, Gate 3, Gate 4, Gate 5, Gate 6 = 7 gates.] | ☐ |
| G6-OVERRIDES | All user overrides respected | [Write: List each override from Phase 0. For each, confirm how it was applied. If no overrides, write "No overrides specified."] | ☐ |

**HARD FAILURE PROTOCOL:** If G6-DENSITY is ❌, return to Phase 2, expand the deficient actor(s), propagate through Phases 3-5, regenerate the deliverable, and re-execute GATE 6.

<!-- TEMPLATE END -->

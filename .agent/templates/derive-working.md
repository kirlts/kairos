<!-- TEMPLATE START -->
# Working Document: Derive — [Subject Name]

> **GLOBAL RULES AND INVIOLABLE LIMITS**:
> 1. **MANDATORY:** You are an automaton. You will execute this PHASE BY PHASE, without skipping steps or combining them.
> 2. **LANGUAGE MANDATE:** While these instructions are in English, ALL GENERATED CONTENT (Reasoning, Tables, Checks) MUST BE WRITTEN IN THE REPOSITORY'S PREDOMINANT LOCALE (e.g., Spanish).
> 3. **COVERAGE PRESERVATION RULE:** You are strictly forbidden from curtailing the check count. Generating exactly "1 check per category" is a statistical failure (Dimensionality Collapse). You MUST generate multiple specific variations, failure states, and edge cases per category. The rigorous application dictates between 10 and 20 atomic checks per Actor, with NO global maximum ceiling.
> 4. **CHECKPOINT ANCHOR:** Before initiating any Phase, output exactly: `<!-- CHECKPOINT: Phase [N] started at [timestamp] -->`
> 5. **GATES:** Do NOT skip any `⛔ GATE` table. Due to left-to-right generation, you MUST write your reasoning in the `Reasoning` column BEFORE generating the final `Status` (✅ / ❌ / ⚠️). A status of ❌ halts the algorithm.

---
## Phase 0: Input Classification & System Identity

<!-- INSTRUCTION: Extract Domain Knowledge (technical facts), Author-Provided Checks (explicit acceptance behavior provided by the human), and Platform Constraints. Compress the System Identity into ONE sentence answering: What it does, for whom, and why. -->

- **Text input:** [pending]
- **Code available:** [pending]
- **Documentation available:** [pending]

### Domain Knowledge
[pending or "None found"]

### Author-Provided Checks (verbatim)
[pending or "None found"]

### Platform Constraints
[pending or "None found"]

### System Identity
[pending]

**⛔ GATE 0**
| ID | Empirical Reasoning (CoT) | Status (✅/❌) |
|---|---|---|
| G0-IN-DOMAIN | [pending] | ☐ |
| G0-IN-AUTHOR | [pending] | ☐ |
| G0-IN-PLATFORM | [pending] | ☐ |
| G0-TECH | [pending] | ☐ |
| G0-BENEFICIARY | [pending] | ☐ |
| G0-AGNOSTIC | [pending] | ☐ |

---
## Phase 1: Actor Discovery

### Derivation
**Verbs:** [pending]
**Subjects/Objects:** [pending]

### Actor List
<!-- INSTRUCTION - ACTOR TAXONOMY
| Type | Definition | Test |
|---|---|---|
| Consumer | Beneficiary extracting value. | Ask: "Does it extract value?" (Human, Service, API) |
| Operator | Keeps the system alive. | Ask: "Does it provide resources?" (Database, Network, Environment) |
| Observer | Monitors the truth. | Ask: "Does it audit state passively?" (Logs, Metrics) |
| Dependency| Sits beneath the system. | Ask: "If it fails, does the system fail?" (DOM, K8s, Browser) |
-->
| # | Actor | Type | Interacts with (INTERFACE / OUTPUT / BOTH) |
|---|---|---|---|
| 1 | [pending] | [pending] | [pending] |

**⛔ GATE 1**
| ID | Empirical Reasoning (CoT) | Status (✅/❌) |
|---|---|---|
| G1-DERIVATION | [pending] | ☐ |
| G1-MINIMUM-ACTORS | [pending] | ☐ |
| G1-EXTERIOR | [pending] | ☐ |
| G1-CONSUMER-CHECK | [pending] | ☐ |

---
## Phase 2: Promise Matrix

<!-- INSTRUCTION - CATEGORY DICTIONARY
For EACH Actor above, complete the matrix based on:
- Availability (AV): The actor can access the system when requested. It arrives.
- Functionality (FN): The system performs the state change or action the actor expects.
- Correctness (CR): The output or data matches the truth/domain rules precisely.
- Integrity (IN): The state remains consistent across time/failures (no corruption).
- Resilience (RS): The system degrades gracefully or blocks the actor if abused.
DO NOT COLLAPSE EXHAUSTIVENESS. Generate MULTIPLE promises per category if necessary to cover edge cases and fail states. DO NOT SKIP CELLS.
-->

### [Actor Name] ([Type])
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
| G2-CELLS | [pending] | ☐ |
| G2-FALSABILITY | [pending] | ☐ |
| G2-TAUTOLOGY-PURGE | [pending] | ☐ |
| G2-THRESHOLD | Total Promises Derived >= (N_Actors * 10)? If NO, STOP processing and expand matrix. | ☐ |

---
## Phase 3: Observables

<!-- INSTRUCTION: For every Promise defined in Phase 2, define HOW it is observed from the OUTSIDE. 
Format: Action -> Expected Result -->

| Promise Ref | Observable Action | Expected Result |
|---|---|---|
| [Actor-AV] | [pending] | [pending] |

**⛔ GATE 3**
| ID | Empirical Reasoning (CoT) | Status (✅/❌) |
|---|---|---|
| G3-COVERAGE | [pending] | ☐ |
| G3-EXTERNALITY| [pending] | ☐ |
| G3-DETERMINISM| [pending] | ☐ |

---
## Phase 4: Synthesis & Verification Checklist (Working Draft)

<!-- INSTRUCTION: Assemble checks with taxonomy [ACTOR.CAT.NNN]. 
Rule: Compound checks must be decomposed. Action must be singular. -->

### Checklist Draft
- `[ACTOR-CATEGORY-NNN]` Action → Expected Result. *(Promise: ...)*

### Atomicity Verification
| Check ID | Singular Action | Singular Result | Implicit Diagnosis | Verdict (ATOMIC/COMPOUND) |
|---|---|---|---|---|
| [ID] | ☐ | ☐ | ☐ | [pending] |

**⛔ GATE 4**
| ID | Empirical Reasoning (CoT) | Status (✅/❌) |
|---|---|---|
| G4-ATOMICITY | [pending] | ☐ |
| G4-DENSITY-PER-ACTOR | Did MECE cross-referencing organically produce >= 10 verifiable atomized checks per actor? If NO, STOP processing and decompose further. | ☐ |

---
## Phase 5: MECE Audit (Mutually Exclusive, Collectively Exhaustive)

<!-- INSTRUCTION: 
ME Audit: Compare similar checks. Are they verifying exactly the same state?
CE Audit: Does the matrix lack tests for edge cases or edge-actors? -->

### ME Pairs Examined
| Pair (ID-a ↔ ID-b) | Same Promise? | Resolution |
|---|---|---|
| [pending] | YES/NO | Kept both / Removed [which] |

### Coverage Matrix
| Actor | AV | FN | CR | IN | RS |
|---|---|---|---|---|---|
| [name] | X | X | X | X | X |

**⛔ GATE 5**
| ID | Empirical Reasoning (CoT) | Status (✅/❌) |
|---|---|---|
| G5-ME-PAIRS | [pending] | ☐ |
| G5-CE-MATRIX | [pending] | ☐ |
| G5-CE-NO-GAPS | [pending] | ☐ |
| G5-AUDIT-DELTA | [pending] | ☐ |
<!-- TEMPLATE END -->

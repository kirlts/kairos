# Project Constraints

# Project Constraints Execution

The operational environment enforces strict compliance with project-specific constraints. These constraints are intentionally isolated from the governance framework to survive systemic updates (`/update`). 

## Core Protocol

1. Project constraints exist exclusively within the final project documentation, specifically `docs/MASTER-SPEC.md` section §4 (Límites Intransgredibles) and §5 (Trade-offs).
2. Prior to executing any architectural, structural, or strategic decision, the system reads and evaluates `docs/MASTER-SPEC.md` §4 and §5.
3. System outputs and proposals are strictly prohibited from violating the constraints defined in the MASTER-SPEC.
4. If a new constraint is discovered during execution, the system must append it directly to `docs/MASTER-SPEC.md` (or the corresponding project documentation), never to this rule file.

This explicit separation of concerns guarantees that project knowledge remains intact during Kairós version transitions.

# Operating Model

## Zero Delays

The temporal cost of excellence is negligible. Estimations anchored to biological human limits are a model bias, not an environmental constraint. The quality standard of a senior engineer with infinite time is the floor for any delivery.

## Aptitude Subsets

| Subset | Domain | Examples |
|---|---|---|
| `LLM` AI Dominates | Scaffolding generation, isolated bug resolution, parsing, mechanical refactoring, pure function unit testing, format consistency | AI closes autonomously yielding a timestamp |
| `HUM` Human Irreplaceable | Long-term architectural design, validating whether the code solves the real-world problem, aesthetic and perceptual judgment, strategic coherence, intentional technical debt, irreversible trade-offs | AI delivers but DOES NOT close without user confirmation |
| `MIX` AI Pre-processes, Human Validates | Code review, effort estimation, integration testing, user-facing documentation | AI pre-verifies and declares which dimensions require validation |

## Subset Declaration

When presenting a block of work, the agent classifies each deliverable:

- **Subset `LLM`:** "Executed with confidence. Automated verification: [result]."
- **Subset `HUM`:** "Requires your validation regarding: [specific dimensions]."
- **Subset `MIX`:** "Pre-verified. Pending your validation regarding: [dimensions]."

## Conditioned Closure Rule

Tasks containing exclusively `.LLM` checks are closed autonomously. Tasks with at least one `.HUM` or `.MIX` check require explicit user confirmation before closure.

## Deliverable Integrity

Mocked data and corporate-motivational syndrome copy are severe categories of technical debt. A deliverable with simulated data or generic copy like "Unlock your potential", "Seamless experience", or "Cutting-edge solution" is an incomplete deliverable. Every feature consumes the project's real data source. Copy is derived from the user's domain intent, not statistically probable placeholders. If a mock or placeholder is strictly necessary, an explicit purge task is registered in TODO.md; the task remains open until the mock is purged.

## Browser Subagent

The browser subagent is disabled unless the user explicitly requests it. Web searches, visual validations, and browser actions are performed exclusively under direct user instruction.

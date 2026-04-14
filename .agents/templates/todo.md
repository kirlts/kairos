# TODO: [Nombre del Proyecto] v0.1.0

> Trazabilidad directa: cada tarea referencia checks del `MASTER-SPEC.md` §8.

## Leyenda de Símbolos Kairós

| Símbolo | Significado |
|---|---|
| 🤖 | Check verificable por IA/herramienta automatizada |
| 🧑 | Check que requiere verificación humana |
| 🤖🧑 | Check pre-verificable por IA, validación final humana |
| ⏳ | En progreso |
| 🔲 | Pendiente |
| 🚨 | Bloqueo crítico |

---

## [EPIC-001] [Nombre descriptivo de la épica]

> Ref: MASTER-SPEC §[N]

### [TASK-001] [Nombre descriptivo de la tarea]

> Ref: MASTER-SPEC §[N]

**Checks cubiertos:** `[ACTOR.CAT.NN.LLM]`, `[ACTOR.CAT.NN.HUM]`

- [ ] [Subtarea atómica 1]
- [ ] [Subtarea atómica 2]

<!-- 
FORMATO DE TIMESTAMP AL COMPLETAR:
- [x] Subtarea completada `YYYY-MM-DD HH:MM:SS`

REGLA DE CIERRE CONDICIONADA AL TIPO DE VERIFICADOR:
- Tareas que contengan EXCLUSIVAMENTE checks .LLM: la IA puede cerrar autónomamente con timestamp.
  Formato: - [x] [TASK-NNN]; YYYY-MM-DD HH:MM [🤖 Verificado por herramienta]
- Tareas que contengan AL MENOS UN check .HUM o .MIX: la IA NO PUEDE marcar como completada
  sin confirmación explícita del usuario.
  Formato: - [x] [TASK-NNN]; YYYY-MM-DD HH:MM [🧑 Verificado por usuario]
  Formato: - [x] [TASK-NNN]; YYYY-MM-DD HH:MM [🤖🧑 Pre-verificado + confirmado por usuario]

REGLAS GENERALES:
- Toda TASK debe tener el campo "Checks cubiertos:" con IDs de MASTER-SPEC §8 (incluyendo sufijo .LLM/.HUM/.MIX).
- Si la tarea es de gobernanza pura: **Checks cubiertos:** Gobernanza transversal
- Timestamps son obligatorios al marcar una subtarea como completada.
- Está PROHIBIDO usar términos genéricos como "activo" o dejar el campo vacío.
-->

---

## Resumen de cobertura general

| Epic | Tasks | Estado | 🤖 .LLM | 🧑 .HUM | 🤖🧑 .MIX | Total Checks |
| --- | --- | --- | --- | --- | --- | --- |
| EPIC-001 | TASK-001 a NNN | ☐ En progreso | [N] | [N] | [N] | [N] |

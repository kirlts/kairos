# Kairós

> Sistema de gobernanza para desarrollo asistido por IA. v3.0.0

## Qué es

Un framework que vive dentro de tu repositorio (`.agents/`) y estructura la interacción entre el desarrollador y su IA de codificación. Funciona con Cursor, Windsurf, Claude Code, Gemini CLI, o cualquier IDE que soporte agentes con acceso al filesystem.

## Qué problema ataca

Sin gobernanza, una IA de codificación:

- Genera código genérico que resuelve lo inmediato y acumula deuda técnica.
- Pierde contexto entre sesiones. Repite errores, contradice decisiones previas.
- Acepta solicitudes sin cuestionarlas, incluso cuando ignoran complejidad inherente.
- Produce interfaces con la misma paleta, tipografía y layout que toda otra IA (AI Smell).
- Ofrece versiones "prudentes" cuando puede generar la versión completa.

El framework consiste en reglas, workflows y protocolos que corrigen estos comportamientos.

## Estructura

```
.agents/
├── rules/          # Cómo se comporta la IA (always-on)
├── workflows/      # Flujos invocables (/derive, /test, /fix, etc.)
├── skills/         # Protocolos que se activan por contexto
├── knowledge/      # Material de referencia bajo demanda
└── templates/      # Plantillas para docs del proyecto

docs/
├── MASTER-SPEC.md  # Qué se construye, para quién, por qué, y cómo
├── TODO.md         # Tareas con trazabilidad a la especificación
├── MEMORY.md       # Heurísticas transferibles entre sesiones
├── USER-DECISIONS.md # Registro de decisiones del usuario con su razón
└── CHANGELOG.md    # Historial de cambios
```

## Comandos

| Comando | Función |
|---|---|
| `/derive` | Generar checklist de verificación exhaustivo, integrado con MASTER-SPEC y TODO |
| `/checklist` | Generar checklist standalone para cualquier input (documentos, postulaciones, planes) |
| `/test` | Definir estrategia de testing o ejecutar tests existentes |
| `/fix` | Diagnosticar y resolver deuda técnica |
| `/document` | Sincronizar documentación con el estado real del código |
| `/update` | Actualizar Kairós a la última versión |
| `/release` | Generar nueva versión del framework (solo repo canónico) |

## Fundamentos técnicos

El framework aplica patrones de adherencia extraídos de investigación empírica (corte: abril 2026). Cada patrón tiene un efecto medido y una implementación concreta.

| Patrón | Efecto medido | Implementación en Kairós | Fuente |
|---|---|---|---|
| Declarative System Framing | -81% varianza de adherencia entre idiomas | Constraints redactadas como hechos del entorno, no como comandos | Imperative Interference: Social Register Shapes Instruction Topology in LLMs (arXiv 2603.25015) |
| Tabular Superiority | +40.29% precisión en lógica condicional | Subconjuntos 🤖/🧑/🤖🧑, Leyes de Armonía, LNC | Better Think with Tables: Tabular Structures Enhance LLM Comprehension (arXiv 2412.17189) |
| Primacy/Recency Anchoring | Mitiga Factorial Dead Zone | Working templates (23K, 33K) duplican constraints en ambos extremos | Lost in the Middle: How Language Models Use Long Contexts (Stanford CS, arXiv 2307.03172); Lost in the Middle at Birth: An Exact Theory of Transformer Position Bias (arXiv 2603.10123) |
| State Isolation | Mitiga -39% degradación multi-turno | Ciclo BEFORE/DURING/AFTER, artefactos con estado aislado | LLMs Get Lost In Multi-Turn Conversation (OpenReview, NeurIPS) |
| Positive Directive Mapping | -50% drift comportamental | Constraints definen espacio permitido; prohibiciones para failure modes catastróficos | ClawSafety: "Safe" LLMs, Unsafe Agents (arXiv 2604.01438) |
| Traceable Identifiers | 80.4% F1 en cadenas lógicas multi-paso | Taxonomía `[ACTOR.CAT.NN.VER]`, IDs `[R-NNN]`, `[LNC-NN]` | Evaluating the Use of LLMs for Documentation to Code Traceability (ResearchGate) |

### AI Smell

Cuando un LLM genera interfaces sin restricciones de diseño humanas, converge hacia valores paramétricos dominantes en su distribución de entrenamiento. Púrpura-azul (#6366F1), Inter/system-ui, layout simétrico, cards con `rounded-xl` y `p-6`.

Mitigación:

1. **Lista Negra de Convergencia (LNC):** 10 vectores con valores exactos, contexto de aparición y desvío requerido (`.agents/knowledge/ai-smell-registry.md`).
2. **Desvío justificado:** La coincidencia con LNC no se prohíbe; la coincidencia sin justificación sí.
3. **Gate visual de 3 pasos:** Anti-Slop mecánico, Armonía Intencional, Integridad Contextual.

**Fuente:** Síntesis de hallazgos sobre convergencia paramétrica en interfaces generadas por IA (2025-2026). Patrones de detección de escritura IA: Wikipedia, "Signs of AI Writing".

### Sesgo de compresión

Los LLMs subestiman su capacidad de ejecución. El estudio Anthropic sobre estimación JIRA (2025, dataset JOSSE: proyectos Apache, JBoss, Spring) mostró que Claude obtuvo ρ=0.44 al estimar esfuerzo de desarrollo, inferior a humanos (ρ=0.50). La regla operativa del framework corrige esto: «El costo temporal de la excelencia es depreciable. Las estimaciones ancladas a biología humana son un sesgo del modelo.»

**Fuentes:** Estudio Anthropic de estimación JIRA (JOSSE dataset, 2025). SWE-bench Verified (resolución ~80% en repos de código abierto, abril 2026). Greptile, "State of AI Coding 2025-2026" (mediana de PR: 57→110 líneas, +93% en 12 meses).

## Adopción

**Proyecto nuevo:** clonar este repositorio y empezar a desarrollar. La gobernanza se aplica automáticamente.

**Proyecto existente:** copiar `.agents/`, `kairos-version.txt` y `README-KAIROS.md` al repositorio. Ejecutar `/document` para que la IA establezca el eje documental.

## Actualización

`/update` en cualquier sesión. Compara la versión local con la publicada, propone diffs, no toca la documentación del proyecto.

# Kairós: Referencia Rápida

> v3.0.0

Este archivo es la referencia operativa del framework de gobernanza, no documentación del proyecto.

## Estructura

| Carpeta | Función |
|---|---|
| `.agents/rules/` | Reglas de comportamiento (always-on y model-decision) |
| `.agents/workflows/` | Flujos invocables con comandos |
| `.agents/skills/` | Protocolos automáticos por contexto |
| `.agents/knowledge/` | Material de referencia bajo demanda |
| `.agents/templates/` | Plantillas para documentos del proyecto |
| `docs/` | MASTER-SPEC, TODO, MEMORY, CHANGELOG, USER-DECISIONS, TEST |

## Comandos

| Comando | Función |
|---|---|
| `/derive` | Checklist exhaustivo desde código o documentación, integrado con MASTER-SPEC y TODO |
| `/checklist` | Checklist desde cualquier input, standalone, agnóstico al dominio |
| `/test` | Definir o ejecutar estrategia de testing |
| `/fix` | Diagnosticar y resolver deuda técnica |
| `/document` | Sincronizar documentación con el estado real del proyecto |
| `/update` | Actualizar gobernanza a la última versión |
| `/release` | Generar nueva versión del framework (solo repo canónico) |

## Patrones de adherencia aplicados

| Patrón | Efecto medido | Implementación | Fuente |
|---|---|---|---|
| Declarative System Framing | -81% varianza de adherencia entre idiomas | Constraints como hechos del entorno | arXiv 2603.25015 (Imperative Interference) |
| Tabular Superiority | +40.29% precisión en lógica condicional | Subconjuntos 🤖/🧑/🤖🧑, LNC, Leyes de Armonía | arXiv 2412.17189 (Better Think with Tables) |
| Primacy/Recency Anchoring | Mitiga Factorial Dead Zone | Working templates duplican constraints en extremos | Stanford CS (Lost in the Middle); arXiv 2603.10123 |
| State Isolation | Mitiga -39% degradación multi-turno | Ciclo BEFORE/DURING/AFTER, artefactos aislados | OpenReview (LLMs Get Lost In Multi-Turn Conversation) |
| Positive Directive Mapping | -50% drift comportamental | Espacio permitido explícito; prohibiciones para failures catastróficos | arXiv 2604.01438 (ClawSafety) |
| Traceable Identifiers | 80.4% F1 multi-paso | `[ACTOR.CAT.NN.VER]`, `[R-NNN]`, `[LNC-NN]` | ResearchGate (LLMs for Doc-to-Code Traceability) |
| Axiomatic Pre-Contextualization | Previene -6.81% degradación | Meta-instrucciones preceden a datos que gobiernan | arXiv 2412.17189 (input design studies) |
| Modular Context Partitioning | Previene degradación >32K tokens | rules (always-on), skills (on-demand), knowledge (@reference) | arXiv 2601.10343 (OctoBench); arXiv 2603.16021 (Folder Structure as Agent Architecture) |

## AI Smell

Convergencia paramétrica de LLMs en interfaces visuales.

| Mecanismo | Ubicación |
|---|---|
| Lista Negra de Convergencia (10 vectores con valores, contexto y desvío) | `.agents/knowledge/ai-smell-registry.md` |
| Regla de desvío justificado | `.agents/rules/04-aesthetics.md` |
| Gate visual de 3 pasos (Anti-Slop, Armonía, Integridad) | `.agents/skills/protocolo-excelencia-visual/SKILL.md` |

**Fuente:** Síntesis de patrones de convergencia en interfaces generadas por IA (2025-2026). Wikipedia, "Signs of AI Writing".

## Sesgo de compresión

Los LLMs subestiman su capacidad de ejecución. El estudio Anthropic sobre estimación JIRA (JOSSE dataset, 2025): ρ=0.44 vs. humanos ρ=0.50. La regla operativa del framework corrige esto: el costo temporal de la excelencia es depreciable.

**Fuentes:** Estudio Anthropic de estimación JIRA (JOSSE dataset, 2025). SWE-bench Verified (~80%, abril 2026). Greptile, "State of AI Coding 2025-2026".

## Detección de escritura IA

| Categoría | Patrones | Mecanismo |
|---|---|---|
| Muletillas RLHF | «Cabe destacar que», «Es importante señalar» | Gate anti-slop en workflows + 00-behavior.md |
| Paralelismos negativos | «not just X, but Y», «no solo X, sino Y» | Gate 7 en working templates |
| Copy corporativo | «cutting-edge», «seamless», «innovative» | Detección en `/document` + Gate 7 |
| Positividad servil | «¡Excelente pregunta!», «Gran observación» | 00-behavior.md |
| Em dashes | Cualquier instancia de (—) | Gate 7, zero tolerance |

**Fuentes:** Wikipedia, "Signs of AI Writing". Detección heurística derivada de ai-smell-registry.md.

## Actualización

`/update` compara versión local con la publicada, propone diffs, no toca docs del proyecto.

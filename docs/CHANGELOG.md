# CHANGELOG

> Todas las notas de cambios para este proyecto serán documentadas en este archivo.
> Formato basado en [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

## [v3.0.1] - 2026-04-14

### Added
- Sección "Rol del agente" en `00-behavior.md`: declaración explícita de que la IA es el operador autónomo del framework.
- Sección "Asignación de dominio por diseño" en ambos READMEs: diferenciador arquitectónico 🤖/🧑/🤖🧑 con fuentes empíricas.
- Sección "Erradicación del sesgo de compresión (Falsa modestia)" en ambos READMEs: documentación del principio de ejecución volumétrica sin límites biológicos.

### Changed
- READMEs actualizados: Antigravity IDE como entorno optimizado; Cursor, Claude Code, Windsurf como compatibilidad teórica no probada.
- Workflow `/release` ya no solicita confirmación explícita. El triaje es informativo y la generación de artefactos procede de inmediato.

## [v3.0.0] - 2026-04-14

### Added
- Nueva estructura taxonómica basada en el directorio `.agents/` en lugar de `.agent/`.
- Módulo aislando la Constitución formal en `knowledge/constitution.md`.
- Módulo aislando las variables paramétricas visuales en `knowledge/ai-smell-registry.md`.
- Regla independiente operativa `00-behavior.md` para el control exhaustivo de "AI slop" en el lenguaje o prosa.

### Changed
- Refactorización de reglas abstractas complejas `00` al `07` a un sistema más explícito y acotado (00-04).
- Purgado de toda personificación o referenciación pasiva (Kairós interactuando con intencionalidad). Eliminados modismos como "Kratos", "Khaos" y "campo relacional" transicionando a vocabulario neutral.
- Se consolidó la referenciación sobre Papers (como "ClawSafety" o "Lost in the Middle") de forma aséptica y real.

### Removed
- Infraestructura antigua dependiente del path `.agent/`.
- Reglas estructurales como `05-protocolo-terminal-bypass.md` reabsorbidas en el nuevo manifiesto consolidado de workflows orgánicos.

## [v2.2.0] - 2026-04-09

### Added
- Workflow `/checklist`: generación de checklists de verificación exhaustivos, agnósticos al dominio, standalone.
- Templates `checklist-working.md` y `checklist-output.md` para el workflow `/checklist`.
- GATE 6 (Self-Verification Audit) como gate terminal post-deliverable en `/derive`.
- Discovery Probes: sistema de descubrimiento de actores que reemplaza la taxonomía rígida de 4 tipos.
- Abbreviation Key obligatoria en Phase 4 de `/derive` y `/checklist`.
- Summary table cuantitativa en templates de output (`derive-checklist.md`, `checklist-output.md`).
- Paso 4.3 (Documentación Pública), 4.4 (Integridad de Plantillas) y Paso 5 (Verificación Final) en workflow `/release`.
- Guardrails de vocabulario (G2-VOCABULARY, G3-VOCABULARY) en `/derive`.
- G5-POST-MECE-DENSITY en `/derive` y `/checklist` (re-conteo post-poda).

### Changed
- Refactorización profunda de `derive-working.md`: 164 → 263 líneas (backport de 11 mejoras desde `/checklist`).
- Global rules de `/derive` y `/checklist` incluyen anti-one-shot y anti-patterns de CoT.
- Todos los guardrails de GATE 0-5 en `/derive` reescritos con instrucciones `[Write: ...]` prescriptivas.
- Workflow `/derive` renumerado a 7 Steps (GATE 6 insertado como Step 4).
- Workflow `/release` reescrito con verificación de READMEs, integridad de templates y consistencia de versión.
- READMEs reescritos para accesibilidad y claridad.

### Removed
- Actor Type Taxonomy con tipos hardcodeados (Consumer/Operator/Observer/Dependency) y ejemplos sesgantes (DOM, K8s, Browser) en `/derive`. Reemplazado por Discovery Probes.

## [v2.1.1] - 2026-04-08

### Changed
- Actualización de reglas operativas (`06-kairos-norte-estetico`, `07-desarrollo-end-to-end`) para integrar directivas semánticas contra interfaces genéricas ("AI Slop") basadas en intencionalidad, accesibilidad y datos reales.
- Expansión de `protocolo-excelencia-visual` con el Filtro Cognitivo interno de "Test de Intercambiabilidad".
## [v2.1.0] - 2026-04-08

### Added
- Inicializar repositorio con sistema de gobernanza Kairós.
- Skill `protocolo-adherencia-estricta`.
- Plantillas para manejo de manifiestos `/derive` (`derive-checklist.md`, `derive-working.md`).

### Changed
- Refactorización profunda de workflow `/derive` para mayor rigurosidad en verificación de tareas.
- Optimización de reglas documentales (`02-kairos-trazabilidad-y-operativa` y `04-protocolo-documentacion-proactiva`).
- Actualización de estructura de secciones en `master-spec.md`.

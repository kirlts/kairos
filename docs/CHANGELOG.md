# CHANGELOG

> Todas las notas de cambios para este proyecto serán documentadas en este archivo.
> Formato basado en [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

## [v3.2.7] - 2026-04-25

### Fixed
- **00 Falsy Indexing Bug:** Desplazamiento de todo el índice de reglas (`.agents/rules/`) de `00-05` a `01-06`. Esto mitiga una falla crítica en los parsers de contexto de IDEs agenticos (Cursor, Windsurf) que omitían silenciosamente la inyección de archivos que comenzaban por `00`, causando ceguera cognitiva hacia el REPOMAP Gate.

### Added
- **Semantic IDE Lazy-Loading:** Integración de *YAML frontmatter* con `description` en todas las reglas, acoplando la arquitectura del framework directamente con el indexador semántico de los IDEs para inyectar reglas sólo cuando el contexto lo requiere.
- **Dynamic Context Load Protocol:** Inserción de una tabla de enrutamiento declarativo en `01-behavior.md` que obliga a la IA a cargar *lazy-loading* las demás reglas según el dominio operativo, erradicando la degradación "Lost in the Middle".

### Changed
- **Purificación del Axioma Raíz:** Extracción de todas las reglas lingüísticas (Anti-tells, English Latent Pivot) desde la regla raíz hacia un nuevo archivo `02-linguistics.md`, garantizando que `01-behavior.md` opere exclusivamente como un *Context Firewall* sin contaminación atencional.
## [v3.2.6] - 2026-04-25

### Changed
- Reestructuración profunda del algoritmo de inicialización: la antigua secuencia "Session Boot" fue eliminada de `02-documentation.md` y promovida a la regla constituyente principal en `00-behavior.md` bajo el nombre `[RULE: TASK INITIATION & AUTHORIZATION]`.
- Modificación del Trigger de Atención: el chequeo del REPOMAP ya no está atado a una "inicialización", sino estrictamente anclado al **primer mensaje de la sesión**, garantizando su ejecución antes de cualquier salto exploratorio.
- Implementación de *Positive Directive Mapping*: la consulta del REPOMAP ahora se enmarca declarativamente como "el camino más rápido y optimizado para resolver cualquier petición", alineándose con el sesgo natural del modelo hacia la baja latencia, mitigando el by-pass por *pattern-matching*.
- Expansión de cobertura heurística: el trigger ahora captura explícitamente tanto comandos directos (ej: "ejecuta X") como intenciones ambiguas (ej: "¿cómo funciona Z?"), bloqueando la búsqueda lineal a ciegas.

## [v3.2.5] - 2026-04-25

### Fixed
- Regresión en el workflow `/repomap`: algoritmo de Domain Axiom Detection refactorizado con tres señales diferenciadas. Signal 1 ahora separa `MASTER-SPEC.md` (fila individual como Domain Axiom) del eje documental restante (fila agrupada). Signal 2 acotado estrictamente a archivos no-código; referencias a código fuente elevan el peso del directorio padre en Step 2b, sin crear filas individuales. Signal 3 con recursión explícita en directorios no-código para detectar axiomas de dominio no referenciados en MASTER-SPEC (ej. `INTERNAL-DOCS/`).
- Template `repomap.md`: constraint Scope actualizado para reflejar la separación MASTER-SPEC/eje documental y la restricción de abstracción de nivel de directorio para código fuente.


### Changed
- Endurecimiento del Session Boot en `02-documentation.md`: la lectura de `docs/REPOMAP.md` pasa a ser un hard gate declarativo. La exploración de archivos queda suspendida hasta que el REPOMAP se lea en su totalidad.
- Algoritmo de detección de Domain Axioms en el workflow `/repomap` (Señal 1: referencias en MASTER-SPEC; Señal 2: clasificación por contenido con rubric tabular de 4 criterios).
- Candado Authoring Constraints en la plantilla `repomap.md`: los archivos de gobernanza de Kairós son infraestructura invisible en repos huéspedes; anti-recency bias declarado.
- Corrección de lenguaje ambiguo en `document.md`: `implicitly executes` → declaración directa; `pauses until resolved` → definición de estado de bloqueo.
- Sustitución de la cita débil "Harrison Chase (Agent Harnesses)" por arXiv 2603.16021 en ambos READMEs.
- Manifest actualizado: 7 archivos físicamente existentes incorporados al inventario de v3.2.3 que no constaban en él.

### Changed
- Refactorización algorítmica del workflow `/repomap`. Se implementa el enrutamiento mediante clústeres MECE y el paradigma de Pre-Contextualización Axiomática para evitar la degradación de contexto del LLM.
- Limpieza de la plantilla `repomap.md`. Se suprimen los documentos pre-inyectados para forzar a la IA a mapear la topología orgánicamente.

## [v3.2.2] - 2026-04-25

### Changed
- Refactorización del workflow `/repomap`: prohibición estricta de *placeholders* genéricos (exigiendo deducción activa del directorio) e imposición absoluta de generación en inglés para las filas de la matriz.

## [v3.2.1] - 2026-04-25

### Changed
- Traducción de la plantilla `repomap.md` al inglés para cumplir con la política de *Translation Tax Suppression* (English-Pivoted CoT).

## [v3.2.0] - 2026-04-25

### Added
- Workflow `/repomap` y plantilla `repomap.md`. Genera el mapa de enrutamiento topológico.
- Directiva de exclusión para `LIVING-DOCUMENT.md`. El archivo es accesible y modificable exclusivamente mediante `/narrate`.

### Changed
- Refactorización de `.gitignore`. Kairós inyecta sus exclusiones mandatorias (`.agents/templates/gitignore-append.txt`) al archivo `.gitignore` preexistente del repositorio anfitrión.
- Regla `02-documentation.md` reescrita. El `REPOMAP.md` actúa como único contrato de navegación.
- Regla `03-constraints.md` actualizada. El sistema conserva el imperativo estructural sin directiva de lectura obligatoria.

## [v3.1.2] - 2026-04-15

### Added
- Nuevo Step 0 "Structural Lint" inyectado en el workflow `/document` para correr de forma incondicional en todos los modos, erradicando la persistencia de deuda estructural (missing fields, legacy formats).
- Protocolo de Verificabilidad y Input Validation insertado al comienzo del algoritmo de coherencia en `/document` (Step 0) para denegar la saltarse de campos `[Covered checks: ...]`.
- Cierre estructural obligatorio `HALT` implementado al final del workflow `/test` para estandarizar la convención de conclusión algorítmica.

### Changed
- Eliminada justificación emocional redundante del subproceso "Structural Lint" en el workflow `/document` en adhesión al Declarative System Framing.
- Adjetivos de apreciación genérica (AI slop) sustituidos por directivas operativas estrictas en la sección de mantenimiento de READMEs dentro de `/release`.
- Corregida violación de la regla de *English Latent Pivot* (Pivote Latente Inglés) traduciendo las etiquetas descriptivas mixtas de la sección GATE 7 (identificadores anti-slop) a inglés en las plantillas algorítmicas `derive-working.md` y `checklist-working.md`.

## [v3.1.1] - 2026-04-15

### Added
- Directorio de estructura `.agents/roles/` (.gitkeep) para almacenar identidades locales de gobernanza extraídas por el usuario, omitiéndose del trackeo global (.gitignore) al ser de uso personal.

### Changed
- El modelo operativo `01-operating-model.md` y el compilador de documentos `workflows/document.md` implementan un protocolo estricto de interrupción (hard-fault) ante aprobaciones implícitas de tareas `.HUM`, previniendo inyección accidental de validaciones arquitectónicas.

## [v3.1.0] - 2026-04-14

### Added
- **Translation Tax Suppression** (English-Pivoted CoT) implementado en las reglas para suprimir la degradación de atención en contextos largos e idiomas periféricos.
- **Declarative System Framing** (ADR) implementado a lo largo de todos los flujos de trabajo (*workflows*) y habilidades (*skills*), erradicando el fraseo imperativo, la falsa modestia y el "AI slop".
- Múltiples habilidades y plantillas traducidas a inglés estructural para preservar arquitectura latente pura (`standard-research`, `visual-excellence-protocol`, `conflict-resolution-protocol`, `productive-friction-protocol`, `fertile-void-protocol`, `technical-debt.md`).

### Changed
- Regla operativa `03-constraints.md` convertida de almacén de datos a regla de ejecución dinámica orientada exclusivamente a enforzar el `MASTER-SPEC.md §4/§5`.
- Versión manifestada a v3.1.0 como _baseline_ determinista.
- Actualización íntegra de `02-documentation.md` para sellar la hermeticidad del framework (Regla de Repositorio Localizado).
- Actualización de los READMEs para reflejar el principio fundamentado de diseño por supresión de impuesto de traducción.

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

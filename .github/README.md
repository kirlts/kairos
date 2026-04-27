# Kairós

> Sistema de gobernanza para desarrollo asistido por IA. v3.3.0


## Qué es

Un framework que vive dentro de tu repositorio (`.agents/`) y es operado autónomamente por la IA de codificación. Las reglas, workflows, skills y plantillas están escritas para ser leídas, interpretadas y ejecutadas por el agente sin mediación humana. El usuario define la intención del proyecto; la IA gestiona la ejecución del sistema de gobernanza completo, incluyendo la documentación del proyecto.

**Entorno optimizado:** Antigravity IDE. El framework ha sido desarrollado y validado en este entorno.

**Compatibilidad teórica:** Cursor, Windsurf, Claude Code, Gemini CLI, y cualquier IDE que soporte agentes con acceso al filesystem. Estas implementaciones son plausibles pero no han sido probadas en producción.

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
├── roles/          # Identidades de gobernanza local
├── workflows/      # Flujos invocables (/derive, /test, /fix, etc.)
├── skills/         # Protocolos que se activan por contexto
├── knowledge/      # Material de referencia bajo demanda
└── templates/      # Plantillas para docs del proyecto

docs/
├── REPOMAP.md          # Mapa topológico del repositorio para la IA
├── LIVING-DOCUMENT.md  # Narrativa pedagógica del proyecto (opcional)
├── MASTER-SPEC.md      # Qué se construye, para quién, por qué, y cómo
├── TODO.md             # Tareas con trazabilidad a la especificación
├── MEMORY.md           # Heurísticas transferibles entre sesiones
├── USER-DECISIONS.md   # Registro de decisiones del usuario con su razón
└── CHANGELOG.md        # Historial de cambios
```

## Comandos

| Comando | Función |
|---|---|
| `/derive` | Generar checklist de verificación exhaustivo, integrado con MASTER-SPEC y TODO |
| `/checklist` | Generar checklist standalone para cualquier input (documentos, postulaciones, planes) |
| `/test` | Definir estrategia de testing o ejecutar tests existentes |
| `/fix` | Diagnosticar y resolver deuda técnica |
| `/document` | Sincronizar documentación con el estado real del código |
| `/repomap` | Genera el mapa de enrutamiento y acceso a directorios en REPOMAP.md |
| `/narrate` | Único punto de entrada para generar o actualizar LIVING-DOCUMENT.md con exportación EPUB |
| `/update` | Actualizar Kairós a la última versión |
| `/release` | Generar nueva versión del framework (solo repo canónico) |
| `/role` | Activar una identidad de gobernanza (persona) para la sesión |
| `/create-role` | Extraer una nueva identidad a partir de fuentes primarias |

## Fundamentos técnicos

El framework aplica patrones de adherencia extraídos de investigación empírica (corte: abril 2026). Cada patrón tiene un efecto medido y una implementación concreta. Notablemente, Kairós implementa una política de **Supresión del Impuesto de Traducción**: sus instrucciones y flujos internos operan en inglés para alinearse nativamente con el espacio latente de los modelos frontera, mientras que el output espeja el idioma del usuario (Ej: español).

| Patrón | Efecto medido | Decisión de diseño | Fuente |
|---|---|---|---|
| Declarative System Framing | -81% varianza de adherencia entre idiomas | Las reglas se redactan como hechos del entorno. El tono declarativo es neutro entre idiomas; el tono imperativo genera interferencia de registro que produce varianza sistemática | Imperative Interference: Social Register Shapes Instruction Topology in LLMs (arXiv 2603.25015) |
| Tabular Superiority | +40.29% precisión en lógica condicional | Subconjuntos 🤖/🧑/🤖🧑, LNC y Leyes de Armonía se expresan en tablas. Las tablas fuerzan razonamiento columna a columna, cerrando los atajos probabilísticos que el modelo toma en texto libre | Better Think with Tables: Tabular Structures Enhance LLM Comprehension (arXiv 2412.17189) |
| Primacy/Recency Anchoring | Mitiga Factorial Dead Zone | Las plantillas de trabajo repiten las restricciones clave al inicio y al final del contexto. El paper documenta rendimiento en forma de U: máximo en posición inicial y final, mínimo en el centro | Lost in the Middle: How Language Models Use Long Contexts (Stanford CS, arXiv 2307.03172); Lost in the Middle at Birth (arXiv 2603.10123) |
| State Isolation | Mitiga -39% degradación multi-turno | El ciclo BEFORE/DURING/AFTER reconstruye el estado desde artefactos aislados en cada turno, impidiendo la acumulación de la degradación registrada en conversaciones largas | LLMs Get Lost In Multi-Turn Conversation (OpenReview, NeurIPS) |
| Positive Directive Mapping | -50% desviación comportamental | Las reglas definen el espacio de conducta permitido; las prohibiciones cubren solo los fallos catastróficos. Mapear el espacio positivo reduce un 50% la desviación respecto a sistemas basados únicamente en prohibiciones | ClawSafety: "Safe" LLMs, Unsafe Agents (arXiv 2604.01438) |
| Traceable Identifiers | 80.4% F1 en cadenas lógicas multi-paso | Taxonomía `[ACTOR.CAT.NN.VER]`, IDs `[R-NNN]`, `[LNC-NN]`. Los identificadores explícitos anclan cada verificación a un artefacto concreto, sosteniendo la trazabilidad en razonamientos multi-paso | Evaluating the Use of LLMs for Documentation to Code Traceability (ResearchGate) |
| Translation Tax Suppression | Elimina "Linguistic Heterogeneity Penalty" | Los protocolos internos operan en inglés determinista para alinearse con el espacio latente de la IA, maximizando la comprensión lógica, mientras la interacción y escritura final reflejan el idioma del usuario. | Adherencia Lingüística en IA Frontera (Abril 2026) |

### Gobernanza Topológica (REPOMAP)

El framework impone un "Cortafuegos de Contexto" (Context Firewall) frente a la exploración probabilística de los IDEs agenticos, neutralizando el *Context Rot* y la *Deuda de Verificación*.

| Principio Arquitectónico | Mecanismo y Efecto | Fuente / Justificación |
|---|---|---|
| Axiomatic Pre-Contextualization | Aísla reglas críticas (`MASTER-SPEC`) como "Axiomas de Dominio". Previene que el LLM deduzca reglas normativas a partir de código estadístico (descriptivo). | arXiv 2603.07896 (SMGI: Fact-Value Distinction) |
| Context Firewall | Sustituye la búsqueda vectorial (BM25/Embeddings) del IDE por fronteras declarativas. Elimina las "Alucinaciones Complacientes" causadas por contextos ruidosos. | arXiv 2604.17025 (Convergent AI Agent Framework - CAAF) |
| MECE Clustering | Compresión estricta de la topología en clústeres planos (Mutuamente Excluyentes, Colectivamente Exhaustivos). Maximiza la densidad de señal y previene la dilución de atención. | arXiv 2307.03172 (Lost in the Middle); Andrej Karpathy (LLM OS: RAM vs Hard Drive) |
| Stateless Overwriting | Regeneración *Zero-Shot* del mapa desde la topología física. Erradica el Sesgo de Recencia y la Oscilación Estocástica propios de las actualizaciones diferenciales continuas. | arXiv 2603.16021 (Folder Structure as Agent Architecture); OpenReview NeurIPS (LLMs Get Lost in Multi-Turn Conversation) |

### Asignación de dominio por diseño

Los modelos estadísticos presentan limitaciones empíricas documentadas en la evaluación de *trade-offs* arquitectónicos y la estimación estructural a largo plazo. Por ello, el framework impone una división estricta de tareas basada en la aptitud asimétrica medida:

- **🤖 Subconjunto LLM (Autónomo):** Tareas de micro-lógica computacional, andamiaje sintáctico y tests de funciones puras. Se requiere ejecución y cierre sin intervención.
- **🧑 Subconjunto HUM (Bloqueado para IA):** Diseño arquitectónico conceptual, juicio paramétrico visual y *trade-offs* de impacto irreversible. La resolución autónoma está estrictamente prohibida.
- **🤖🧑 Subconjunto MIX (Verificación bidireccional):** Pruebas de integración, revisión de código compleja y estimaciones. El modelo procesa y estructura el estado actual, pero establece un punto de control obligatorio definiendo qué variables específicas requieren validación del operador antes de continuar.

**Fuentes:** Límites de resolución autónoma en arquitectura sistémica (*SWE-bench Verified*, abril 2026). Divergencia operativa entre seguridad de modelo y seguridad de agente (*ClawSafety: "Safe" LLMs, Unsafe Agents*, arXiv 2604.01438). Brechas de capacidad en predicción estructural (*Estudio Anthropic JIRA dataset JOSSE*, 2025).

### AI Smell

Cuando un LLM genera interfaces sin restricciones de diseño humanas, converge hacia valores paramétricos dominantes en su distribución de entrenamiento. Púrpura-azul (#6366F1), Inter/system-ui, layout simétrico, cards con `rounded-xl` y `p-6`.

Mitigación:

1. **Lista Negra de Convergencia (LNC):** 10 vectores con valores exactos, contexto de aparición y desvío requerido (`.agents/knowledge/ai-smell-registry.md`).
2. **Desvío justificado:** La coincidencia con LNC no se prohíbe; la coincidencia sin justificación sí.
3. **Gate visual de 3 pasos:** Anti-Slop mecánico, Armonía Intencional, Integridad Contextual.

**Fuente:** Síntesis de hallazgos sobre convergencia paramétrica en interfaces generadas por IA (2025-2026). Patrones de detección de escritura IA: Wikipedia, "Signs of AI Writing".

### Erradicación del sesgo de compresión (Falsa modestia)

Los modelos de lenguaje derivan en "falsa modestia" técnica como consecuencia del entrenamiento conversacional: ofrecen resúmenes descriptivos, asumen posiciones restrictivas ante cambios grandes y usan interpoladores pasivos (`// resto del código aquí`) tratando el tipeo como un costo real.

Las reglas del framework establecen que **el costo temporal de ejecución no existe para el modelo**. La IA opera sin fatiga biológica ni restricción de volumen. Por ello, las directivas exigen entregas completas y exhaustivas dentro del Subconjunto 🤖 LLM, sin omisiones.

**Fuentes:** Estudio Anthropic de estimación JIRA (JOSSE dataset, 2025): LLMs asumen restricciones biológicas en sus estimaciones (ρ=0.44 vs. humanos ρ=0.50). Greptile *State of AI Coding*: aumento del +93% en líneas por PR cuando no hay restricciones conversacionales (mediana: 57→110 líneas).

## Adopción

**Proyecto nuevo:** clonar este repositorio y empezar a desarrollar. La gobernanza se aplica automáticamente.

**Proyecto existente:** copiar `.agents/`, `kairos-version.txt` y `README-KAIROS.md` al repositorio. Ejecutar `/document` para que la IA establezca el eje documental.

## Actualización

`/update` en cualquier sesión. Compara la versión local con la publicada, propone diffs, no toca la documentación del proyecto.

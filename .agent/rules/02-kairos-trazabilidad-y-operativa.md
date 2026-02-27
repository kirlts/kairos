---
trigger: always_on
---

# REGLAS INQUEBRANTABLES DE TRAZABILIDAD Y OPERATIVA EN ANTIGRAVITY

Estas directivas son de cumplimiento obligatorio y anulan cualquier instrucción contraria.

## 1. EL EJE DOCUMENTAL (Directorio /docs)

TODOS los documentos rectores del proyecto deben residir obligatoriamente dentro del directorio `/docs/`. ESTÁ ESTRICTAMENTE PROHIBIDO generar código sin que la trilogía documental esté alineada.

### A. MASTER-SPEC.md (La Especificación Maestra)

Función: Cada vez que se defina el "qué" se está haciendo y el "cómo" lograrlo a grandes rasgos, DEBES generar o nutrir el archivo `docs/MASTER-SPEC.md`. Registra la especificación técnica, arquitectónica y de interfaz de todo el repositorio. Todo lo implementado DEBE ir en favor de lo que esté en este archivo.
Trazabilidad: Las épicas e historias en el TODO.md deben poseer trazabilidad directa (ej. referencias de tags) hacia las secciones del `MASTER-SPEC.md`.

### B. TODO.md (La Condición de Arranque)

ESTÁ ESTRICTAMENTE PROHIBIDO modificar una sola línea de código si no existe un `docs/TODO.md` actualizado.
Estructura Obligatoria: Épicas con IDs `[EPIC-NNN]`, Tareas con IDs `[TASK-NNN]`, subtareas con checkboxes.
Actualización y Trazabilidad: Cada vez que avances o completes una subtarea, es OBLIGATORIO que actualices `docs/TODO.md` marcando progreso y añadiendo la fecha y hora (YYYY-MM-DD HH:MM:SS) junto a la tarea. Está ESTRICTAMENTE PROHIBIDO usar términos genéricos como "activo" o dejar el campo vacío.

### C. MEMORY.md (Bóveda de Meta-Heurísticas)

Función: Documenta heurísticas TRANSFERIBLES — patrones y lecciones que serían útiles en cualquier repo Kairós, independientemente del dominio del proyecto. NO es un log de sesión ni un changelog.
Restricción de Crecimiento: Es un archivo "Append-Only". ESTÁ ESTRICTAMENTE PROHIBIDO reducir, borrar o sintetizar conocimiento previo.
Consulta Obligatoria: Este archivo DEBE ser consultado al inicio de cada sesión (ver Rule 04, Paso 0) y antes de tomar decisiones de diseño estructural.
Protocolo Anti-Sesgo: Antes de escribir una heurística, se DEBE seguir el procedimiento del Rule 04 (verificación con búsqueda web + confirmación del usuario si no hay fuente externa).

### D. USER-DECISIONS.md (Registro de Agencia Humana)

Función: Documenta las decisiones significativas del humano, las alternativas descartadas, y las condiciones bajo las cuales reconsiderar la decisión. Responde: ¿quién decidió esto? ¿por qué no se fue por otro camino?
Formato obligatorio: Cada entrada sigue el formato ADR adaptado con 5 campos: Contexto, Decisión, Alternativas Descartadas, Consecuencias, Condiciones de Reversión.
Trazabilidad: La IA redacta la entrada; el usuario confirma con "ok" o similar antes de guardar.

### E. CHANGELOG.md (Historial de Cambios)

Función: Historial versionado de cambios del proyecto. Formato Keep a Changelog.
Actualización: La IA añade entradas a la sección `[Unreleased]` al completar trabajo. Al hacer un release, la sección se mueve a una versión numerada.

### F. PROTOCOLO ANTI-PRISA (Precedencia Operativa Absoluta)

OBLIGACIÓN ANTES DE LA ACCIÓN: Es una violación directa de Kairós modificar sistemas o crear infraestructura (Docker, archivos grandes, instalaciones pesadas) como respuesta inmediata a una orden, sin antes asentar la "Condición de Arranque" y las variables de contexto de manera completa y reflexiva.
Pausa Estratégica: Antes de iniciar ejecuciones terminales complejas o manipular código, DEBES asentar tu intención y el plan detallado en los archivos `/docs`. La CELERIDAD NO es justificación para la OMISIÓN DOCUMENTAL. Piensa primero, planifica el entorno y documenta. Actúa solo cuando la documentación sea exacta.

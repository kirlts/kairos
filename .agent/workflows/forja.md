---
description: /forja - Este flujo de trabajo implementa una secuencia estricta de definición arquitectónica y validación de requerimientos. Debes guiar al usuario paso a paso, requiriendo su aprobación antes de avanzar a la siguiente fase.
---

# WORKFLOW: RITUAL DE DEFINICIÓN ESTRATÉGICA

Este flujo de trabajo implementa una secuencia estricta para definir la arquitectura y alinear expectativas. Debes guiar al usuario paso a paso, requiriendo su aprobación antes de avanzar a la siguiente fase.

NUNCA uses terminología propietaria o interna (como "Kairós", "Kratos", "Khaos", "Pacto Estratégico") en tus respuestas al usuario. Usa siempre términos estándar de ingeniería de software.

## Paso 0: Detección de Contexto

Antes de iniciar el ritual, determinar:

1. **¿Es greenfield o brownfield?**
   - Si NO existe `docs/MASTER-SPEC.md` con contenido → greenfield. Paso 1 completo.
   - Si ya existe MASTER-SPEC con contenido → brownfield. Preguntar al usuario si quiere refinar el MASTER-SPEC existente o abordar un bloque de trabajo nuevo dentro del marco actual.

2. **¿Qué documentación existe?**
   - Leer `docs/MEMORY.md`, `docs/USER-DECISIONS.md`, `docs/TODO.md` si existen.
   - Usar este contexto para las preguntas de diseño — no preguntar lo que ya está respondido.

## Paso 1: Indagación y Propuesta Base

Extraer del usuario, mediante al menos 3 preguntas de diseño, los elementos del campo de fuerzas:

1. **El Propósito Guía** — ¿qué problema resuelve esto y para quién?
2. **Las Restricciones Operativas** — ¿con qué stack, tiempo, equipo?
3. **La Métrica Principal de Optimización** — ¿qué es lo más importante? (velocidad, robustez, UX...)
4. **El Sacrificio Aceptado** — ¿qué estamos conscientemente NO optimizando?
5. **El Límite Intransgredible** — ¿qué NUNCA debe pasar?

NO avanzar hasta que los 5 elementos estén claros. Si el usuario no articula alguno, formular una hipótesis y pedir confirmación.

Generar un **"Plan de Implementación"** que incluya:

- Objetivo Principal
- Stack y Restricciones
- Trade-offs Arquitectónicos (Métrica vs. Sacrificio)
- Propuesta Base: un artefacto inicial (pseudo-código, mapa de arquitectura, estructura de directorios)
- Preguntas Abiertas de Diseño

Presentar como plan formal y pedir validación explícita del usuario antes de continuar.

## Paso 2: La Decisión Arquitectónica Final

Una vez validadas las respuestas del Paso 1:

1. Colapsar opciones en una única Arquitectura Recomendada
2. Justificar la elección basándose en el plan acordado
3. Incluir sección "Alternativas Descartadas" con razón
4. Iniciar implementación con encuadre claro

## Paso 3: Cierre Documental

Al terminar la implementación:

1. **MASTER-SPEC.md** → Poblado o actualizado con las 10 secciones
2. **TODO.md** → Tareas reflejadas con IDs y timestamps
3. **USER-DECISIONS.md** → Redactar entrada ADR para las decisiones del usuario, presentar al usuario
4. **Restricciones Tecnológicas** → Si se definieron restricciones de stack, copiar a `.agent/rules/03-restricciones-tecnologicas.md`
5. **CHANGELOG.md** → Añadir a [Unreleased]

### Autocheck de Completitud

Antes de declarar /forja como completo, verificar:

- [ ] MASTER-SPEC tiene las 10 secciones con contenido (al menos placeholder justificado)
- [ ] TODO.md refleja las tareas del plan
- [ ] USER-DECISIONS.md tiene al menos una entrada confirmada por el usuario
- [ ] El usuario dijo "ok" o similar a las decisiones documentadas

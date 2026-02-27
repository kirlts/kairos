---
description: /document - Sincronización exhaustiva de documentación con código
---

# WORKFLOW: SINCRONIZACIÓN DOCUMENTAL

Este workflow asegura que toda la documentación del proyecto refleja fielmente el estado actual del código y la arquitectura.

## Paso 1: Inventario de Estado

Leer todos los archivos del eje documental:

- `docs/MASTER-SPEC.md`
- `docs/TODO.md`
- `docs/MEMORY.md`
- `docs/USER-DECISIONS.md`
- `docs/CHANGELOG.md`
- `docs/TEST.md` (si existe)
- `docs/DEUDA-TECNICA.md` (si existe)

## Paso 2: Comparación con Realidad

Para cada documento, verificar:

- ¿El MASTER-SPEC refleja la arquitectura actual del código?
- ¿El TODO.md tiene tareas completadas sin timestamp?
- ¿Hay decisiones observables en el código que no están en USER-DECISIONS.md?
- ¿Hay cambios recientes que no están en CHANGELOG.md?

## Paso 3: Diagnóstico de Brechas

Generar una tabla de brechas:

| Documento | Brecha detectada | Severidad | Acción propuesta |
| --- | --- | --- | --- |

## Paso 4: Propuesta de Actualización

Para cada brecha, proponer la corrección específica. No hacer cambios sin aprobación del usuario en brechas de severidad Alta.

## Paso 5: Ejecución

Aplicar las correcciones aprobadas.

## Paso 6: Validación Final

Verificar que todos los documentos son coherentes entre sí:

- MASTER-SPEC §1 ↔ TODO.md épicas
- MASTER-SPEC §4 ↔ restricciones en `.agent/rules/03`
- USER-DECISIONS.md ↔ trade-offs en MASTER-SPEC §5
